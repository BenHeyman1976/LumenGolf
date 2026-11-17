// chk_Diggle  (spec §7.13)
// Diggle自身の出力を照合用に保持する。並行運用時のみ使用。
// Diggleの稼働中は、その出力をここに保持して照合する。照合したい数値ごとに1行。
// Diggle廃止時にはこのクエリを削除すること。
// 恒久的な統制としてはならない理由は第5.1節に記載している。
//
// Diggle's own output, keyed for comparison. Parallel-run only.
// While Diggle is still running, hold its output here and compare. One row per
// figure to be tied out. Delete this query when Diggle is retired --
// Section 5.1 explains why it must not become the permanent control.
let
    T = #table(
        type table [Scenario = text, Section = text, Diggle = number],
        {
            {"Actual", "Revenue", 1476550791},
            {"Actual", "COGS",     578712037}
        }
    )
in
    T
