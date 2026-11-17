// fact_Source  (spec §7.6)
// 3つの法人とイミグレーションジャパンを結合する。
// 4社目のファイルを追加する場合も1行追加するだけでよい。
// The three legal entities plus Immigration Japan, appended.
// Adding a fourth entity file is one more line.
let
    HR   = fn_LoadEntity(p_FileHR,   "H&R",       "HR"),
    RELO = fn_LoadEntity(p_FileRELO, "RELO",      "RJ"),
    RNAG = fn_LoadEntity(p_FileRNAG, "RNA Group", "RNAG"),
    IJ   = fact_IJ,
    All  = Table.Combine({HR, RELO, RNAG, IJ})
in
    All
