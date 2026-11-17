// fact_IJ  (spec §7.5)
// イミグレーションジャパン。2026年1月より営業開始。
// 出典：「IJ data coversion.xlsx」シート「ORG data」を手入力で転記したもの。
// モデル内で唯一の手入力データである。IJの予算実績対比表が整備され次第、
// このクエリは削除し、他社と同様に fn_LoadEntity で読み込むこと。
// IJの予算は提供されていないため実績のみ。
// SOURCE: "IJ data coversion.xlsx", sheet "ORG data" -- transcribed by hand.
// This is the only hand-keyed input in the model. Replace it with a Bugyo
// 予算実績対比表 export for IJ as soon as one is available.
// No budget was provided for IJ, so Actual only.
let
    T = #table(
        type table [Date = date, Section = text, Amount = number],
        {
            {#date(2026, 1, 1), "Revenue", 3603746},
            {#date(2026, 2, 1), "Revenue", 2160162},
            {#date(2026, 3, 1), "Revenue", 3656682},
            {#date(2026, 1, 1), "COGS",     102781},
            {#date(2026, 2, 1), "COGS",      54271},
            {#date(2026, 3, 1), "COGS",     121147}
        }
    ),
    Shaped = Table.AddColumn(T, "Entity",      each "Immigration Japan", type text),
    S2     = Table.AddColumn(Shaped, "EntityCode",  each "IJ", type text),
    S3     = Table.AddColumn(S2, "AccountCode", each if [Section] = "Revenue" then "5900" else "6900", type text),
    S4     = Table.AddColumn(S3, "AccountName", each if [Section] = "Revenue" then "IJ revenue (manual)" else "IJ cost (manual)", type text),
    S5     = Table.AddColumn(S4, "SectionNo",  each if [Section] = "Revenue" then 1 else 2, Int64.Type),
    S6     = Table.AddColumn(S5, "Sign",       each if [Section] = "Revenue" then 1 else -1, Int64.Type),
    S7     = Table.AddColumn(S6, "Scenario",   each "Actual", type text),
    S8     = Table.AddColumn(S7, "RecordType", each "Source",  type text),
    S9     = Table.AddColumn(S8, "ElimID",     each null,      type text),
    Out    = Table.SelectColumns(
                 S9,
                 {"Entity", "EntityCode", "AccountCode", "AccountName",
                  "Section", "SectionNo", "Sign", "Date", "Scenario",
                  "Amount", "RecordType", "ElimID"})
in
    Out
