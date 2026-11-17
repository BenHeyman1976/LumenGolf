// ref_Elimination  (spec §7.3)
// 第3.2節の消去項目一覧。
// 会社（Entity）と勘定科目コード（AccountCode）の組み合わせで特定する。
// 勘定科目コード単独では特定しない。H&Rとリロジャパンは5135・5230・6530を
// まったく別の勘定科目として使用しているため。
// The elimination register of Section 3.2.
// Keyed on Entity + AccountCode -- never AccountCode alone, because H&R and RELO
// both use 5135, 5230 and 6530 for completely different accounts.
let
    T = #table(
        type table [ElimID = text, Entity = text, AccountCode = text,
                    AccountName = text, Section = text, Description = text],
        {
            {"EL1", "H&R",  "5230", "ﾘﾛｹｰｼｮﾝｻｰﾋﾞｽ売上",        "Revenue",
             "Relocation service referral billed to RELO (RMC sub-account portion)"},
            {"EL2", "H&R",  "5255", "運転免許書換ｻﾎﾟｰﾄ売上",      "Revenue",
             "Driving licence conversion support referred from RELO"},
            {"EL3", "H&R",  "5135", "ｲﾐｸﾞﾚｰｼｮﾝ売上",            "Revenue",
             "Immigration work referred from RELO"},
            {"EL4", "RELO", "5360", "紹介料(H&R_TYO）",          "Revenue",
             "Referral fee charged to H&R Tokyo"},
            {"EL5", "RELO", "5145", "IJｼｪｱｰﾄﾞｻｰﾋﾞｽ売上",        "Revenue",
             "Shared services charged to Immigration Japan"},
            {"EL6", "RELO", "6530", "ﾘﾛｹｰｼｮﾝｻｰﾋﾞｽ原価(H&R紹介",  "COGS",
             "H&R referral cost -- the cost side of EL1 + EL2 + EL3"},
            {"EL7", "H&R",  "6360", "紹介料原価（RELO)",          "COGS",
             "RELO referral cost -- the cost side of EL4"}
        }
    )
in
    T
