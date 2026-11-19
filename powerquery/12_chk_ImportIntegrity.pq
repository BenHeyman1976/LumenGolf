// chk_ImportIntegrity  (spec §7.12, SharePoint variant)
// 検証A。各ファイルが自ら表示しているPコード小計を読み取り、取り込んだ内容と照合する。
// Variance はすべて 0 でなければならない。0以外の行がある場合は、取り込みで欠落または
// 重複が生じている。レポートのいかなる数値も信頼する前に原因を調査すること。
// Control A. Reads each source file's own stated P-code subtotals and compares them
// to what the import loaded. Every Variance must be 0. A non-zero row means the
// import dropped or duplicated something -- investigate before trusting any number
// in the report.
//
// SharePoint variant: reads files directly from the client's SharePoint via
// SharePoint.Contents. Same files as fn_LoadEntity, resolved the same way, so
// Stated and Imported are guaranteed to come from the same bytes.
let
    // 共通：SharePointから「Shared Documents / p_FolderPath」のフォルダを取得する。
    // Common: resolve the SharePoint folder "Shared Documents / p_FolderPath".
    Site       = SharePoint.Contents(p_SharePointSite, [ApiVersion = 15]),
    Documents  = Site{[Name = "Shared Documents"]}[Content],
    Segments   = List.Select(Text.Split(p_FolderPath, "/"), each _ <> ""),
    Folder     = List.Accumulate(
                     Segments,
                     Documents,
                     (current, seg) => current{[Name = seg]}[Content]),

    ReadSubtotals = (FileName as text, EntityName as text) as table =>
        let
            FileEntry = Folder{[Name = FileName]}[Content],
            Source    = Excel.Workbook(FileEntry, null, true),
            Sheet     = Source{[Item = "損益計算書", Kind = "Sheet"]}[Data],
            ColB      = List.Transform(Table.Column(Sheet, "Column2"),
                                       each if _ = null then "" else Text.Trim(Text.From(_))),
            HeaderIdx = List.PositionOf(ColB, "科目名"),
            Body      = Table.Skip(Sheet, HeaderIdx),
            Promoted  = Table.PromoteHeaders(Body, [PromoteAllScalars = true]),
            MonthCols = List.Select(Table.ColumnNames(Promoted), each Text.Contains(_, "(発生)")),
            Kept      = Table.SelectColumns(Promoted, List.Combine({{"コード"}, MonthCols})),
            Renamed   = Table.RenameColumns(Kept, {{"コード", "PCode"}}),
            Clean     = Table.TransformColumns(Renamed,
                            {{"PCode", each if _ = null then "" else Text.Trim(Text.From(_)), type text}}),
            OnlyP     = Table.SelectRows(Clean, each List.Contains(ref_Section[PCode], [PCode])),
            Long      = Table.UnpivotOtherColumns(OnlyP, {"PCode"}, "Header", "Stated"),
            WithDate  = Table.AddColumn(Long, "Date",
                            each #date(Number.From(Text.Start([Header], 4)),
                                       Number.From(Text.Trim(Text.BetweenDelimiters([Header], "年", "月"))), 1),
                            type date),
            WithScen  = Table.AddColumn(WithDate, "Scenario",
                            each if Text.Contains([Header], "予算") then "Budget" else "Actual", type text),
            WithEnt   = Table.AddColumn(WithScen, "Entity", each EntityName, type text),
            // 出力では 法人税等 (P6110) が負で表示される一方、明細行9000は正である。
            // 同じ条件で比較するため符号を反転する。
            // The export states 法人税等 (P6110) as a negative while its own detail
            // row 9000 is positive. Flip it so the comparison is like for like.
            Fixed     = Table.AddColumn(WithEnt, "StatedAdj",
                            each if [PCode] = "P6110" then - [Stated] else [Stated], type number),
            Out       = Table.SelectColumns(Fixed, {"Entity", "PCode", "Date", "Scenario", "StatedAdj"})
        in
            Out,

    Stated = Table.Combine({
                 ReadSubtotals(p_FileHR,   "H&R"),
                 ReadSubtotals(p_FileRELO, "RELO"),
                 ReadSubtotals(p_FileRNAG, "RNA Group")}),
    StatedS = Table.Group(Stated, {"Entity", "PCode"},
                  {{"Stated", each List.Sum([StatedAdj]), type number}}),
    StatedP = Table.NestedJoin(StatedS, {"PCode"}, ref_Section, {"PCode"}, "s", JoinKind.Inner),
    StatedX = Table.ExpandTableColumn(StatedP, "s", {"Section"}),

    // 実際に取り込んだ内容 -- 元データの行のみ、消去の行は含めない
    // What the import actually loaded -- source rows only, no eliminations
    Loaded  = Table.Group(
                  Table.SelectRows(fact_Source, each [RecordType] = "Source"
                                               and [Entity] <> "Immigration Japan"),
                  {"Entity", "Section"},
                  {{"Imported", each List.Sum([Amount]), type number}}),

    Joined  = Table.NestedJoin(StatedX, {"Entity", "Section"}, Loaded, {"Entity", "Section"}, "l", JoinKind.LeftOuter),
    Exp     = Table.ExpandTableColumn(Joined, "l", {"Imported"}),
    Filled  = Table.ReplaceValue(Exp, null, 0, Replacer.ReplaceValue, {"Imported"}),
    Var     = Table.AddColumn(Filled, "Variance", each [Imported] - [Stated], type number),
    Out     = Table.Sort(Table.SelectColumns(Var, {"Entity", "Section", "Stated", "Imported", "Variance"}),
                         {{"Entity", Order.Ascending}, {"Section", Order.Ascending}})
in
    Out
