// fn_LoadEntity  (spec §7.4, SharePoint variant)
// 奉行の予算実績対比表を1ファイル読み込み、縦持ち形式で返す。
// 1行 = 会社 / 勘定科目 / 月 / 予算実績区分。
// Reads one Bugyo 予算実績対比表 export and returns it in long format:
// one row per Entity / Account / Month / Scenario.
//
// SharePoint variant: reads files directly from the client's SharePoint site
// via SharePoint.Contents. No files leave the tenant, access follows SharePoint
// permissions, no per-user local path setup.
(FileName as text, EntityName as text, EntityCode as text) as table =>
let
    // --- SharePointサイトからファイルを取得する。
    //     サイト → Shared Documents → p_FolderPath で指定されたサブフォルダー → 対象ファイル
    // --- Fetch the file from SharePoint:
    //     site → "Shared Documents" library → sub-folder named by p_FolderPath → the file.
    Site       = SharePoint.Contents(p_SharePointSite, [ApiVersion = 15]),
    Documents  = Site{[Name = "Shared Documents"]}[Content],

    // p_FolderPath を / で分割し、各セグメントごとに1階層ずつ下る。
    // Walk p_FolderPath segment-by-segment so the parameter can contain any depth.
    Segments   = List.Select(Text.Split(p_FolderPath, "/"), each _ <> ""),
    Folder     = List.Accumulate(
                     Segments,
                     Documents,
                     (current, seg) => current{[Name = seg]}[Content]),

    FileEntry  = Folder{[Name = FileName]}[Content],
    Source     = Excel.Workbook(FileEntry, null, true),

    Sheet      = Source{[Item = "損益計算書", Kind = "Sheet"]}[Data],

    // --- 見出し行は行番号ではなく内容で特定する。現在はその上に6行の
    //     メタデータ行があるが、これが変わっても動作する。
    // --- Locate the header row by content, never by row number. Bugyo puts six
    //     metadata rows above it today; if that changes, this still works.
    ColB      = List.Transform(
                    Table.Column(Sheet, "Column2"),
                    each if _ = null then "" else Text.Trim(Text.From(_))),
    HeaderIdx = List.PositionOf(ColB, "科目名"),
    Guarded   = if HeaderIdx < 0
                then error Error.Record(
                        "RNA.HeaderNotFound",
                        "Could not find 科目名 in column B of " & FileName
                        & ". The export layout has changed -- do not load this file.")
                else HeaderIdx,
    Body      = Table.Skip(Sheet, Guarded),
    Promoted  = Table.PromoteHeaders(Body, [PromoteAllScalars = true]),

    // --- 月次の発生額の列のみを残す。
    //     (発生) = その月の発生額、(残高) = 期末累計残高。
    //     (残高) の列を取り込むと、モデル内のすべての数値がほぼ倍になる。
    // --- Keep monthly movement columns only.
    //     (発生) = movement in the month.  (残高) = year-to-date balance.
    //     Loading the (残高) columns roughly doubles every figure in the model.
    MonthCols = List.Select(Table.ColumnNames(Promoted), each Text.Contains(_, "(発生)")),
    GuardCols = if List.Count(MonthCols) = 0
                then error Error.Record(
                        "RNA.NoMonthlyColumns",
                        "No (発生) columns found in " & FileName)
                else MonthCols,
    Kept      = Table.SelectColumns(Promoted, List.Combine({{"コード", "科目名"}, GuardCols})),
    Renamed   = Table.RenameColumns(Kept, {{"コード", "AccountCode"}, {"科目名", "AccountName"}}),
    Clean     = Table.TransformColumns(
                    Renamed,
                    {
                        {"AccountCode", each if _ = null then "" else Text.Trim(Text.From(_)), type text},
                        {"AccountName", each if _ = null then "" else Text.Trim(Text.From(_)), type text}
                    }),
    NumTyped  = Table.TransformColumnTypes(Clean, List.Transform(GuardCols, each {_, type number})),
    Indexed   = Table.AddIndexColumn(NumTyped, "RowNo", 0, 1, Int64.Type),

    // --- 各明細行を、その「下」にある区分小計に割り当てる。
    // --- Assign each detail row to the section subtotal that sits BELOW it.
    PCodeList   = ref_Section[PCode],
    SectionRows = Table.SelectRows(Indexed, each List.Contains(PCodeList, [AccountCode])),
    SecRowNo    = List.Buffer(SectionRows[RowNo]),
    SecPCode    = List.Buffer(SectionRows[AccountCode]),

    // 明細行は4桁の数字コードを持つ行。Pコード行と空白行はここで除かれる。
    // Detail rows are the ones with a 4-digit numeric code. P-code rows and any
    // blank spacer rows drop out here.
    Detail    = Table.SelectRows(
                    Indexed,
                    each Text.Length([AccountCode]) = 4
                     and Text.Select([AccountCode], {"0".."9"}) = [AccountCode]),
    WithPCode = Table.AddColumn(
                    Detail, "PCode",
                    (row) =>
                        let
                            Below = List.Select(SecRowNo, each _ > row[RowNo]),
                            // Number.Min ではなく List.Min。Mに Number.Min は存在しない。
                            // List.Min, not Number.Min -- Number.Min does not exist in M
                            First = if List.Count(Below) = 0 then null else List.Min(Below),
                            Pos   = if First = null then -1 else List.PositionOf(SecRowNo, First)
                        in
                            if Pos < 0 then null else SecPCode{Pos},
                    type text),

    Joined    = Table.NestedJoin(WithPCode, {"PCode"}, ref_Section, {"PCode"}, "sec", JoinKind.LeftOuter),
    Expanded  = Table.ExpandTableColumn(Joined, "sec", {"Section", "SectionNo", "Sign"}),

    // --- どの区分にも属さないコード付きの行は、様式変更の兆候である。
    //     黙って金額を失うのではなく、明示的にエラーとする。
    // --- A coded row that falls outside every P&L section is a layout change.
    //     Fail loudly rather than silently losing money.
    Orphans   = Table.SelectRows(Expanded, each [Section] = null),
    GuardOrph = if Table.RowCount(Orphans) > 0
                then error Error.Record(
                        "RNA.UnmappedAccount",
                        "Account rows fall outside every P&L section in " & FileName,
                        Text.Combine(List.Distinct(Orphans[AccountCode]), ", "))
                else Expanded,

    // --- 24の月次列を24行に展開する。
    // --- 24 monthly columns become 24 rows.
    Unpivoted = Table.UnpivotOtherColumns(
                    GuardOrph,
                    {"AccountCode", "AccountName", "RowNo", "PCode", "Section", "SectionNo", "Sign"},
                    "Header", "Amount"),

    // --- "2025年  4月実績(発生)" -> Date = 2025年4月1日、Scenario = Actual
    // --- "2025年  4月実績(発生)" -> Date = 1 Apr 2025, Scenario = Actual
    WithDate  = Table.AddColumn(
                    Unpivoted, "Date",
                    each #date(
                            Number.From(Text.Start([Header], 4)),
                            Number.From(Text.Trim(Text.BetweenDelimiters([Header], "年", "月"))),
                            1),
                    type date),
    WithScen  = Table.AddColumn(
                    WithDate, "Scenario",
                    each if Text.Contains([Header], "予算") then "Budget" else "Actual",
                    type text),

    Tagged    = Table.AddColumn(WithScen, "Entity",     each EntityName, type text),
    Tagged2   = Table.AddColumn(Tagged,   "EntityCode", each EntityCode, type text),
    Tagged3   = Table.AddColumn(Tagged2,  "RecordType", each "Source",   type text),
    Tagged4   = Table.AddColumn(Tagged3,  "ElimID",     each null,       type text),

    Zeroed    = Table.ReplaceValue(Tagged4, null, 0, Replacer.ReplaceValue, {"Amount"}),
    NonZero   = Table.SelectRows(Zeroed, each [Amount] <> 0),

    Out       = Table.SelectColumns(
                    NonZero,
                    {"Entity", "EntityCode", "AccountCode", "AccountName",
                     "Section", "SectionNo", "Sign", "Date", "Scenario",
                     "Amount", "RecordType", "ElimID"})
in
    Out
