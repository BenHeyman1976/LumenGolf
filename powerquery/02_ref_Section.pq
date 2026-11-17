// ref_Section  (spec §7.2)
// 奉行の損益計算書において、各区分を締めくくるPコード小計と、利益へ集計する際の符号。
// 出典：損益計算書シートの構成。
// Which P-code subtotal closes each section of the Bugyo P&L, and the sign that
// section carries when rolling up to profit. Source: the 損益計算書 sheet layout.
let
    T = #table(
        type table [PCode = text, Section = text, SectionNo = Int64.Type, Sign = Int64.Type],
        {
            {"P1000", "Revenue",               1,  1},
            {"P1100", "COGS",                  2, -1},
            {"P3001", "SG&A Personnel",        3, -1},
            {"P3002", "SG&A Other",            4, -1},
            {"P4110", "Non-operating income",  5,  1},
            {"P4120", "Non-operating expense", 6, -1},
            {"P5110", "Extraordinary income",  7,  1},
            {"P5120", "Extraordinary loss",    8, -1},
            {"P6110", "Tax",                   9, -1}
        }
    )
in
    T
