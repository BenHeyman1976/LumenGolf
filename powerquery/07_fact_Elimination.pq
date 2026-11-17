// fact_Elimination  (spec §7.7)
// 消去項目ごとに、月次・予算実績区分ごとの「マイナスの行」を1行生成する。
//
// 設計方針：消去は相殺する行として「追加」するものであり、元データから削除しない。
// これにより、合算・消去・連結を常に並べて表示でき、出力の追跡可能性が保たれる。
// 並行運用時にDiggleとの照合を行ううえでも、この方式が必要である。
//
// DESIGN DECISION: eliminations are ADDED as offsetting rows, never deleted from
// the source data. This means the report can always show gross, the elimination,
// and net side by side -- which is what makes the output auditable, and what makes
// it possible to prove the model against Diggle during the parallel run.
let
    Src   = Table.Buffer(fact_Source),

    // 会社と勘定科目コードの双方で特定した、1科目の月次合計。
    // Monthly total of one entity+account, keyed on Entity AND AccountCode.
    Grab  = (ent as text, code as text) as table =>
        Table.Buffer(
            Table.Group(
                Table.SelectRows(Src, each [Entity] = ent and [AccountCode] = code),
                {"Date", "Scenario"},
                {{"Amt", each List.Sum([Amount]), type number}})),

    B6530 = Grab("RELO", "6530"),
    B5255 = Grab("H&R",  "5255"),
    B5135 = Grab("H&R",  "5135"),
    B5360 = Grab("RELO", "5360"),
    B5145 = Grab("RELO", "5145"),
    B6360 = Grab("H&R",  "6360"),

    Look  = (t as table, d as date, s as text) as number =>
        let
            r = Table.SelectRows(t, each [Date] = d and [Scenario] = s)
        in
            if Table.RowCount(r) = 0 then 0 else List.Sum(r[Amt]),

    // 元データに存在する月・予算実績区分の組み合わせごとに1行
    // One row per month per scenario present in the source
    Spine = Table.Distinct(Table.SelectColumns(Src, {"Date", "Scenario"})),

    Calc  = Table.AddColumn(
                Spine, "E",
                each
                    let
                        d     = [Date],
                        s     = [Scenario],
                        r6530 = Look(B6530, d, s),
                        h5255 = Look(B5255, d, s),
                        h5135 = Look(B5135, d, s)
                    in
                        [
                            // EL1は算出値。5230には内部取引と外部売上が合算されており、
                            // 出力に補助科目の内訳がないため。第3.3節参照。
                            // EL1 is DERIVED: 5230 mixes inter-company and external
                            // revenue, and the export gives no sub-account split.
                            // See Section 3.3.
                            EL1 = r6530 - h5255 - h5135,
                            EL2 = h5255,
                            EL3 = h5135,
                            EL4 = Look(B5360, d, s),
                            EL5 = Look(B5145, d, s),
                            EL6 = r6530,
                            EL7 = Look(B6360, d, s)
                        ]),

    Spread = Table.ExpandRecordColumn(Calc, "E", {"EL1","EL2","EL3","EL4","EL5","EL6","EL7"}),
    Long   = Table.UnpivotOtherColumns(Spread, {"Date", "Scenario"}, "ElimID", "Gross"),
    NonZ   = Table.SelectRows(Long, each [Gross] <> 0 and [Gross] <> null),

    Reg    = Table.NestedJoin(NonZ, {"ElimID"}, ref_Elimination, {"ElimID"}, "r", JoinKind.Inner),
    RegX   = Table.ExpandTableColumn(Reg, "r", {"Entity", "AccountCode", "AccountName", "Section"}),

    Neg    = Table.AddColumn(RegX, "Amount", each - [Gross], type number),
    WithSn = Table.NestedJoin(Neg, {"Section"}, ref_Section, {"Section"}, "s", JoinKind.LeftOuter),
    WithSx = Table.ExpandTableColumn(WithSn, "s", {"SectionNo", "Sign"}),

    Typed  = Table.AddColumn(WithSx, "RecordType", each "Elimination", type text),
    Typed2 = Table.AddColumn(Typed,  "EntityCode", each if [Entity] = "H&R" then "HR" else "RJ", type text),

    Out    = Table.SelectColumns(
                 Typed2,
                 {"Entity", "EntityCode", "AccountCode", "AccountName",
                  "Section", "SectionNo", "Sign", "Date", "Scenario",
                  "Amount", "RecordType", "ElimID"})
in
    Out
