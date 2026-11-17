// dim_Entity  (spec §7.10)
// dim_Entity[EntityCode] と fact_PL[EntityCode] を一対多で関連付ける。
// Relate dim_Entity[EntityCode] to fact_PL[EntityCode], one-to-many.
let
    T = #table(
        type table [EntityCode = text, Entity = text, LegalName = text,
                    InConsolidation = logical, SortOrder = Int64.Type],
        {
            {"HR",   "H&R",               "株式会社エイチアンドアールコンサルタンツ", true, 1},
            {"RJ",   "RELO",              "株式会社リロジャパン",                     true, 2},
            {"RNAG", "RNA Group",         "株式会社RNA Group",                        true, 3},
            {"IJ",   "Immigration Japan", "Immigration Japan",                        true, 4}
        }
    )
in
    T
