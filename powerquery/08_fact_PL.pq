// fact_PL  (spec §7.8)
// 元データの行と消去の行を結合したもの。レポートが使用する唯一のファクトテーブル。
// Source rows plus elimination rows. This is the only fact table the report uses.
//
// 重要 / IMPORTANT:
//   fact_Source、fact_Elimination、fact_IJ、ref_Section、ref_Elimination は
//   クエリを右クリックして「読み込みを有効にする = オフ」に設定してください。
//   モデルに読み込むのは fact_PL、ディメンションテーブル、検証クエリのみです。
//
//   Set fact_Source, fact_Elimination, fact_IJ, ref_Section, ref_Elimination to
//   "Enable load = off" (right-click the query). Only fact_PL, the dimension
//   tables and the two check queries should load.
let
    All = Table.Combine({fact_Source, fact_Elimination}),
    Typed = Table.TransformColumnTypes(
                All,
                {
                    {"Entity", type text}, {"EntityCode", type text},
                    {"AccountCode", type text}, {"AccountName", type text},
                    {"Section", type text}, {"SectionNo", Int64.Type},
                    {"Sign", Int64.Type}, {"Date", type date},
                    {"Scenario", type text}, {"Amount", type number},
                    {"RecordType", type text}, {"ElimID", type text}
                })
in
    Typed
