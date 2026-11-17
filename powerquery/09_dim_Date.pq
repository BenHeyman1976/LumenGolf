// dim_Date  (spec §7.9)
// 日本の会計年度：4月〜3月。FY2025 = 2025年4月〜2026年3月。
// Japanese fiscal year: April to March. FY2025 = Apr 2025 to Mar 2026.
//
// モデルビューで dim_Date を選択し「日付テーブルとしてマーク → Date」。
// dim_Date[Date] と fact_PL[Date] を一対多・単一方向で関連付ける。
// MonthName と FYMonthLabel は FiscalMonthNo で並べ替える
// （4月→3月の順で表示するため）。
//
// In Model view: dim_Date → Mark as date table → Date.
// Relate dim_Date[Date] to fact_PL[Date], one-to-many, single direction.
// Sort MonthName and FYMonthLabel by FiscalMonthNo so the report runs
// April to March rather than alphabetically.
let
    Start = #date(2024, 4, 1),
    End   = #date(2027, 3, 31),
    Days  = List.Dates(Start, Duration.Days(End - Start) + 1, #duration(1, 0, 0, 0)),
    T     = Table.FromList(Days, Splitter.SplitByNothing(), {"Date"}),
    D     = Table.TransformColumnTypes(T, {{"Date", type date}}),
    A1    = Table.AddColumn(D, "Year",        each Date.Year([Date]), Int64.Type),
    A2    = Table.AddColumn(A1, "MonthNo",    each Date.Month([Date]), Int64.Type),
    A3    = Table.AddColumn(A2, "MonthName",  each Date.ToText([Date], "MMM", "en-GB"), type text),
    A4    = Table.AddColumn(A3, "MonthStart", each Date.StartOfMonth([Date]), type date),
    A5    = Table.AddColumn(A4, "FiscalYear", each if Date.Month([Date]) >= 4
                                                  then Date.Year([Date])
                                                  else Date.Year([Date]) - 1, Int64.Type),
    A6    = Table.AddColumn(A5, "FYLabel",    each "FY" & Text.From([FiscalYear]), type text),
    A7    = Table.AddColumn(A6, "FiscalMonthNo", each if Date.Month([Date]) >= 4
                                                     then Date.Month([Date]) - 3
                                                     else Date.Month([Date]) + 9, Int64.Type),
    A8    = Table.AddColumn(A7, "FYMonthLabel", each [MonthName] & " " & Text.End(Text.From(Date.Year([Date])), 2), type text)
in
    A8
