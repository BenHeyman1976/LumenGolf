// dim_Scenario  (spec §7.11)
// dim_Scenario[Scenario] と fact_PL[Scenario] を一対多で関連付ける。
// Relate dim_Scenario[Scenario] to fact_PL[Scenario], one-to-many.
let
    T = #table(
        type table [Scenario = text, SortOrder = Int64.Type],
        {{"Actual", 1}, {"Budget", 2}}
    )
in
    T
