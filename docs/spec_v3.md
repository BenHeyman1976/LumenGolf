# Table of Contents {#table-of-contents .TOC-Heading}

[RNAグループ --- 連結損益計算書
[1](#rnaグループ-連結損益計算書)](#rnaグループ-連結損益計算書)

[RNA Group --- Consolidated P&L
[1](#rna-group-consolidated-pl)](#rna-group-consolidated-pl)

[ソースデータ、消去ロジック、Power BI仕様書
[1](#ソースデータ消去ロジックpower-bi仕様書)](#ソースデータ消去ロジックpower-bi仕様書)

[Source data, elimination logic and Power BI specification
[1](#source-data-elimination-logic-and-power-bi-specification)](#source-data-elimination-logic-and-power-bi-specification)

[1. 本書の目的 [1](#本書の目的)](#本書の目的)

[1. Purpose of this document
[1](#purpose-of-this-document)](#purpose-of-this-document)

[2. ソースデータ一覧 [1](#ソースデータ一覧)](#ソースデータ一覧)

[2. Source data register
[1](#source-data-register)](#source-data-register)

[2.1 入力ファイル --- モデルが読み込むファイル
[1](#入力ファイル-モデルが読み込むファイル)](#入力ファイル-モデルが読み込むファイル)

[2.1 Input files --- read by the model
[1](#input-files-read-by-the-model)](#input-files-read-by-the-model)

[2.2 照合先ファイル --- 読み込まず、照合にのみ使用
[1](#照合先ファイル-読み込まず照合にのみ使用)](#照合先ファイル-読み込まず照合にのみ使用)

[2.2 Verification file --- checked against, not read
[1](#verification-file-checked-against-not-read)](#verification-file-checked-against-not-read)

[2.3 イミグレーションジャパン --- 手入力の数値
[1](#イミグレーションジャパン-手入力の数値)](#イミグレーションジャパン-手入力の数値)

[2.3 Immigration Japan --- a hand-keyed input
[1](#immigration-japan-a-hand-keyed-input)](#immigration-japan-a-hand-keyed-input)

[2.4 ご提供いただいたが入力としては使用しないファイル
[1](#ご提供いただいたが入力としては使用しないファイル)](#ご提供いただいたが入力としては使用しないファイル)

[2.4 Files provided but not used as input
[1](#files-provided-but-not-used-as-input)](#files-provided-but-not-used-as-input)

[2.5 入力ファイルの構造 [1](#入力ファイルの構造)](#入力ファイルの構造)

[2.5 Structure of the input files
[1](#structure-of-the-input-files)](#structure-of-the-input-files)

[2.6 各行を損益計算書のどの区分に割り当てるか
[1](#各行を損益計算書のどの区分に割り当てるか)](#各行を損益計算書のどの区分に割り当てるか)

[2.6 How a line is assigned to a section of the P&L
[1](#how-a-line-is-assigned-to-a-section-of-the-pl)](#how-a-line-is-assigned-to-a-section-of-the-pl)

[3. 内部取引の消去 [1](#内部取引の消去)](#内部取引の消去)

[3. Inter-company elimination
[1](#inter-company-elimination)](#inter-company-elimination)

[3.1 消去が必要な理由 [1](#消去が必要な理由)](#消去が必要な理由)

[3.1 Why it is necessary
[1](#why-it-is-necessary)](#why-it-is-necessary)

[3.2 消去項目一覧 [1](#消去項目一覧)](#消去項目一覧)

[3.2 The elimination register
[1](#the-elimination-register)](#the-elimination-register)

[3.3 EL1は読み取りではなく算出しています
[1](#el1は読み取りではなく算出しています)](#el1は読み取りではなく算出しています)

[3.3 EL1 is derived, not read directly
[1](#el1-is-derived-not-read-directly)](#el1-is-derived-not-read-directly)

[3.4 消去対象に見えるが対象ではない勘定科目
[1](#消去対象に見えるが対象ではない勘定科目)](#消去対象に見えるが対象ではない勘定科目)

[3.4 Accounts that resemble eliminations but are not
[1](#accounts-that-resemble-eliminations-but-are-not)](#accounts-that-resemble-eliminations-but-are-not)

[4. FY2025の結果 [1](#fy2025の結果)](#fy2025の結果)

[4. FY2025 result [1](#fy2025-result)](#fy2025-result)

[4.1 通期 [1](#通期)](#通期)

[4.1 Full year [1](#full-year)](#full-year)

[4.2 消去項目の通期内訳 [1](#消去項目の通期内訳)](#消去項目の通期内訳)

[4.2 Elimination schedule, full year
[1](#elimination-schedule-full-year)](#elimination-schedule-full-year)

[4.3 月次（実績） [1](#月次実績)](#月次実績)

[4.3 By month, actual [1](#by-month-actual)](#by-month-actual)

[5. 検証 [1](#検証)](#検証)

[5. Verification [1](#verification)](#verification)

[5.1 4つの検証 [1](#つの検証)](#つの検証)

[5.1 The four control checks
[1](#the-four-control-checks)](#the-four-control-checks)

[5.2 計算を独自にご確認いただく方法
[1](#計算を独自にご確認いただく方法)](#計算を独自にご確認いただく方法)

[5.2 Checking the calculation independently
[1](#checking-the-calculation-independently)](#checking-the-calculation-independently)

[5.3 未検証の事項 [1](#未検証の事項)](#未検証の事項)

[5.3 What has not yet been verified
[1](#what-has-not-yet-been-verified)](#what-has-not-yet-been-verified)

[5.4 ご留意いただきたい発見事項
[1](#ご留意いただきたい発見事項)](#ご留意いただきたい発見事項)

[5.4 One finding that requires attention
[1](#one-finding-that-requires-attention)](#one-finding-that-requires-attention)

[6. ご確認をお願いしたい事項
[1](#ご確認をお願いしたい事項)](#ご確認をお願いしたい事項)

[6. Items for confirmation
[1](#items-for-confirmation)](#items-for-confirmation)

[6.1 勘定科目5230の補助科目内訳
[1](#勘定科目5230の補助科目内訳)](#勘定科目5230の補助科目内訳)

[6.1 Account 5230 sub-account breakdown
[1](#account-5230-sub-account-breakdown)](#account-5230-sub-account-breakdown)

[6.2 予算における消去差額 ¥6,602,954
[1](#_Toc244353499)](#_Toc244353499)

[6.2 Budget elimination difference of ¥6,602,954
[1](#budget-elimination-difference-of-6602954)](#budget-elimination-difference-of-6602954)

[6.3 イミグレーションジャパンのソースデータ
[1](#イミグレーションジャパンのソースデータ)](#イミグレーションジャパンのソースデータ)

[6.3 Immigration Japan source data
[1](#immigration-japan-source-data)](#immigration-japan-source-data)

[6.4
イミグレーションジャパンのリロジャパンからのシェアードサービス料¥5,760,000
[1](#_Toc244353503)](#_Toc244353503)

[6.4 Immigration Japan\'s ¥5,760,000 shared services charge from RELO
[1](#immigration-japans-5760000-shared-services-charge-from-relo)](#immigration-japans-5760000-shared-services-charge-from-relo)

[6.5 イミグレーションジャパンの¥278,199の取扱い
[1](#イミグレーションジャパンの278199の取扱い)](#イミグレーションジャパンの278199の取扱い)

[6.5 Treatment of Immigration Japan\'s ¥278,199
[1](#treatment-of-immigration-japans-278199)](#treatment-of-immigration-japans-278199)

[6.6 当期純利益による統制 [1](#_Toc244353507)](#_Toc244353507)

[6.6 The net profit control
[1](#the-net-profit-control)](#the-net-profit-control)

[6.7 期末のグループ間棚卸資産 [1](#_Toc244353509)](#_Toc244353509)

[6.7 Inter-company inventory at the year end
[1](#inter-company-inventory-at-the-year-end)](#inter-company-inventory-at-the-year-end)

[6.8 部門別の出力 [1](#部門別の出力)](#部門別の出力)

[6.8 Departmental export
[1](#departmental-export)](#departmental-export)

[6.9 FY2024のファイル [1](#fy2024のファイル)](#fy2024のファイル)

[6.9 FY2024 files [1](#fy2024-files)](#fy2024-files)

[7. Power Query仕様 [1](#power-query仕様)](#power-query仕様)

[7. Power Query specification
[1](#power-query-specification)](#power-query-specification)

[7.1 パラメーター [1](#パラメーター)](#パラメーター)

[7.1 Parameters [1](#parameters)](#parameters)

[7.2 ref_Section [1](#ref_section)](#ref_section)

[7.3 ref_Elimination [1](#ref_elimination)](#ref_elimination)

[7.4 fn_LoadEntity [1](#fn_loadentity)](#fn_loadentity)

[7.5 fact_IJ --- イミグレーションジャパン
[1](#fact_ij-イミグレーションジャパン)](#fact_ij-イミグレーションジャパン)

[7.5 fact_IJ --- Immigration Japan
[1](#fact_ij-immigration-japan)](#fact_ij-immigration-japan)

[7.6 fact_Source [1](#fact_source)](#fact_source)

[7.7 fact_Elimination [1](#fact_elimination)](#fact_elimination)

[7.8 fact_PL --- モデルに読み込むテーブル
[1](#fact_pl-モデルに読み込むテーブル)](#fact_pl-モデルに読み込むテーブル)

[7.8 fact_PL --- the table loaded to the model
[1](#fact_pl-the-table-loaded-to-the-model)](#fact_pl-the-table-loaded-to-the-model)

[7.9 dim_Date [1](#dim_date)](#dim_date)

[7.10 dim_Entity [1](#dim_entity)](#dim_entity)

[7.11 dim_Scenario [1](#dim_scenario)](#dim_scenario)

[7.12 chk_ImportIntegrity --- Power BI内での検証A
[1](#chk_importintegrity-power-bi内での検証a)](#chk_importintegrity-power-bi内での検証a)

[7.12 chk_ImportIntegrity --- Control A inside Power BI
[1](#chk_importintegrity-control-a-inside-power-bi)](#chk_importintegrity-control-a-inside-power-bi)

[7.13 chk_Diggle --- 並行運用時の照合
[1](#chk_diggle-並行運用時の照合)](#chk_diggle-並行運用時の照合)

[7.13 chk_Diggle --- parallel-run comparison
[1](#chk_diggle-parallel-run-comparison)](#chk_diggle-parallel-run-comparison)

[8. DAX仕様 [1](#dax仕様)](#dax仕様)

[8. DAX specification [1](#dax-specification)](#dax-specification)

[8.1 損益計算書の中核メジャー
[1](#損益計算書の中核メジャー)](#損益計算書の中核メジャー)

[8.1 Core P&L [1](#core-pl)](#core-pl)

[8.2 売上総利益より下の区分
[1](#売上総利益より下の区分)](#売上総利益より下の区分)

[8.2 Below the gross-profit line
[1](#below-the-gross-profit-line)](#below-the-gross-profit-line)

[8.3 実績・予算・差異 [1](#実績予算差異)](#実績予算差異)

[8.3 Actual, budget and variance
[1](#actual-budget-and-variance)](#actual-budget-and-variance)

[8.4 消去の内訳 [1](#消去の内訳)](#消去の内訳)

[8.4 Elimination detail [1](#elimination-detail)](#elimination-detail)

[8.5 検証メジャー [1](#検証メジャー)](#検証メジャー)

[8.5 Controls [1](#controls)](#controls)

[9. レポートのページ構成
[1](#レポートのページ構成)](#レポートのページ構成)

[9. Report pages [1](#report-pages)](#report-pages)

[10. 本仕様の対象外 [1](#本仕様の対象外)](#本仕様の対象外)

[10. Scope not covered by this specification
[1](#scope-not-covered-by-this-specification)](#scope-not-covered-by-this-specification)

[付録 --- 添付ファイル [1](#付録-添付ファイル)](#付録-添付ファイル)

[Appendix --- accompanying files
[1](#appendix-accompanying-files)](#appendix-accompanying-files)

# RNAグループ --- 連結損益計算書

# RNA Group --- Consolidated P&L

## ソースデータ、消去ロジック、Power BI仕様書

## Source data, elimination logic and Power BI specification

  -----------------------------------------------------------------------
  項目 Item      内容 Detail
  -------------- --------------------------------------------------------
  版 Version     3.0

  日付 Date      2026年10月13日 / 13 October 2026

  目的 Purpose   Diggleを廃止し、連結損益計算書をPower
                 BIモデルで作成する\
                 Replace Diggle with a Power BI model that produces the
                 consolidated P&L

  対象期間       FY2025（2025年4月〜2026年3月）、予算および実績\
  Period         FY2025 --- April 2025 to March 2026, budget and actual

  状況 Status    ロジックは元ファイルに対して検証済み。Power
                 BIモデルは未構築。\
                 Logic verified against the source files. Power BI model
                 not yet built.

  宛先 For       RNAグループ経理部によるご確認用\
                 Review and confirmation by the RNA Group finance team
  -----------------------------------------------------------------------

> **この文書について / About this document**
> 日本語を主、英語を従として併記しています。各見出し・各段落とも、日本語のあとに同じ内容の英語が続きます。
> 表では、原則として日本語と英語を同じセルに併記しています。 Japanese is
> the primary text, with the English kept alongside. Each heading and
> paragraph is given in Japanese and then in English. In tables the two
> are generally placed in the same cell.

## 1. 本書の目的

## 1. Purpose of this document

本書は、以下の事項を一か所にまとめたものです。

This document sets out, in one place:

-   どのファイルをソースデータとして採用し、どのファイルを採用しないか（第2節）
    --- exactly which files are taken as source data, and which are not
    (Section 2)
-   内部取引の消去ロジックを一項目ずつ（第3節） --- the inter-company
    elimination logic, line by line (Section 3)
-   当該ロジックが算出するFY2025の結果（第4節） --- the FY2025 result
    the logic produces (Section 4)
-   その結果をどのように検証するか、および結果を再現するExcelブック（第5節）
    --- how that result is verified, and the Excel workbook that
    reproduces it (Section 5)
-   経理部のご確認をお願いしたい事項（第6節） --- the points on which
    the finance team\'s confirmation is needed (Section 6)
-   Power BIの実装仕様（第7節〜第9節） --- the Power BI implementation
    specification (Sections 7 to 9)

第1節から第6節は経理部のご確認用です。第7節から第9節は技術仕様であり、
ロジックをご確認いただくうえで必ずしもお読みいただく必要はありません。

Sections 1 to 6 are written for review by the finance team. Sections 7
to 9 are the technical specification and do not need to be read in order
to review the logic.

本書には、Excelブック `RNA_Elimination_Proof_JP.xlsx` を添付しています。
3つの元ファイルをそのまま収録したうえで、連結結果に至るまでの計算全体をExcelの数式として
展開しているため、本書の記載を前提とせずにセル単位でご確認いただけます。
詳細は第5.2節をご参照ください。

An Excel workbook, `RNA_Elimination_Proof_JP.xlsx`, accompanies this
document. It carries the three source exports verbatim and works the
whole calculation through to the consolidated result as live Excel
formulas, so the logic can be checked cell by cell without taking
anything in this document on trust. Section 5.2 describes it.

## 2. ソースデータ一覧

## 2. Source data register

### 2.1 入力ファイル --- モデルが読み込むファイル

### 2.1 Input files --- read by the model

モデルが読み込む入力ファイルは **4つ** です。以下の奉行出力3ファイルと、
第2.3節に記載するイミグレーションジャパンの数値です。これ以外に入力はありません。
連結結果のすべてがこの4つから作成されます。

The model reads **four input files**: the three Bugyo exports below,
plus the Immigration Japan figures covered in Section 2.3. Nothing else
is an input. Everything in the consolidated output is produced from
those four.

  ------------------------------------------------------------------------------------------------------------------------------------
  会社 Entity          ファイル名 File name             サイズ    SHA-256
                                                        Size      
                                                        (bytes)   
  -------------------- -------------------------------- --------- --------------------------------------------------------------------
  H&Rコンサルタンツ\   `H&R_FY2025``予実表``.xlsx`      28,762    `5a8f3197f6883604ba03f276fbee1a12d43df90bc4a752e92eedaf01e2182be7`
  H&R Consultants                                                 

  リロジャパン\        `RELO_FY2025``予``実表``.xlsx`   21,698    `a40a613562932aa851db65d4a0392ed3033bbc760b29699162d06367c005c0bf`
  RELO Japan                                                      

  RNA Group            `RNAG_FY2025``予実表``.xlsx`     18,363    `b07ac97c7f0f8854dbb47602395d4feb57cd8e127c582fbbc727d661fcf6f962`
  ------------------------------------------------------------------------------------------------------------------------------------

SHA-256の値は、本書が対象とするファイルのバージョンを特定するものです。
添付のExcelブックおよび参照用スクリプトは、与えられたファイルについて同じ値を表示しますので、
どのバージョンがどの結果を生んだかに疑義が生じることはありません。

The SHA-256 values identify the exact file versions this document
describes. The accompanying workbook and the reference script print the
same values for whatever files they are given, so there can be no doubt
about which version produced a given result.

3ファイルはいずれも奉行会計システムの **予算実績対比表** の出力であり、
通期の予算と実績の双方を含みます。

All three are **予算実績対比表** exports from the Bugyo accounting
system, covering the full fiscal year on both budget and actual.

### 2.2 照合先ファイル --- 読み込まず、照合にのみ使用

### 2.2 Verification file --- checked against, not read

  -------------------------------------------------------------------------------------------------------------------------------------
  ファイル名 File name                                 用途 Used for
  ---------------------------------------------------- --------------------------------------------------------------------------------
  `2025``年度``_``連結レポート``_Mar unit K YE.xlsx`   現在経理部が作成されている連結結果と、モデルの出力が一致することの確認。シート
                                                       `国内３社``PL``（準備資料）`、列 `通期`。\
                                                       Confirming the model\'s output matches the consolidation the finance team
                                                       produces today. Sheet `国内３社``PL``（準備資料）`, column `通期`.

  -------------------------------------------------------------------------------------------------------------------------------------

このファイルは **照合先**
であり、入力ではありません。モデルの数値がこのファイルから
取られることは一切ありません。既存の連結結果をモデルが再現していることを示すためにのみ
使用するものであり、Power BIが正式な作成元となった時点で不要になります。

This file is a **target**, not an input. No figure in the model comes
from it. It is used only to prove that the model reproduces the existing
consolidated result, and it will stop being needed once Power BI is the
system of record.

**同ファイルが消去後の資料であることは、ファイル名ではなくその内容から確認しています。**
勘定科目単位の照合結果は第5.1節に記載しています。要点は次のとおりです。
同ブックは連結のワークペーパーであり、貸借対照表シートには会社別の消去列があって
`疑似連結` と題された列に集計されています。予算の損益計算書シートには
`親子間`、`H``＆``R⇒``リロ売上相殺`、`リロ``⇒H``＆``R``売上相殺`、`のれん償却`、`連結`
の各列があります。
そして実績シートでは、内部取引のある勘定科目がいずれも本モデルの消去額と同額だけ減額されており、
うち2科目はゼロになっています。

**It is a post-elimination source, and that is established from its
contents rather than its name.** Section 5.1 sets out the
account-by-account comparison. In summary: the workbook is a
consolidation workpaper --- its balance-sheet sheet carries per-entity
elimination columns feeding a column labelled `疑似連結`, and its budget
P&L sheets carry columns `親子間`, `H``＆``R⇒``リロ売上相殺`,
`リロ``⇒H``＆``R``売上相殺`, `のれん償却` and `連結` --- and on the
actuals sheet every inter-company account is reduced by exactly the
amount this model eliminates, two of them to zero.

2点申し添えます。`準備資料`・`疑似連結`
という名称が示すとおり、これは経理部の作業資料であり、
監査済みの法定連結財務諸表ではありません。本モデルはこの作業資料に対して検証しています。
また同ブックには `連結`` (with RNA)`
というさらに上位の階層があり、のれん償却および
親子間債権債務が含まれます。いずれも売上高・売上原価・売上総利益には影響しないため
本書の検証結果に影響はありませんが、連結全体は本モデルが再現する範囲より広いものです。

Two limits are worth stating. `準備資料` means *preparation material*
and `疑似連結` means *pseudo-consolidation*: this is the finance team\'s
working paper, not an audited statutory consolidation. The same workbook
also contains a further layer, `連結`` (with RNA)`, carrying goodwill
amortisation and inter-company receivables and payables. None of that
touches revenue, cost of sales or gross profit.

### 2.3 イミグレーションジャパン --- 手入力の数値

### 2.3 Immigration Japan --- a hand-keyed input

イミグレーションジャパンには奉行の出力がありません。数値は
`IJ data coversion.xlsx` シート `ORG data`
から取得し、モデルに手入力しています。

Immigration Japan has no Bugyo export. Its figures come from
`IJ data coversion.xlsx`, sheet `ORG data`, and are entered into the
model by hand.

  -----------------------------------------------------------------------
  項目 Item         FY2025実績 FY2025 actual
  ----------------- -----------------------------------------------------
  売上高 Revenue    ¥9,420,590

  原価 Cost         ¥278,199

  期間 Period       2026年1月〜3月のみ / January to March 2026 only

  予算 Budget       提供なし / Not provided
  -----------------------------------------------------------------------

合計でグループ売上高の0.6%にあたります。金額は小さいものの、
モデルのなかで手入力されている唯一の数値であり、会計システムの出力から直接再現できない
唯一の部分です。第6節の項目3をご参照ください。

Together this is 0.6% of group revenue. It is nonetheless the only
hand-entered figure in the model, and the only part that is not
reproducible directly from an accounting system export. See item 3 in
Section 6.

入力した数値はファイルに遡って照合済みです。`ORG data`
シートの売上は1月3,603,746、
2月2,160,162、3月3,656,682であり、¥278,199は
`支払手数料（リロ関連諸費用）`
¥156,765、`支払手数料（``H&R``関連諸費用）` ¥120,684、 `支払手数料` ¥750
の3行の合計で、モデルの月次数値と円単位で一致します。

The entered figures have been checked back against the file. The
`ORG data` sheet gives revenue of 3,603,746, 2,160,162 and 3,656,682 for
January, February and March, and the ¥278,199 is the sum of three lines
--- `支払手数料（リロ関連諸費用）` ¥156,765,
`支払手数料（``H&R``関連諸費用）` ¥120,684 and `支払手数料` ¥750 ---
which reconcile to the monthly figures in the model to the yen.

### 2.4 ご提供いただいたが入力としては使用しないファイル

### 2.4 Files provided but not used as input

以下のファイルはご提供いただき、内容を確認いたしました。いずれもモデルには入力されません。
モデルが何を読み、何を読まないかを明確にするため、記録として掲げます。

These files were supplied and have been reviewed. None of them feeds the
model. This is recorded so that there is no ambiguity about what the
model does and does not read.

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ファイル名 File name                                       入力としない理由 Why it is not an input
  ---------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------
  `2025``年度``_``連結``CF_Mar unit M YE.xlsx`               同じ連結結果を百万円単位で表示したもの。第2.2節の照合先の別表現であり、データソースではありません。\
                                                             The same consolidation expressed in millions of yen. A second presentation of the Section 2.2 target, not a data source.

  `H&RConsultants_20250401-20260331.xlsx`                    実績のみの旧出力。予算と実績の双方を含む予実表ファイルに置き換わっています。\
                                                             Earlier actual-only export, superseded by the 予実表 file, which carries both budget and actual.

  `ReloJapan_20250401-20260331.xlsx`                         同上 / As above.

  `RNAGroup_20250401-20260331.xlsx`                          同上 / As above.

  `referral fee.xlsx`                                        リロジャパン勘定科目6530の部門別内訳。通期のみで月次の内訳がないため、月次モデルの基礎にはできません。部門別報告の際に有用です（第10節）。\
                                                             RELO account 6530 split by division. Full-year only, with no monthly detail, so it cannot drive a monthly model. Useful later for divisional
                                                             reporting --- see Section 10.

  `supporting sub.xlsx`                                      補助科目内訳表。貸借対照表科目の補助科目のみを含み、モデルが必要とする勘定科目5230の補助科目内訳は
                                                             **含まれていません**。第6節の項目1をご参照ください。\
                                                             補助科目内訳表. Contains balance-sheet sub-accounts only. It does **not** contain the account 5230 sub-account split, which is the breakdown the
                                                             model would benefit from. See item 1 in Section 6.

  `2025``年度``_``連結レポート準備資料``Mar YE .xlsb.xlsx`   連結レポートの作業資料。理解のため確認しましたが、データソースではありません。\
                                                             Working papers behind the consolidated report. Reviewed for understanding; not a data source.

  `IJ data coversion.xlsx`                                   **これは入力です** ---
                                                             4つ目の入力にあたります。他の3ファイルと異なり読み込みではなく手入力であるため、混同を避ける目的でここにも掲げています。第2.3節をご参照ください。\
                                                             **This one is an input** --- the fourth. It is listed here only to avoid confusion, because unlike the other three it is entered by hand rather than
                                                             read. See Section 2.3.
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 2.5 入力ファイルの構造

### 2.5 Structure of the input files

3つの入力ファイルは構造が同一です。

All three input files are structurally identical.

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  項目 Property      内容 Value
  ------------------ --------------------------------------------------------------------------------------------------------------------------------------------------------
  シート名 Sheet     `損益計算書` --- 唯一のシート / the only sheet
  name               

  見出し行 Header    9行目。行番号ではなく、B列の `科目名` を探して特定します。\
  row                Row 9, located by finding `科目名` in column B rather than by row number

  A列 Column A       `コード` --- 勘定科目コード / account code

  B列 Column B       `科目名` --- 勘定科目名 / account name

  C列〜Z列 Columns C 24の月次列。予算・実績の順に交互に並びます：`2025``年`` 4``月予算``(``発生``)`、`2025``年`` 4``月実績``(``発生``)`、`2025``年`` 5``月予算``(``発生``)`
  to Z               ...\
                     24 monthly columns, alternating budget then actual

  AA列・AB列 Columns `2026``年`` 3``月予算``(``残高``)`、`2026``年`` 3``月実績``(``残高``)`
  AA and AB          
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

**取得するもの：** `(``発生``)`
の24列、すなわち各月の発生額。4桁の数字からなる勘定科目コードを持つ全行が対象です。

**What is taken:** the 24 `(``発生``)` columns --- the movement in each
month --- for every row carrying a four-digit numeric account code.

**取得しないものと、その理由：**

**What is excluded, and why:**

  -----------------------------------------------------------------------------------------------------------------------------
  対象 Excluded   理由 Reason
  --------------- -------------------------------------------------------------------------------------------------------------
  `(``残高``)`    `(``残高``)`
  の2列\          は月次の発生額ではなく期末累計残高です。これらの列を取り込むと、モデル内のすべての数値がほぼ倍になります。\
  The two         `(``残高``)` is the year-to-date balance, not a monthly movement. Including these columns would roughly
  `(``残高``)`    double every figure in the model.
  columns         

  `P`             これらはファイルが自ら表示している小計です。モデルでは再計算するため、消去 **後**
  コードの全行\   の数値を反映します。第5節の検証用に別途読み取ります。\
  All `P`-code    These are the subtotals the file states for itself. They are recalculated in the model instead, so that they
  rows            reflect the figures **after** elimination. They are read separately for the control checks in Section 5.
  -----------------------------------------------------------------------------------------------------------------------------

取り込み処理が前提としている以下の3点は、いずれも推測ではなく実ファイルに対して確認済みです。

Three properties of these files that the import relies on, each
confirmed against the actual files rather than assumed:

1.  **すべての科目行に勘定科目コードが付されています。**
    3ファイルとも、コードのない行はゼロ件でした。
    旧来の部門別ファイルでは、コードのない行が気付かれずに欠落する実際のリスクがありましたが、
    本形式ではそのリスクはありません。 **Every account row has an
    account code.** All three files: zero rows without one. This was a
    genuine risk in the earlier divisional files, where uncoded rows
    would have been silently lost. It is not a risk in this format.
2.  **小計は** `P` **コードの行として明示されています** ---
    `P1000 ``純売上高`、`P1100 ``売上原価`、 最終的に
    `P6100 ``当期純利益` まで。 **Subtotals are explicit** `P`**-code
    rows** --- `P1000 ``純売上高`, `P1100 ``売上原価`, down to
    `P6100 ``当期純利益`.
3.  **各ファイルが自らの小計を表示しているため**、取り込みで欠落がないことを証明できます。
    これが第5節の検証Aです。 **Each file states its own subtotals**,
    which makes it possible to prove the import lost nothing. This is
    Control A in Section 5.

### 2.6 各行を損益計算書のどの区分に割り当てるか

### 2.6 How a line is assigned to a section of the P&L

各科目行は、その **下** に現れる `P`
コード小計に属するものとして扱います。
取り込み処理はこの位置関係を用いており、勘定科目コードの先頭桁は用いません。

Each account row belongs to whichever `P`-code subtotal appears
**below** it. The import uses that position, not the account code\'s
leading digit.

これは重要な点です。`0830 ``支払利息`
は先頭が0であっても営業外費用であり、
`6710 ``所有車両`` (``減価償却費``)`
は減価償却費であっても売上原価に属します。
勘定科目コードに基づく規則では、いずれも誤って分類されます。

This matters. `0830 ``支払利息` is a non-operating expense despite its
leading zero, and `6710 ``所有車両`` (``減価償却費``)` belongs in cost
of sales despite being a depreciation account. A rule based on the
account code would place both incorrectly.

  ------------------------------------------------------------------------
  Pコード      科目名        区分 Section              利益計算上の符号
  P-code       Japanese                                Sign in profit
  ------------ ------------- ------------------------- -------------------
  P1000        純売上高      売上高 / Revenue          \+

  P1100        売上原価      売上原価 / Cost of sales  −

  P3001        人件費計      人件費 / SG&A ---         −
                             personnel                 

  P3002        経費計        経費 / SG&A --- other     −

  P4110        営業外収益    営業外収益 /              \+
                             Non-operating income      

  P4120        営業外費用    営業外費用 /              −
                             Non-operating expense     

  P5110        特別利益      特別利益 / Extraordinary  \+
                             income                    

  P5120        特別損失      特別損失 / Extraordinary  −
                             loss                      

  P6110        法人税等      法人税等 / Tax            −
  ------------------------------------------------------------------------

`P2000`、`P3000`、`P4000`、`P5000`、`P6000`、`P6100`
は上記を集計したものであり、 取り込まず再計算します。

`P2000`, `P3000`, `P4000`, `P5000`, `P6000` and `P6100` roll up the rows
above. They are recalculated, not imported.

符号について1点補足します。出力では `P6110 ``法人税等`
が負の数として表示される一方、 その明細行 `9000`
は正の数です。他の区分はいずれも小計を正の絶対値で表示しています。
第5節の検証では、`P6110` についてのみこの点を調整しています。

One note on signs: the export states `P6110 ``法人税等` as a negative
figure while its own detail row `9000` is positive. Every other section
states its subtotal as a positive magnitude. The control check in
Section 5 allows for this on `P6110` only.

## 3. 内部取引の消去

## 3. Inter-company elimination

### 3.1 消去が必要な理由

### 3.1 Why it is necessary

H&Rコンサルタンツが業務を行い、リロジャパンが最終顧客に請求します。
H&Rは自らの関与分について紹介売上を計上し、リロジャパンはH&Rへの支払に対応する原価を計上します。

H&R Consultants performs the client work. RELO Japan invoices the end
client. H&R books referral revenue for its part, and RELO books a
matching cost for what it pays H&R.

したがって2社を単純に合算すると、このグループ内の振替が二重に計上されます。
H&Rの売上として一度、リロジャパンの原価として一度です。いずれもグループへの資金の
流入・流出を表すものではありません。双方を取り除きます。

Adding the two legal entities together therefore counts that internal
transfer twice: once as H&R revenue, once as RELO cost. Neither
represents money coming into or leaving the group. Both sides are
removed.

**各項目は個別に取り除きます。**
これは相殺ではなく消去です。双方の金額が一致する必要はなく、
FY2025では実際に一致していません。勘定科目5230には外部売上が¥62,500含まれており、
これは正当にそのまま残ります。

**Each line is removed independently.** This is elimination, not
netting. The two sides are not required to be equal, and in FY2025 they
are not --- account 5230 contains ¥62,500 of genuinely external revenue,
which correctly remains.

### 3.2 消去項目一覧

### 3.2 The elimination register

  ---------------------------------------------------------------------------------------------------------------------
  ID    会社     科目      科目名 Account name        区分 Line   内容 What it is
        Entity   Account                                          
  ----- -------- --------- -------------------------- ----------- -----------------------------------------------------
  EL1   H&R      5230      ﾘﾛｹｰｼｮﾝｻｰﾋﾞｽ売上           売上高\     リロジャパンへのリロケーションサービス紹介売上 ---
                                                      Revenue     **RMC補助科目分のみ**\
                                                                  Relocation service referral billed to RELO --- **RMC
                                                                  sub-account portion only**

  EL2   H&R      5255      運転免許書換ｻﾎﾟｰﾄ売上      売上高\     リロジャパンから紹介された運転免許書換サポート\
                                                      Revenue     Driving licence conversion support referred from RELO

  EL3   H&R      5135      ｲﾐｸﾞﾚｰｼｮﾝ売上              売上高\     リロジャパンから紹介されたイミグレーション業務\
                                                      Revenue     Immigration work referred from RELO

  EL4   RELO     5360      紹介料(H&R_TYO）           売上高\     H&R東京に対する紹介料\
                                                      Revenue     Referral fee charged to H&R Tokyo

  EL5   RELO     5145      IJｼｪｱｰﾄﾞｻｰﾋﾞｽ売上          売上高\     イミグレーションジャパンに対するシェアードサービス\
                                                      Revenue     Shared services charged to Immigration Japan

  EL6   RELO     6530      ﾘﾛｹｰｼｮﾝｻｰﾋﾞｽ原価(H&R紹介   売上原価\   H&R紹介原価 --- EL1 + EL2 + EL3 の原価側\
                                                      Cost of     H&R referral cost --- the cost side of EL1 + EL2 +
                                                      sales       EL3

  EL7   H&R      6360      紹介料原価（RELO)          売上原価\   リロジャパン紹介原価 --- EL4 の原価側\
                                                      Cost of     RELO referral cost --- the cost side of EL4
                                                      sales       
  ---------------------------------------------------------------------------------------------------------------------

各項目は **会社と勘定科目コードの組み合わせ**
で特定します。勘定科目コード単独では特定しません。
これは念のための措置ではなく必須です。H&Rとリロジャパンは勘定科目5135、5230、6530を
まったく別の目的で使用しているためです。該当する事例は第3.4節に掲げます。

Every line is keyed on **entity plus account code**, never account code
alone. This is not a precaution; it is required, because H&R and RELO
both use accounts 5135, 5230 and 6530 for entirely different purposes.
Section 3.4 lists the cases.

### 3.3 EL1は読み取りではなく算出しています

### 3.3 EL1 is derived, not read directly

勘定科目5230には内部取引と外部売上が合算して計上されています。
FY2025の合計は¥198,638,179で、うち¥198,575,679が内部取引です。

Account 5230 holds inter-company and external revenue together. Its
FY2025 total is ¥198,638,179, of which ¥198,575,679 is inter-company.

2025年10月、経理部より5230が補助科目で区分されている旨のご確認をいただきました。
`1000 RMC` = ¥198,575,679（内部取引）、`0000 ``その他` =
¥62,500（外部）です。 この補助科目内訳は
**月次の出力には含まれていない** ため、モデルでは内部取引分を
原価側から算出しています。

The finance team confirmed in October 2025 that 5230 is split by
sub-account: `1000 RMC` = ¥198,575,679 inter-company, `0000 ``その他` =
¥62,500 external. That sub-account breakdown is **not present in the
monthly export**, so the model derives the inter-company portion from
the cost side instead:

    EL1  =  RELO 6530        リロジャパンが計上したH&R紹介原価の総額
                             total H&R referral cost RELO booked
          −  H&R 5255        うち運転免許書換分
                             the driving licence part of it
          −  H&R 5135        うちイミグレーション分
                             the immigration part of it

FY2025実績では：

On FY2025 actual:

       223,033,152  −  23,130,446  −  1,327,027  =  198,575,679

経理部ご提示のRMC補助科目の金額と、円単位で完全に一致します。

This matches the finance team\'s own RMC sub-account figure exactly, to
the yen.

**この方法を採用した理由。**
追加の出力を必要とせず、かつ自己補正的である点です。
5230に外部売上がない年度では残額が自動的にゼロとなり、外部売上がより多い年度では
超過分が正しく売上高に残ります。いずれの場合もモデルの変更は不要です。

**Why this method was chosen.** It requires no additional export, and it
is self-correcting. In a year where 5230 carries no external revenue,
the remainder falls out at zero on its own; in a year where it carries
more, the extra correctly stays in revenue. No change to the model is
needed in either case.

ただし、補助科目内訳を月次でご提供いただければ、EL1は直接読み取りとなり、
上記の算出は照合用の二重チェックとなります。その方が堅牢です。
第6節の項目1をご参照ください。

The method would nonetheless be more robust still if the sub-account
breakdown were available monthly, in which case EL1 becomes a direct
read and the derivation becomes a cross-check. This is item 1 in Section
6.

### 3.4 消去対象に見えるが対象ではない勘定科目

### 3.4 Accounts that resemble eliminations but are not

  --------------------------------------------------------------------------------------------------------------------------------------
  会社     科目 Account       FY2025実績       消去しない理由 Why it is not eliminated
  Entity                      FY2025 actual    
  -------- ------------------ ---------------- -----------------------------------------------------------------------------------------
  H&R      6530 紹介料原価    ¥300,334         リロジャパンの¥223百万の内部取引原価科目と同じコードですが、まったく別の勘定科目です。\
                                               Same account code as RELO\'s ¥223m inter-company cost account, but a completely different
                                               account.

  RELO     5135               ¥57,364,044      リロジャパン自身の外部イミグレーション売上です。H&RのEL3科目と同じコードです。\
           ｲﾐｸﾞﾚｰｼｮﾝ売上げ                     RELO\'s own external immigration revenue. Same code as H&R\'s EL3 account.

  RELO     5230               ¥220,039,272     リロジャパン自身の外部リロケーション売上です。H&RのEL1科目と同じコードです。\
           ﾘﾛｹｰｼｮﾝｻｰﾋﾞｽ売上                    RELO\'s own external relocation revenue. Same code as H&R\'s EL1 account.
  --------------------------------------------------------------------------------------------------------------------------------------

会社と勘定科目コードの組み合わせで特定することにより、上記3件はいずれも正しく処理されます。

Keying on entity plus account code handles all three correctly.

## 4. FY2025の結果

## 4. FY2025 result

### 4.1 通期

### 4.1 Full year

  ---------------------------------------------------------------------------------
  項目 Item                                 実績 Actual         予算 Budget
  ----------------------------------------- ------------------- -------------------
  合算売上高 Gross revenue                  1,735,168,178       1,879,767,866

  売上高の消去 Revenue eliminations         (258,617,387)       (266,704,397)

  **連結売上高 Consolidated revenue**       **1,476,550,791**   **1,613,063,469**

  合算売上原価 Gross cost of sales          831,569,424         863,813,564

  売上原価の消去 Cost of sales eliminations (252,857,387)       (266,704,397)

  **連結売上原価 Consolidated cost of       **578,712,037**     **597,109,167**
  sales**                                                       

  **売上総利益 Gross profit**               **897,838,754**     **1,015,954,302**

  売上総利益率 Gross margin                 60.8%               63.0%
  ---------------------------------------------------------------------------------

### 4.2 消去項目の通期内訳

### 4.2 Elimination schedule, full year

  -----------------------------------------------------------------------------
  ID    会社      科目        区分 Line         実績 Actual     予算 Budget
        Entity    Account                                       
  ----- --------- ----------- ----------------- --------------- ---------------
  EL1   H&R       5230        売上高 Revenue    (198,575,679)   (212,882,649)

  EL2   H&R       5255        売上高 Revenue    (23,130,446)    (15,783,332)

  EL3   H&R       5135        売上高 Revenue    (1,327,027)     (1,993,608)

  EL4   RELO      5360        売上高 Revenue    (29,824,235)    (36,044,808)

  EL5   RELO      5145        売上高 Revenue    (5,760,000)     ---

  EL6   RELO      6530        売上原価 Cost of  (223,033,152)   (230,659,589)
                              sales                             

  EL7   H&R       6360        売上原価 Cost of  (29,824,235)    (36,044,808)
                              sales                             
  -----------------------------------------------------------------------------

### 4.3 月次（実績）

### 4.3 By month, actual

  ---------------------------------------------------------------------------------
  月      合算売上高\   消去\          連結売上高\    連結売上原価\   売上総利益\
  Month   Gross revenue Elimination    Consolidated   Consolidated    Gross profit
                                       revenue        COGS            
  ------- ------------- -------------- -------------- --------------- -------------
  4月 Apr 144,198,233   (22,996,540)   121,201,693    49,041,138      72,160,555

  5月 May 136,661,188   (18,517,385)   118,143,803    46,908,349      71,235,454

  6月 Jun 146,418,184   (21,557,667)   124,860,517    49,968,264      74,892,253

  7月 Jul 170,241,924   (25,554,265)   144,687,659    57,694,972      86,992,687

  8月 Aug 153,561,650   (22,148,102)   131,413,548    47,157,170      84,256,378

  9月 Sep 168,366,744   (22,059,617)   146,307,127    51,364,423      94,942,704

  10月    153,489,127   (18,540,051)   134,949,076    55,765,600      79,183,476
  Oct                                                                 

  11月    125,824,046   (16,378,325)   109,445,721    46,627,351      62,818,370
  Nov                                                                 

  12月    133,168,715   (19,723,119)   113,445,596    45,649,614      67,795,982
  Dec                                                                 

  1月 Jan 137,500,396   (25,236,928)   112,263,468    42,064,003      70,199,465

  2月 Feb 123,187,806   (20,306,773)   102,881,033    41,743,995      61,137,038

  3月 Mar 142,550,165   (25,598,615)   116,951,550    44,727,158      72,224,392
  ---------------------------------------------------------------------------------

## 5. 検証

## 5. Verification

### 5.1 4つの検証

### 5.1 The four control checks

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      検証 Control            検証内容 What it tests                                                                                                  FY2025の結果 FY2025 result
  --- ----------------------- ----------------------------------------------------------------------------------------------------------------------- -------------------------------------------
  A   取込整合性\             読み込んだ全明細行と、各ファイルが自ら表示している小計との照合。3社 × 2区分 × 9区分 = 54件\                             **54件すべて差異ゼロ**\
      Import integrity        Every detail row read, against the subtotal each file states for itself --- 3 entities × 2 bases × 9 sections = 54      **0 variance on all 54**
                              comparisons                                                                                                             

  B   当期純利益の再計算\     各区分に符号を乗じて合計し、各ファイルが自ら表示している `当期純利益` と照合。6通り\                                    **6通りすべて差異ゼロ**\
      Derived net profit      Every section rolled up with its sign, against the `当期純利益` each file states for itself --- 6 entity and basis      **0 variance on all 6**
                              combinations                                                                                                            

  C   連結レポートとの照合\   連結売上高・売上原価・売上総利益を、経理部作成の連結結果と照合。**各月および通期**、合計39個の数値。**実績ベース**。\   **39個すべて差異ゼロ**\
      Consolidated report     Consolidated revenue, cost of sales and gross profit against the finance team\'s own consolidation --- **every month    **0 variance on all 39**
                              and the full year**, 39 figures in total, **on an actuals basis**                                                       

  D   勘定科目5230の残額\     EL1消去後に5230に残る金額\                                                                                              実績
      Account 5230 remainder  What is left in 5230 after EL1                                                                                          **¥62,500**（外部売上、想定どおり）。予算
                                                                                                                                                      **¥6,602,954**（第6節 項目2）\
                                                                                                                                                      Actual **¥62,500** (expected, external).
                                                                                                                                                      Budget **¥6,602,954** (see item 2 in
                                                                                                                                                      Section 6)
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

検証Cの内訳：

Control C in full:

  ------------------------------------------------------------------------
  項目 Item              本ロジック This  連結レポート         差異
                         logic            Consolidated report  Variance
  ---------------------- ---------------- -------------------- -----------
  連結売上高             1,476,550,791    1,476,550,791        0
  Consolidated revenue                                         

  連結売上原価           578,712,037      578,712,037          0
  Consolidated cost of                                         
  sales                                                        

  売上総利益 Gross       897,838,754      897,838,754          0
  profit                                                       
  ------------------------------------------------------------------------

上記3項目の内訳となる月次12か月分の数値についても個別に同じレポートと照合し、
いずれも一致しています。

Each of the twelve monthly figures behind these three totals was also
checked individually against the same report, and each one agrees.

**さらに、勘定科目単位でも一致しており、こちらがより強い検証です。**
`国内３社``PL``（準備資料）`
シートは売上高・売上原価の全勘定科目を個別に表示しています。
各科目を4社の合計と比較すると、経理部が何をいくら取り除いたかが分かります。
68科目すべてが一致しました。内部取引のない61科目は合計と完全に一致し、
内部取引のある7科目は本モデルの消去項目一覧と同額だけ減額されています。

**The comparison also holds account by account, which is the stronger
test.** All 68 revenue and cost-of-sales accounts agree --- the 61 with
no inter-company element match the sum of the four entity exports
exactly, and the seven that carry one are reduced by exactly the amounts
in this model\'s elimination register:

  ----------------------------------------------------------------------------------
  勘定科目 Account        4社合計 Sum of  同シート Their 減額 Removed  本モデル This
                          four entities   sheet                        model
  ----------------------- --------------- -------------- ------------- -------------
  5230 ﾘﾛｹｰｼｮﾝｻｰﾋﾞｽ売上   418,677,451     220,101,772    198,575,679   EL1
                                                                       198,575,679

  5255                    54,246,791      31,116,345     23,130,446    EL2
  運転免許書換ｻﾎﾟｰﾄ売上                                                23,130,446

  5135 ｲﾐｸﾞﾚｰｼｮﾝ売上      68,111,661      66,784,634     1,327,027     EL3 1,327,027

  5360 紹介料(H&R_TYO）   29,824,235      0              29,824,235    EL4
                                                                       29,824,235

  5145 IJｼｪｱｰﾄﾞｻｰﾋﾞｽ売上  5,760,000       0              5,760,000     EL5 5,760,000

  6530 紹介料原価         223,333,486     300,334        223,033,152   EL6
                                                                       223,033,152

  6360 紹介料原価（RELO)  29,824,235      0              29,824,235    EL7
                                                                       29,824,235
  ----------------------------------------------------------------------------------

これが、同ファイルが単純合算ではなく消去後の資料であることの根拠です。
4社の出力では¥29.8百万・¥5.8百万が計上されている2科目が、ちょうどゼロになっています。
消去前の集計ではこうはなりません。また5230は¥220,101,772となっており、
これはリロジャパン自身の¥220,039,272に、H&Rの5230に残る外部売上¥62,500を加えた金額です。
第3.3節で述べた残額が、経理部ご自身のシート上に現れています。

This is what establishes that the file is a post-elimination source
rather than a combined one. Two accounts are reduced to exactly zero
where the entity exports carry ¥29.8m and ¥5.8m. Account 5230 is reduced
to ¥220,101,772, which is RELO\'s own ¥220,039,272 plus the ¥62,500 of
external revenue left in H&R\'s 5230 --- the residual described in
Section 3.3, visible on the face of their own sheet.

なかでも6530が最も示唆に富みます。経理部は¥223,033,152を取り除き、¥300,334を残しています。
この¥300,334はH&R自身の無関係な6530です（第3.4節）。
すなわち経理部も、本モデルと同様に「会社 +
勘定科目コード」で特定しておられます。
いずれか一方が勘定科目コードのみで特定していれば、この行は一致しません。

Account 6530 is the single most useful line. The finance team removed
¥223,033,152 and left ¥300,334 standing --- H&R\'s own unrelated 6530
(Section 3.4). They key their elimination on entity plus account code,
exactly as this model does; had either side keyed on the account code
alone, this line would differ.

**検証Cは実績のみを対象としており、これは意図的なものです。**
連結レポートの予算列は、 予実表ファイルが保持する `01 ``当初予算`
とは異なる予算です。

**Control C covers actuals only, and deliberately so.** The consolidated
report\'s budget column is a different budget from the `01 ``当初予算`
carried in the 予実表 files:

  ------------------------------------------------------------------------
  項目 Item           連結レポート          本モデル This    差異
                      Consolidated report   model            Difference
  ------------------- --------------------- ---------------- -------------
  予算 売上高 Budget  1,622,910,000         1,613,063,469    (9,846,531)
  revenue                                                    

  予算 売上原価       598,550,000           597,109,167      (1,440,833)
  Budget cost of                                             
  sales                                                      

  予算 売上総利益     1,024,360,000         1,015,954,302    (8,405,698)
  Budget gross profit                                        
  ------------------------------------------------------------------------

レポート側の数値は千円単位の丸い数字であり、会計システムが保持する予算とは別に
策定・承認された予算であることを示しています。これはいずれかの資料の誤りではなく、
2つの異なる予算です。したがって
**本モデルの予算数値が連結レポートと一致するという主張は
行っておりません。**
同レポートの予算列をモデルの検証に用いるべきではありません。 Power
BIレポートでどの予算を表示すべきかは経理部のご判断事項です。
本モデルは現在、実績と同じファイルに収録されているという理由から予実表の予算を使用しています。

The report\'s figures are round thousands, which indicates a budget set
and approved separately rather than the one the accounting system
carries. This is not a defect in either source --- they are two
different budgets. It does mean that **no claim is made that the
model\'s budget figures reconcile to the consolidated report**, and the
model should not be validated against that column. Which budget the
Power BI report should present is a question for the finance team; the
model currently carries the 予実表 budget, because that is what arrives
with the actuals in the same file.

長期的には検証Aと検証Bの方が重要です。検証CはPower
BIが置き換えたのちに更新されなくなる
スプレッドシートとの照合であるのに対し、検証Aと検証Bは会計システム自身の出力との照合であり、
今後も有効であり続けます。

Controls A and B are the more important ones in the long term. Control C
compares against a spreadsheet that will stop being maintained once
Power BI replaces it; Controls A and B compare against the accounting
system\'s own output and will therefore remain valid indefinitely.

> 本モデルではなく連結レポート内部の事項として1点申し添えます。同レポートの集計シートの
> ひとつでは3月の売上原価が44,684,798、売上総利益が72,266,752となっており、
> `国内３社``PL``（準備資料）` シートの44,727,158および72,224,392と、
> それぞれ¥42,360ずつ逆方向に相違しています。通期合計はいずれも同額です。
> 本モデルは `国内３社``PL``（準備資料）` に照合しています。
>
> One observation, internal to the consolidated report rather than to
> this model: one of its summary sheets shows March cost of sales as
> 44,684,798 and March gross profit as 72,266,752, where the
> `国内３社``PL``（準備資料）` sheet shows 44,727,158 and 72,224,392 ---
> a difference of ¥42,360 in each, in opposite directions. The full-year
> totals are the same on both. The model ties to
> `国内３社``PL``（準備資料）`.

Controls A and B are the more important ones in the long term. Control C
compares against a spreadsheet that will stop being maintained once
Power BI replaces it; Controls A and B compare against the accounting
system\'s own output and will therefore remain valid indefinitely.

### 5.2 計算を独自にご確認いただく方法

### 5.2 Checking the calculation independently

本書には `RNA_Elimination_Proof_JP.xlsx` を添付しています。
元データから連結結果までの計算全体を、Excelの数式として表示したブックです。

`RNA_Elimination_Proof_JP.xlsx` accompanies this document. It is an
Excel workbook that shows the whole calculation, from the source data to
the consolidated result, as live formulas.

  -----------------------------------------------------------------------
  シート Sheet          内容 Contents
  --------------------- -------------------------------------------------
  はじめに Read me      ブックの説明、色の意味、確認方法\
                        What the workbook is, the colour key, and how to
                        check it

  入力 H&R              H&Rの出力をそのまま収録 ---
                        全科目行、24か月分の列\
                        The H&R export, verbatim --- every account row,
                        all 24 monthly columns

  入力 RELO             リロジャパンの出力をそのまま収録\
                        The RELO export, verbatim

  入力 RNA Group        RNA Groupの出力をそのまま収録\
                        The RNA Group export, verbatim

  入力 IJ               イミグレーションジャパン --- 手入力の数値のみ\
                        Immigration Japan --- the only hand-entered
                        figures

  消去 Elimination      7項目を、科目残高から3つのステップで組み立て\
                        The seven lines, built in three visible steps
                        from the account balances

  連結PL Consolidated   月次および通期の結果\
  P&L                   The result, by month and for the full year

  検証 Checks           検証A・B・C・D、すべて数式\
                        Controls A, B, C and D, all live
  -----------------------------------------------------------------------

**手入力されているのは4つの「入力」シートの数値のみです。**
青色で表示しており、
いずれも各シート冒頭に記載したファイルからの転記です。ブック内のそれ以外の数値はすべて
Excelの数式です。任意の出力セルをクリックすれば、どのセルから算出されたかが数式バーに表示されます。

**Only the figures on the four Input sheets are typed in.** They are
shown in blue, and each one is copied from the file named at the top of
its sheet. Every other number in the workbook is an Excel formula.
Clicking any output cell shows in the formula bar exactly which cells it
came from.

たとえば「消去」シートのEL1は `=-(N7-N8-N9)`
です。すぐ上の3行を参照しており、 その3行自体も「入力」シートからRELO
6530、H&R 5255、H&R 5135を読み取る数式です。

On the Elimination sheet, for example, EL1 reads `=-(N7-N8-N9)` --- the
three rows directly above it, which are themselves formulas reading RELO
6530, H&R 5255 and H&R 5135 off the Input sheets.

本ブックのご利用にあたり、インストールや特別なソフトウェアは一切必要ありません。
Excelで開けば自動的に再計算されます。

The workbook requires nothing to be installed and no special software.
It opens in Excel and recalculates on its own.

ロジックをコードとしてご確認されたい場合のために、同じ計算を行い同じ4つの検証を表示する
`rna_consolidation.py`
も添付しています。本ブックをご確認いただくうえで必須のものではありません。

A second implementation, `rna_consolidation.py`, is also supplied for
anyone who prefers to read the logic as code. It performs the same
calculation and prints the same four controls. It is not needed in order
to check the workbook.

### 5.3 未検証の事項

### 5.3 What has not yet been verified

本書の位置づけを明確にするため、率直に記載します。

Stated plainly, so that the status of this document is clear:

-   **Power BIモデルは未構築です。**
    第4節および第5節の内容はすべて、元ファイルを直接読み取る
    参照用スクリプトが算出したものです。第7節・第8節のPower
    QueryおよびDAXはこれを再現するよう
    記述していますが、まだ実行していません。 **The Power BI model has
    not been built.** Everything in Sections 4 and 5 was produced by the
    reference script, reading the source files directly. The Power Query
    and DAX in Sections 7 and 8 are written to reproduce it, but have
    not yet been run.
-   **FY2025のみを読み込んでいます。**
    前年同期比の列にはFY2024のファイルが必要です。 **Only FY2025 is
    loaded.** Prior-year comparative columns require the FY2024 files.
-   **Diggleの出力との一行ずつの照合は未実施です。**
    照合したのは経理部作成の連結レポートのみです。
    Diggleとの一行ずつの照合は並行運用時に行うべきものです。 **Diggle\'s
    own output has not been compared line by line.** Only the finance
    team\'s consolidated report has. A line-by-line comparison against
    Diggle belongs in the parallel run.
-   **部門別の区分はありません。**
    現在の出力は法人単位のみです。第10節をご参照ください。 **No
    divisional split.** The current export is at legal-entity level
    only. See Section 10.

### 5.4 ご留意いただきたい発見事項

### 5.4 One finding that requires attention

**EL5には対応する原価側がありません。**

**EL5 has no matching cost side.**

他の消去項目は、一方の会社の売上高と他方の会社の原価を取り除くため、
グループ利益への影響はありません。EL5のみが例外です。

Every other elimination removes revenue in one entity and the matching
cost in the other, so the pair has no effect on group profit. EL5 is the
exception.

リロジャパンはイミグレーションジャパンにシェアードサービス料として¥5,760,000
（1月から3月まで月額¥1,920,000）を請求し、リロジャパン勘定科目5145に計上しています。
これを取り除くと売上高が¥5,760,000減少します。しかし対応する¥5,760,000の原価は
**入手しているデータには存在しません。** `IJ data coversion.xlsx`
によれば、 イミグレーションジャパンのFY2025の原価総額は¥278,199です。

RELO charges Immigration Japan ¥5,760,000 for shared services ---
¥1,920,000 a month from January to March --- booked to RELO account
5145. Removing it takes ¥5,760,000 out of revenue. The matching
¥5,760,000 of cost is **not present in the data available**: Immigration
Japan\'s total cost for FY2025, per `IJ data coversion.xlsx`, is
¥278,199.

したがってEL5は、相殺されることなく連結売上総利益を¥5,760,000減少させています。

So EL5 reduces consolidated gross profit by ¥5,760,000 with no offset.

**理由は判明しました。** `IJ data coversion.xlsx`
によれば、イミグレーションジャパンは 当該費用を勘定科目
`7540 ``業務委託費`（同ファイル上の名称は `外注費（リロ業務委託費）`、
月額¥1,920,000 × 3か月）に計上しています。IJの損益計算書シートでは、
この科目は `P3002 ``経費計` に属します。すなわち
**売上総利益より下の販管費** であり、 売上原価ではありません。

**The reason is now established.** `IJ data coversion.xlsx` shows
Immigration Japan booking that charge to account `7540 ``業務委託費` ---
described in the file as `外注費（リロ業務委託費）`, ¥1,920,000 a month
for three months. On the IJ P&L sheet that account sits under
`P3002 ``経費計`, which is **SG&A --- below the gross profit line**, not
cost of sales.

したがって¥5,760,000は欠落しているのではなく、売上原価側の消去では到達できない区分に
計上されているだけです。帰結は2点です。

So the ¥5,760,000 is not missing. It is simply booked where a
cost-of-sales elimination cannot reach it. Two consequences:

1.  **売上総利益までは、本モデルは現状のままで正しい。**
    経理部作成の連結結果を完全に
    再現しています。そちらでも同じ処理がなされているためです。教科書的な連結と比べると
    連結売上総利益は¥5,760,000過小ですが、双方で同一の処理となっています。
    **At gross profit, the model is correct as it stands.** It
    reproduces the finance team\'s own consolidated result exactly,
    because the same treatment is applied there.
2.  **売上総利益より下まで拡張する場合、EL5には売上原価ではなく、
    イミグレーションジャパンの** `7540 ``業務委託費`
    **に対する消去が必要です。**
    これを行わないと営業利益が¥5,760,000過大となります。 **If the model
    is extended below gross profit, EL5 needs a matching elimination
    against Immigration Japan** `7540 ``業務委託費` **--- not against
    cost of sales.** Without it, operating profit would be overstated by
    ¥5,760,000.

モデルでは当該金額を消去合計に埋没させず、`EL5 Unmatched`
メジャーとして個別に表示します。
第6節の項目4は、未解決の問いではなく確認依頼に変わりました。

The model surfaces the amount separately, through the `EL5 Unmatched`
measure, rather than absorbing it into the elimination total. Item 4 in
Section 6 is now a confirmation rather than an open question.

## 6. ご確認をお願いしたい事項

## 6. Items for confirmation

以下の事項について、経理部のご確認またはご判断をお願いいたします。
各項目について、必要な内容とその理由を記載しています。
本一覧のいずれもPower BIモデルの構築を妨げるものではありませんが、
モデルを正式な作成元として扱う前に、項目1・2・4は解決しておく必要があります。

The following points require confirmation or a decision from the finance
team. Each is stated with what is needed and why it matters. Nothing in
this list prevents the Power BI model from being built; items 1, 2 and 4
should be settled before the model is treated as the system of record.

コメントを直接お付けいただけるよう、各項目を独立した見出しとして記載しています。
ご回答は各項目末尾の欄にご記入いただくこともできます。

Each item is set out separately below so that a comment can be attached
to it directly. A space for your response is provided at the end of each
one.

### 6.1 勘定科目5230の補助科目内訳

### 6.1 Account 5230 sub-account breakdown

**必要な内容。**
勘定科目5230の補助科目内訳表を月次で、通常の出力に追加していただくこと

**What is needed.** The 補助科目内訳表 for account 5230, monthly, added
to the regular export

**重要性。**
現在EL1は原価側から算出しています。この内訳があれば直接読み取りとなり、算出は主たる規則ではなく追加の照合手段となります。

**Why it matters.** EL1 is currently derived from the cost side. With
this breakdown it becomes a direct read, and the derivation becomes an
additional cross-check rather than the primary rule.

**経理部ご回答欄 / Finance team response:**

> []{#_Toc244353499
> .anchor}**（経理回答）補助科目は、「勘定奉行」の出力データにオプションとして含めることが可能です。**
>
> **なお、「通常の出力」については月次での出力を想定しております。**
>
> **具体的に、誰がいつ、どの担当者にデータを引き渡すか等の運用フローにつきましては、今後協議のうえ検討させていただきたく存じます。**
>
> **なお、CPとの連携についてはスムーズに行えております。**

### 6.2 予算における消去差額 ¥6,602,954

### 6.2 Budget elimination difference of ¥6,602,954

**必要な内容。** この金額が何を表すかのご確認

**What is needed.** Confirmation of what this represents

**重要性。**
予算でEL1を消去したのち、勘定科目5230に¥6,602,954が残り、各月に不規則に分布しています。実績では対応する金額が¥62,500で、外部売上とご説明いただいております。予算の金額はその約100倍で、理由が未確認です。最も可能性が高いのは、内部取引の予算が各社で個別に設定され、相互に調整されていないことです。ご確認いただくまでは、予算の売上総利益が最大¥6.6百万過大となっている可能性があります。

**Why it matters.** After eliminating EL1 on budget, ¥6,602,954 remains
in account 5230, spread irregularly across the months. On actual the
equivalent figure is ¥62,500 and has been explained as external revenue.
The budget figure is a hundred times larger and unexplained. The most
likely cause is that inter-company budgets are set independently by each
entity and are not reconciled between them. Until this is confirmed,
budget gross profit may be overstated by up to ¥6.6m.

**経理部ご回答欄 / Finance team response:\
**（CP回答）\
予算に関する事項ですのでCorporate
Planningでも確認しましたが、現時点では、ご質問の¥6,602,954が具体的に何を表しているのか判断できていません。

参考Excelでは、H&Rの5230年間予算¥219,485,603に対し、EL1の年間予算消去額として¥212,882,649が計算され、その差額が¥6,602,954となっていることは確認できます。

一方、Elimination
TabではEL1の月次欄は実績値となっており、「予算でEL1を消去した後、¥6,602,954が各月に不規則に分布している」との記載については、**どのデータおよび計算を指しているのか確認できませんでした。**

なお、Corporate
Planningの予算作成実務では、**Diggleに登録する予算はDivisionおよびLocation単位のグロス売上をベースに作成しており、連結時の社内取引消去を前提とした予算作成は行っていません。**\
したがって、**今回提示されているEL1による予算消去および¥6,602,954の差額は、Corporate
Planningの予算作成方法とは異なる前提に基づくものと認識しており、Corporate
Planningから当該差額の内容・原因を説明することはできません。**

### 6.3 イミグレーションジャパンのソースデータ

### 6.3 Immigration Japan source data

**必要な内容。**
他の3社と同じ様式によるイミグレーションジャパンの予算実績対比表、およびIJの予算

**What is needed.** A 予算実績対比表 export for Immigration Japan on the
same template as the other three entities, plus an IJ budget

**重要性。**
イミグレーションジャパンは現在、モデル内で唯一の手入力数値です。標準の出力が整備されれば、IJも他社と同様に読み込まれ、手入力部分は削除されます。

**Why it matters.** Immigration Japan is currently the only hand-entered
figure in the model. Once a standard export exists, IJ is read exactly
like the other entities and the hand-entered block is removed.

[]{#_Toc244353503 .anchor}**経理部ご回答欄 / Finance team response:\
\
（経理回答）実績値については「勘定奉行」を使用せず、IJ社の栗原様が作成されているため、奉行から取得可能なデータはございません。経理部門ではExcel形式で受領し、連結システムへ転記しています。\
\
（CP回答）　CPではIJ社をDivision /
BG（IM）として管理しており、「Diggle」上において他のBGと同様に売上・原価の予算を作成しています。本予算は経理部門へ共有のうえ、連結レポートの売上・原価予算に反映しております。**

### 6.4 イミグレーションジャパンのリロジャパンからのシェアードサービス料¥5,760,000

### 6.4 Immigration Japan\'s ¥5,760,000 shared services charge from RELO

**必要な内容。** 新たな回答ではなく、`7540 ``業務委託費`
で正しいかのご確認

**What is needed.** Confirmation that `7540 ``業務委託費` is the correct
account, rather than a new answer

**重要性。** `IJ data coversion.xlsx` では
`7540 ``業務委託費`（`外注費（リロ業務委託費）`）に計上されており、売上総利益より下の販管費に属します（第5.4節）。これにより問いは解消しており、作業の支障にはなりません。ここに掲げているのは、出典が会計システムの出力ではなく手作業のブックであること、および売上総利益より下まで拡張する場合の消去先を決める事項であるためです。

**Why it matters.** `IJ data coversion.xlsx` shows this booked to
`7540 ``業務委託費`, which sits in SG&A below gross profit --- see
Section 5.4. This answers the question, so nothing is blocked. It is
listed here only because the source is a hand-built workbook rather than
an accounting-system export, and because it determines where the
matching elimination goes if the model is extended below gross profit.

**経理部ご回答欄 / Finance team response:\
\
\
（経理回答）連結上は消去済みです。IJの栗原さんから受領した試算表では業務委託費（販管費）に計上されており、この科目区分はあえて変更していません。**

### 6.5 イミグレーションジャパンの¥278,199の取扱い

### 6.5 Treatment of Immigration Japan\'s ¥278,199

**必要な内容。**
ご判断ではなく、ご参考までの申し添えです。連結レポートが既に答えを示しています。

**What is needed.** Noting, rather than a decision --- the consolidated
report already answers it

**重要性。**
御社の2つの資料の記載が食い違っています。イミグレーションジャパンの試算表では当該金額を
`7250 ``支払手数料`（販管費）に割り当て、`6540`
はゼロとなっています。一方、連結レポートでは売上原価に計上されており、同レポートの
`6540 ``ｲﾐｸﾞﾚｰｼｮﾝ原価` は¥7,446,010、すなわちH&R ¥537,326 + リロジャパン
¥6,630,485 + 当該¥278,199
です。本モデルは連結レポートに従っているため、いずれにせよ照合は成立します。金額はグループ売上原価の0.05%です。2つの資料が異なる点をご承知おきいただければ幸いです。

**Why it matters.** Two of the client\'s own files disagree. IJ\'s trial
balance maps the amount to `7250 ``支払手数料` (SG&A) and shows `6540`
at zero. The consolidated report puts it in cost of sales: its `6540` is
¥7,446,010 = H&R ¥537,326 + RELO ¥6,630,485 + this ¥278,199. This model
follows the consolidated report, so the reconciliation holds either way.

**経理部ご回答欄 / Finance team response:**

[]{#_Toc244353507 .anchor}**（CP回答）**\
了解しました。Corporate
Planningでも、経理作成のコンソリレポートを管理会計実績の基礎として使用しています。

### 6.6 当期純利益による統制

### 6.6 The net profit control

**必要な内容。**
どのファイル・シートで管理されているか、および許容する差異の範囲

**What is needed.** Which file and sheet it is maintained in, and the
tolerance that is acceptable

**重要性。**
経理部より、4社の当期純利益合計（¥228,436,492）と連結当期純利益（¥88,386,492）を照合し、差額¥140,050,000をグループ内配当¥140,000,000と残額¥50,000とする統制をご提案いただきました。これは妥当な統制であり、恒久的な統制として採用をお勧めします。Diggleや手作業のスプレッドシートとの比較と異なり、それらの廃止後も有効であり続けるためです。ただし2点申し添えます。**(a)**
これを唯一の統制とすることはできません。本モデルの消去はいずれも当期純利益への影響がゼロであるため、売上高側の消去がすべて誤っていても利益ベースの統制はそのまま合格してしまいます。検証A〜Cと置き換えるのではなく、併用する必要があります。

現在定められていません。たとえば連結当期純利益の0.1%といった明示的な許容範囲を定め、これを超える差額は一行ずつ説明することをお勧めします。

**Why it matters.** The finance team proposed a control reconciling the
sum of the four entities\' net profit (¥228,436,492) to consolidated net
profit (¥88,386,492), the ¥140,050,000 difference being the ¥140,000,000
intra-group dividend plus a ¥50,000 remainder. This is a sound control
and is recommended as a permanent one, because unlike a comparison
against Diggle or against a manual spreadsheet it survives their
retirement. Two points, however: **(a)** it cannot be the only control,
because every elimination in this model has zero net profit effect, so a
profit-based control would pass unchanged even if every revenue
elimination were wrong --- it needs to sit alongside Controls A to C,
not replace them; and **(b)** the \"retained earnings adjustments\"
allowance in it is currently open-ended. A stated tolerance is
recommended --- for example 0.1% of consolidated net profit --- above
which the difference is explained line by line.

**経理部ご回答欄 / Finance team response:\
**

[]{#_Toc244353509
.anchor}**（経理回答）　「利益のチェックのみでは連結上の消去仕訳の検証が不十分である」とのご指摘に対し、実績における検証手法として「Division別Referralの売上消去確認」を実施し、これを内部統制として運用しています。**

### 6.7 期末のグループ間棚卸資産

### 6.7 Inter-company inventory at the year end

**必要な内容。** 存在しないことのご確認、または存在する場合はその金額

**What is needed.** Confirmation that none exists, or quantification if
it does

**重要性。**
現在グループ間の棚卸資産はないとの前提に立っています。これは前提とせず確認すべき事項です。リースジャパンは車両および家具を転貸しており、H&Rの勘定には
`5906 ``転ﾘｰｽ車両売上`（¥157,145,252）および
`5908 ``家具ﾚﾝﾀﾙ売上（転貸）`（¥153,133,568）が、リロジャパンには
`5310 ``転貸借売上` および `6595 ``転貸借売上原価`
が計上されています。これらの資産が期末に他のグループ会社の貸借対照表に利益を上乗せした原価で計上されている場合、棚卸資産に未実現利益が存在し、合算利益と連結利益は一致しません。

**Why it matters.** The position taken is that there is currently no
inter-company inventory. This is worth testing rather than assuming.
Lease Japan subleases vehicles and furniture, and H&R\'s accounts carry
`5906 ``転ﾘｰｽ車両売上` (¥157,145,252) and `5908 ``家具ﾚﾝﾀﾙ売上（転貸）`
(¥153,133,568) against RELO\'s `5310 ``転貸借売上` and
`6595 ``転貸借売上原価`. If any of that stock sits on another group
entity\'s balance sheet at a marked-up cost at the year end, there is
unrealised profit in inventory, and combined profit is not the same as
consolidated profit.

**経理部ご回答欄 / Finance team response:**

###  （経理回答）　グループ会社間の棚卸資産はございません。

### 6.8 部門別の出力

### 6.8 Departmental export

**必要な内容。** H&R神戸を含む全拠点を対象とした、各社の部門内訳表

**What is needed.** A 部門内訳表 export per entity, covering all
locations including H&R Kobe

**重要性。**
部門別損益計算書（BG1〜BG4の区分）を作成する唯一の方法です。第10節をご参照ください。

**Why it matters.** The only route to divisional P&L reporting --- the
BG1 to BG4 structure. See Section 10.

**経理部ご回答欄 / Finance team response:\
**

**（経理回答）　経理から実績データは提供可能です。**

**（CP回答）**\
Corporate
Planningの管理会計では、**財務会計ベースの実績にLocationを付与し、Locationを基にDivision／BGを構成しています。**\
そのため、Power
BIで部門別の実績を表示する際には、**現在のLocation／Division／BGによる管理会計の考え方を踏える必要があります。**

### 6.9 FY2024のファイル

### 6.9 FY2024 files

**必要な内容。** 全社のFY2024予実表ファイル

**What is needed.** The FY2024 予実表 files for all entities

**重要性。**
前年同期比の列に必要です。モデルの変更は不要で、同じ関数で読み込まれます。

**Why it matters.** Required for prior-year comparative columns. No
change to the model is needed; they load through the same function.

**経理部ご回答欄 / Finance team response:**

**（経理回答）　2024年度の連結レポートを共有します。こちらで、FY2024の月次予算・実績を確認でき、前年同期比較にも使えます。**

## 7. Power Query仕様

## 7. Power Query specification

以下の順に作成してください。各クエリは独立しており、Power BI Desktopで
**ホーム → 新しいソース → 空のクエリ** から **表示 → 詳細エディター**
に貼り付けます。
後のクエリが前のクエリを名前で参照するため、次へ進む前に各見出しの名称へ必ず変更してください。

Build in the order below. Each query is self-contained and is pasted
into a blank query in Power BI Desktop via **Home → New Source → Blank
Query**, then **View → Advanced Editor**. Rename each query to the name
in its heading before continuing --- later queries reference earlier
ones by name.

> **コード内のコメントについて / A note on the code comments**
> 以下のコードは英語版仕様書とまったく同一です。コピー＆ペーストで差異が生じないよう、
> 識別子と構文は変更していません。コメントのみ日本語を併記しています。
> The code below is identical to the English specification. Identifiers
> and syntax are unchanged so that copy-and-paste cannot introduce a
> difference between the two documents. Only the comments carry added
> Japanese.

### 7.1 パラメーター

### 7.1 Parameters

**ホーム → パラメーターの管理 → 新規作成**、種類は **テキスト**
で作成します。

Created with **Home → Manage Parameters → New Parameter**, type
**Text**.

  ------------------------------------------------------------------------------------------------
  名称 Name      値 Value
  -------------- ---------------------------------------------------------------------------------
  `p_Folder`     3つの入力ファイルを格納するフォルダー。**末尾に円記号（\\）を付けてください。**
                 例：`C:\RNA\FY2025\`\
                 The folder holding the three input files, **with a trailing backslash**, for
                 example `C:\RNA\FY2025\`

  `p_FileHR`     `H&R_FY2025``予実表``.xlsx`

  `p_FileRELO`   `RELO_FY2025``予実表``.xlsx`

  `p_FileRNAG`   `RNAG_FY2025``予実表``.xlsx`
  ------------------------------------------------------------------------------------------------

フォルダーをパラメーターとして保持することにより、コードを変更せずに、
後からレポートの参照先をSharePointへ切り替えることができます。

Holding the folder in a parameter is what allows the report to be
repointed at SharePoint later without any code change.

### 7.2 `ref_Section`

損益計算書の各区分を締めくくるPコード小計と、利益集計時の符号の対応表です。

Which P-code subtotal closes each section of the P&L, and the sign that
section carries.

    // ref_Section
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

### 7.3 `ref_Elimination`

第3.2節の消去項目一覧です。

The elimination register of Section 3.2.

    // ref_Elimination
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

### 7.4 `fn_LoadEntity`

3つの入力ファイルのいずれか1つを読み込む単一の関数です。
会社固有の記述を含まないため、4社目のファイルが増えても新たなコードは不要です。

The single function that reads any one of the three input files. Nothing
in it is specific to an entity, so a fourth entity file needs no new
code.

    // fn_LoadEntity
    // 奉行の予算実績対比表を1ファイル読み込み、縦持ち形式で返す。
    // 1行 = 会社 / 勘定科目 / 月 / 予算実績区分。
    // Reads one Bugyo 予算実績対比表 export and returns it in long format:
    // one row per Entity / Account / Month / Scenario.
    (FileName as text, EntityName as text, EntityCode as text) as table =>
    let
        Source   = Excel.Workbook(File.Contents(p_Folder & FileName), null, true),
        Sheet    = Source{[Item = "損益計算書", Kind = "Sheet"]}[Data],

        // --- 見出し行は行番号ではなく内容で特定する。現在はその上に6行の
        //     メタデータ行があるが、これが変わっても動作する。
        // --- Locate the header row by content, never by row number. Bugyo puts six
        //     metadata rows above it today; if that changes, this still works.
        ColB      = List.Transform(
                        Table.Column(Sheet, "Column2"),
                        each if _ = null then "" else Text.Trim(Text.From(_))),
        HeaderIdx = List.PositionOf(ColB, "科目名"),
        Guarded   = if HeaderIdx < 0
                    then error Error.Record(
                            "RNA.HeaderNotFound",
                            "Could not find 科目名 in column B of " & FileName
                            & ". The export layout has changed -- do not load this file.")
                    else HeaderIdx,
        Body      = Table.Skip(Sheet, Guarded),
        Promoted  = Table.PromoteHeaders(Body, [PromoteAllScalars = true]),

        // --- 月次の発生額の列のみを残す。
        //     (発生) = その月の発生額、(残高) = 期末累計残高。
        //     (残高) の列を取り込むと、モデル内のすべての数値がほぼ倍になる。
        // --- Keep monthly movement columns only.
        //     (発生) = movement in the month.  (残高) = year-to-date balance.
        //     Loading the (残高) columns roughly doubles every figure in the model.
        MonthCols = List.Select(Table.ColumnNames(Promoted), each Text.Contains(_, "(発生)")),
        GuardCols = if List.Count(MonthCols) = 0
                    then error Error.Record(
                            "RNA.NoMonthlyColumns",
                            "No (発生) columns found in " & FileName)
                    else MonthCols,
        Kept      = Table.SelectColumns(Promoted, List.Combine({{"コード", "科目名"}, GuardCols})),
        Renamed   = Table.RenameColumns(Kept, {{"コード", "AccountCode"}, {"科目名", "AccountName"}}),
        Clean     = Table.TransformColumns(
                        Renamed,
                        {
                            {"AccountCode", each if _ = null then "" else Text.Trim(Text.From(_)), type text},
                            {"AccountName", each if _ = null then "" else Text.Trim(Text.From(_)), type text}
                        }),
        NumTyped  = Table.TransformColumnTypes(Clean, List.Transform(GuardCols, each {_, type number})),
        Indexed   = Table.AddIndexColumn(NumTyped, "RowNo", 0, 1, Int64.Type),

        // --- 各明細行を、その「下」にある区分小計に割り当てる。
        // --- Assign each detail row to the section subtotal that sits BELOW it.
        PCodeList   = ref_Section[PCode],
        SectionRows = Table.SelectRows(Indexed, each List.Contains(PCodeList, [AccountCode])),
        SecRowNo    = List.Buffer(SectionRows[RowNo]),
        SecPCode    = List.Buffer(SectionRows[AccountCode]),

        // 明細行は4桁の数字コードを持つ行。Pコード行と空白行はここで除かれる。
        // Detail rows are the ones with a 4-digit numeric code. P-code rows and any
        // blank spacer rows drop out here.
        Detail    = Table.SelectRows(
                        Indexed,
                        each Text.Length([AccountCode]) = 4
                         and Text.Select([AccountCode], {"0".."9"}) = [AccountCode]),
        WithPCode = Table.AddColumn(
                        Detail, "PCode",
                        (row) =>
                            let
                                Below = List.Select(SecRowNo, each _ > row[RowNo]),
                                // Number.Min ではなく List.Min。Mに Number.Min は存在しない。
                                // List.Min, not Number.Min -- Number.Min does not exist in M
                                First = if List.Count(Below) = 0 then null else List.Min(Below),
                                Pos   = if First = null then -1 else List.PositionOf(SecRowNo, First)
                            in
                                if Pos < 0 then null else SecPCode{Pos},
                        type text),

        Joined    = Table.NestedJoin(WithPCode, {"PCode"}, ref_Section, {"PCode"}, "sec", JoinKind.LeftOuter),
        Expanded  = Table.ExpandTableColumn(Joined, "sec", {"Section", "SectionNo", "Sign"}),

        // --- どの区分にも属さないコード付きの行は、様式変更の兆候である。
        //     黙って金額を失うのではなく、明示的にエラーとする。
        // --- A coded row that falls outside every P&L section is a layout change.
        //     Fail loudly rather than silently losing money.
        Orphans   = Table.SelectRows(Expanded, each [Section] = null),
        GuardOrph = if Table.RowCount(Orphans) > 0
                    then error Error.Record(
                            "RNA.UnmappedAccount",
                            "Account rows fall outside every P&L section in " & FileName,
                            Text.Combine(List.Distinct(Orphans[AccountCode]), ", "))
                    else Expanded,

        // --- 24の月次列を24行に展開する。
        // --- 24 monthly columns become 24 rows.
        Unpivoted = Table.UnpivotOtherColumns(
                        GuardOrph,
                        {"AccountCode", "AccountName", "RowNo", "PCode", "Section", "SectionNo", "Sign"},
                        "Header", "Amount"),

        // --- "2025年  4月実績(発生)" -> Date = 2025年4月1日、Scenario = Actual
        // --- "2025年  4月実績(発生)" -> Date = 1 Apr 2025, Scenario = Actual
        WithDate  = Table.AddColumn(
                        Unpivoted, "Date",
                        each #date(
                                Number.From(Text.Start([Header], 4)),
                                Number.From(Text.Trim(Text.BetweenDelimiters([Header], "年", "月"))),
                                1),
                        type date),
        WithScen  = Table.AddColumn(
                        WithDate, "Scenario",
                        each if Text.Contains([Header], "予算") then "Budget" else "Actual",
                        type text),

        Tagged    = Table.AddColumn(WithScen, "Entity",     each EntityName, type text),
        Tagged2   = Table.AddColumn(Tagged,   "EntityCode", each EntityCode, type text),
        Tagged3   = Table.AddColumn(Tagged2,  "RecordType", each "Source",   type text),
        Tagged4   = Table.AddColumn(Tagged3,  "ElimID",     each null,       type text),

        Zeroed    = Table.ReplaceValue(Tagged4, null, 0, Replacer.ReplaceValue, {"Amount"}),
        NonZero   = Table.SelectRows(Zeroed, each [Amount] <> 0),

        Out       = Table.SelectColumns(
                        NonZero,
                        {"Entity", "EntityCode", "AccountCode", "AccountName",
                         "Section", "SectionNo", "Sign", "Date", "Scenario",
                         "Amount", "RecordType", "ElimID"})
    in
        Out

### 7.5 `fact_IJ` --- イミグレーションジャパン

### 7.5 `fact_IJ` --- Immigration Japan

第2.3節のとおり、モデル内で唯一の手入力データです。

Section 2.3 applies: this is the only hand-entered data in the model.

    // fact_IJ
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

### 7.6 `fact_Source`

    // fact_Source
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

### 7.7 `fact_Elimination`

    // fact_Elimination
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

### 7.8 `fact_PL` --- モデルに読み込むテーブル

### 7.8 `fact_PL` --- the table loaded to the model

    // fact_PL
    // 元データの行と消去の行を結合したもの。レポートが使用する唯一のファクトテーブル。
    // Source rows plus elimination rows. This is the only fact table the report uses.
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

`fact_Source`、`fact_Elimination`、`fact_IJ`、`ref_Section`、`ref_Elimination`
は クエリを右クリックして **読み込みを有効にする = オフ**
に設定してください。 読み込むのは
`fact_PL`、ディメンションテーブル、および2つの検証クエリのみです。

Set `fact_Source`, `fact_Elimination`, `fact_IJ`, `ref_Section` and
`ref_Elimination` to **Enable load = off** (right-click the query). Only
`fact_PL`, the dimension tables and the two check queries should load.

### 7.9 `dim_Date`

    // dim_Date
    // 日本の会計年度：4月〜3月。FY2025 = 2025年4月〜2026年3月。
    // Japanese fiscal year: April to March. FY2025 = Apr 2025 to Mar 2026.
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

**モデルビュー** で `dim_Date` を選択し、**日付テーブルとしてマーク →**
`Date`。 `dim_Date[Date]` と `fact_PL[Date]`
を一対多・単一方向で関連付けます。

In **Model view**, select `dim_Date` → **Mark as date table** → `Date`.
Relate `dim_Date[Date]` to `fact_PL[Date]`, one-to-many, single
direction.

`fact_PL[Date]` は常に月初日のため、関連付けはそのまま機能します。
レポートがアルファベット順ではなく4月〜3月の順で並ぶよう、`MonthName` と
`FYMonthLabel` を `FiscalMonthNo` で並べ替えてください。

`fact_PL[Date]` is always the first of the month, so the relationship
works directly. Sort `MonthName` and `FYMonthLabel` by `FiscalMonthNo`
so the report runs April to March rather than alphabetically.

### 7.10 `dim_Entity`

    // dim_Entity
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

`dim_Entity[EntityCode]` と `fact_PL[EntityCode]`
を一対多で関連付けます。

Relate `dim_Entity[EntityCode]` to `fact_PL[EntityCode]`, one-to-many.

### 7.11 `dim_Scenario`

    // dim_Scenario
    let
        T = #table(
            type table [Scenario = text, SortOrder = Int64.Type],
            {{"Actual", 1}, {"Budget", 2}}
        )
    in
        T

`dim_Scenario[Scenario]` と `fact_PL[Scenario]` を一対多で関連付けます。

Relate `dim_Scenario[Scenario]` to `fact_PL[Scenario]`, one-to-many.

### 7.12 `chk_ImportIntegrity` --- Power BI内での検証A

### 7.12 `chk_ImportIntegrity` --- Control A inside Power BI

取り込みで欠落がないことを証明するクエリです。各ファイルが **自ら**
表示している
Pコード小計を読み取り、取り込んだ明細行の合計と照合します。差異はすべてゼロでなければなりません。

This is the query that proves the import lost nothing. It reads each
file\'s **own** stated `P`-code subtotals and compares them against the
sum of the detail rows the import loaded. Every variance must be zero.

    // chk_ImportIntegrity
    // 検証A。各ファイルが自ら表示しているPコード小計を読み取り、取り込んだ内容と照合する。
    // Variance はすべて 0 でなければならない。0以外の行がある場合は、取り込みで欠落または
    // 重複が生じている。レポートのいかなる数値も信頼する前に原因を調査すること。
    // Control A. Reads each source file's own stated P-code subtotals and compares them
    // to what the import loaded. Every Variance must be 0. A non-zero row means the
    // import dropped or duplicated something -- investigate before trusting any number
    // in the report.
    let
        ReadSubtotals = (FileName as text, EntityName as text) as table =>
            let
                Source    = Excel.Workbook(File.Contents(p_Folder & FileName), null, true),
                Sheet     = Source{[Item = "損益計算書", Kind = "Sheet"]}[Data],
                ColB      = List.Transform(Table.Column(Sheet, "Column2"),
                                           each if _ = null then "" else Text.Trim(Text.From(_))),
                HeaderIdx = List.PositionOf(ColB, "科目名"),
                Body      = Table.Skip(Sheet, HeaderIdx),
                Promoted  = Table.PromoteHeaders(Body, [PromoteAllScalars = true]),
                MonthCols = List.Select(Table.ColumnNames(Promoted), each Text.Contains(_, "(発生)")),
                Kept      = Table.SelectColumns(Promoted, List.Combine({{"コード"}, MonthCols})),
                Renamed   = Table.RenameColumns(Kept, {{"コード", "PCode"}}),
                Clean     = Table.TransformColumns(Renamed,
                                {{"PCode", each if _ = null then "" else Text.Trim(Text.From(_)), type text}}),
                OnlyP     = Table.SelectRows(Clean, each List.Contains(ref_Section[PCode], [PCode])),
                Long      = Table.UnpivotOtherColumns(OnlyP, {"PCode"}, "Header", "Stated"),
                WithDate  = Table.AddColumn(Long, "Date",
                                each #date(Number.From(Text.Start([Header], 4)),
                                           Number.From(Text.Trim(Text.BetweenDelimiters([Header], "年", "月"))), 1),
                                type date),
                WithScen  = Table.AddColumn(WithDate, "Scenario",
                                each if Text.Contains([Header], "予算") then "Budget" else "Actual", type text),
                WithEnt   = Table.AddColumn(WithScen, "Entity", each EntityName, type text),
                // 出力では 法人税等 (P6110) が負で表示される一方、明細行9000は正である。
                // 同じ条件で比較するため符号を反転する。
                // The export states 法人税等 (P6110) as a negative while its own detail
                // row 9000 is positive. Flip it so the comparison is like for like.
                Fixed     = Table.AddColumn(WithEnt, "StatedAdj",
                                each if [PCode] = "P6110" then - [Stated] else [Stated], type number),
                Out       = Table.SelectColumns(Fixed, {"Entity", "PCode", "Date", "Scenario", "StatedAdj"})
            in
                Out,

        Stated = Table.Combine({
                     ReadSubtotals(p_FileHR,   "H&R"),
                     ReadSubtotals(p_FileRELO, "RELO"),
                     ReadSubtotals(p_FileRNAG, "RNA Group")}),
        StatedS = Table.Group(Stated, {"Entity", "PCode"},
                      {{"Stated", each List.Sum([StatedAdj]), type number}}),
        StatedP = Table.NestedJoin(StatedS, {"PCode"}, ref_Section, {"PCode"}, "s", JoinKind.Inner),
        StatedX = Table.ExpandTableColumn(StatedP, "s", {"Section"}),

        // 実際に取り込んだ内容 -- 元データの行のみ、消去の行は含めない
        // What the import actually loaded -- source rows only, no eliminations
        Loaded  = Table.Group(
                      Table.SelectRows(fact_Source, each [RecordType] = "Source"
                                                   and [Entity] <> "Immigration Japan"),
                      {"Entity", "Section"},
                      {{"Imported", each List.Sum([Amount]), type number}}),

        Joined  = Table.NestedJoin(StatedX, {"Entity", "Section"}, Loaded, {"Entity", "Section"}, "l", JoinKind.LeftOuter),
        Exp     = Table.ExpandTableColumn(Joined, "l", {"Imported"}),
        Filled  = Table.ReplaceValue(Exp, null, 0, Replacer.ReplaceValue, {"Imported"}),
        Var     = Table.AddColumn(Filled, "Variance", each [Imported] - [Stated], type number),
        Out     = Table.Sort(Table.SelectColumns(Var, {"Entity", "Section", "Stated", "Imported", "Variance"}),
                             {{"Entity", Order.Ascending}, {"Section", Order.Ascending}})
    in
        Out

### 7.13 `chk_Diggle` --- 並行運用時の照合

### 7.13 `chk_Diggle` --- parallel-run comparison

Diggleの稼働中は、その出力をここに保持して照合します。照合したい数値ごとに1行です。
**Diggle廃止時にはこのクエリを削除してください。**
恒久的な統制としてはならない理由は 第5.1節に記載しています。

While Diggle is still running, hold its output here and compare. One row
per figure to be tied out. **Delete this query when Diggle is retired**
--- Section 5.1 explains why it must not become the permanent control.

    // chk_Diggle
    // Diggle自身の出力を照合用に保持する。並行運用時のみ使用。
    // Diggle's own output, keyed for comparison. Parallel-run only.
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

## 8. DAX仕様

## 8. DAX specification

メジャーテーブル（**ホーム → データの入力**、1行のみ、名称
`_Measures`、列は非表示） に作成します。

Created in a measure table (**Home → Enter data**, one row, named
`_Measures`, column hidden).

### 8.1 損益計算書の中核メジャー

### 8.1 Core P&L

    Gross Revenue =
    CALCULATE (
        SUM ( fact_PL[Amount] ),
        fact_PL[Section] = "Revenue",
        fact_PL[RecordType] = "Source"
    )

    Revenue Eliminations =
    CALCULATE (
        SUM ( fact_PL[Amount] ),
        fact_PL[Section] = "Revenue",
        fact_PL[RecordType] = "Elimination"
    )

    Revenue =
    CALCULATE ( SUM ( fact_PL[Amount] ), fact_PL[Section] = "Revenue" )

    Gross COGS =
    CALCULATE (
        SUM ( fact_PL[Amount] ),
        fact_PL[Section] = "COGS",
        fact_PL[RecordType] = "Source"
    )

    COGS Eliminations =
    CALCULATE (
        SUM ( fact_PL[Amount] ),
        fact_PL[Section] = "COGS",
        fact_PL[RecordType] = "Elimination"
    )

    COGS =
    CALCULATE ( SUM ( fact_PL[Amount] ), fact_PL[Section] = "COGS" )

    Gross Profit = [Revenue] - [COGS]

    Gross Margin % = DIVIDE ( [Gross Profit], [Revenue] )

`Revenue` に `RecordType`
のフィルターが不要な理由：消去の行はマイナスの金額を持ち、 かつ
`Section = "Revenue"` が付されているため、区分で単純に合計するだけで
消去後の純額になります。元データの行を削除せず、消去を行として追加する方式の利点です。

`Revenue` needs no `RecordType` filter: elimination rows are negative
and carry `Section = "Revenue"`, so a plain sum over the section is
already the net, post-elimination figure. That is the point of adding
eliminations as rows rather than deleting source rows.

### 8.2 売上総利益より下の区分

### 8.2 Below the gross-profit line

    SG&A =
    CALCULATE (
        SUM ( fact_PL[Amount] ),
        fact_PL[Section] IN { "SG&A Personnel", "SG&A Other" }
    )

    Operating Profit = [Gross Profit] - [SG&A]

    Non-operating Income =
    CALCULATE ( SUM ( fact_PL[Amount] ), fact_PL[Section] = "Non-operating income" )

    Non-operating Expense =
    CALCULATE ( SUM ( fact_PL[Amount] ), fact_PL[Section] = "Non-operating expense" )

    Ordinary Profit = [Operating Profit] + [Non-operating Income] - [Non-operating Expense]

    Extraordinary Income =
    CALCULATE ( SUM ( fact_PL[Amount] ), fact_PL[Section] = "Extraordinary income" )

    Extraordinary Loss =
    CALCULATE ( SUM ( fact_PL[Amount] ), fact_PL[Section] = "Extraordinary loss" )

    Tax = CALCULATE ( SUM ( fact_PL[Amount] ), fact_PL[Section] = "Tax" )

    Net Profit =
    [Ordinary Profit] + [Extraordinary Income] - [Extraordinary Loss] - [Tax]

これらは `P2000`、`P3000`、`P4000`、`P5000`、`P6000`、`P6100` を消去
**後** の数値で
再現するものです。元データのPコード行を意図的に取り込まないのはこのためです。

These recreate `P2000`, `P3000`, `P4000`, `P5000`, `P6000` and `P6100`
**after** elimination, which is why the source `P`-code rows are
deliberately not imported.

### 8.3 実績・予算・差異

### 8.3 Actual, budget and variance

    Revenue Act = CALCULATE ( [Revenue], dim_Scenario[Scenario] = "Actual" )
    Revenue Bud = CALCULATE ( [Revenue], dim_Scenario[Scenario] = "Budget" )
    Revenue Var = [Revenue Act] - [Revenue Bud]
    Revenue Var % = DIVIDE ( [Revenue Var], [Revenue Bud] )

    COGS Act = CALCULATE ( [COGS], dim_Scenario[Scenario] = "Actual" )
    COGS Bud = CALCULATE ( [COGS], dim_Scenario[Scenario] = "Budget" )
    COGS Var = [COGS Act] - [COGS Bud]

    GP Act = [Revenue Act] - [COGS Act]
    GP Bud = [Revenue Bud] - [COGS Bud]
    GP Var = [GP Act] - [GP Bud]
    GP Var % = DIVIDE ( [GP Var], [GP Bud] )

    GM% Act = DIVIDE ( [GP Act], [Revenue Act] )
    GM% Bud = DIVIDE ( [GP Bud], [Revenue Bud] )
    GM% Var pts = [GM% Act] - [GM% Bud]

Diggleでご利用いただいている「1か月あたり3列」の表示を再現するには、前年実績も必要です。

To reproduce the three-columns-per-month layout the finance team is used
to from Diggle, prior-year actual is also needed:

    Revenue PY Act =
    CALCULATE ( [Revenue Act], DATEADD ( dim_Date[Date], -1, YEAR ) )

    GP PY Act =
    CALCULATE ( [GP Act], DATEADD ( dim_Date[Date], -1, YEAR ) )

FY2024を読み込むまでは空白を返します。第6節の項目9をご参照ください。
FY2024の読み込みは同じ関数にファイルを追加するだけで、コードの変更はありません。

These return blank until FY2024 is loaded. See item 9 in Section 6;
loading FY2024 is one more set of files through the same function, with
no code change.

### 8.4 消去の内訳

### 8.4 Elimination detail

    Eliminations Total =
    CALCULATE ( SUM ( fact_PL[Amount] ), fact_PL[RecordType] = "Elimination" )

    Elimination by Line =
    CALCULATE ( SUM ( fact_PL[Amount] ), fact_PL[RecordType] = "Elimination" ) * -1

`Elimination by Line` をテーブルビジュアルに置き、行に `fact_PL[ElimID]`
と `fact_PL[AccountName]` を配置すると、第4.2節の消去内訳が得られます。

`Elimination by Line` on a table visual with `fact_PL[ElimID]` and
`fact_PL[AccountName]` on rows produces the elimination schedule of
Section 4.2.

### 8.5 検証メジャー

### 8.5 Controls

    -- 検証A。必ず 0。0以外の場合、取り込みで欠落または重複が生じている。第7.12節参照。
    -- Control A. Must be exactly 0. Non-zero means the import lost or duplicated
    -- something. See Section 7.12.
    Check Import Variance = SUM ( chk_ImportIntegrity[Variance] )

    Check Import Status =
    IF ( ABS ( [Check Import Variance] ) < 1, "PASS", "FAIL -- investigate" )

    -- 検証D。消去後に勘定科目5230に残る外部売上。
    -- FY2025実績：62,500。FY2025予算：6,602,954 -- 第6節 項目2参照。
    -- Control D. The external revenue left in account 5230 after elimination.
    -- FY2025 actual: 62,500. FY2025 budget: 6,602,954 -- see item 2 in Section 6.
    Check 5230 Residual =
    VAR Booked =
        CALCULATE (
            SUM ( fact_PL[Amount] ),
            fact_PL[Entity] = "H&R",
            fact_PL[AccountCode] = "5230",
            fact_PL[RecordType] = "Source"
        )
    VAR Eliminated =
        CALCULATE (
            SUM ( fact_PL[Amount] ),
            fact_PL[Entity] = "H&R",
            fact_PL[AccountCode] = "5230",
            fact_PL[RecordType] = "Elimination"
        )
    RETURN
        Booked + Eliminated

    -- EL1〜EL4は一方の会社の売上高と他方の会社の原価を取り除くため当期純利益への影響はなく、
    -- 本メジャーは必ず 0 になる。EL5は意図的に除外している -- 第5.4節参照。
    -- EL1 to EL4 remove revenue in one entity and the matching cost in the other, so
    -- they have no net profit effect and this measure must be exactly 0.
    -- EL5 is deliberately excluded -- see Section 5.4.
    Check Elimination Symmetry =
    VAR RevElim =
        CALCULATE (
            SUM ( fact_PL[Amount] ),
            fact_PL[RecordType] = "Elimination",
            fact_PL[Section] = "Revenue",
            fact_PL[ElimID] <> "EL5"
        )
    VAR CogElim =
        CALCULATE (
            SUM ( fact_PL[Amount] ),
            fact_PL[RecordType] = "Elimination",
            fact_PL[Section] = "COGS"
        )
    RETURN
        RevElim - CogElim

    -- EL5は入手データ上の原価側がないため、グループ利益を実際に減少させる。
    -- 埋没させず表面化させる。FY2025実績：5,760,000。第5.4節参照。
    -- EL5 has no cost side in the data available, so it does reduce group profit.
    -- Surfaced rather than absorbed. FY2025 actual: 5,760,000. See Section 5.4.
    EL5 Unmatched =
    CALCULATE (
        SUM ( fact_PL[Amount] ),
        fact_PL[RecordType] = "Elimination",
        fact_PL[ElimID] = "EL5"
    ) * -1

    -- Diggleとの並行運用時の照合。Diggle廃止時に削除すること。
    -- Parallel run against Diggle. Remove when Diggle is retired.
    Check vs Diggle =
    VAR D = SUM ( chk_Diggle[Diggle] )
    VAR M =
        SWITCH (
            SELECTEDVALUE ( chk_Diggle[Section] ),
            "Revenue", [Revenue Act],
            "COGS", [COGS Act]
        )
    RETURN
        M - D

## 9. レポートのページ構成

## 9. Report pages

  -------------------------------------------------------------------------------------------------------------------------------------------------
  ページ Page             内容 Content
  ----------------------- -------------------------------------------------------------------------------------------------------------------------
  **1.                    月次の売上高・売上原価・売上総利益・売上総利益率を、実績・予算・差異で表示。スライサー：会計年度、会社、予算実績区分。\
  グループ損益計算書**\   Revenue, cost of sales, gross profit and gross margin by month, actual against budget with variance. Slicers: fiscal
  **1. Group P&L**        year, entity, scenario.

  **2. 消去明細**\        `ElimID` × 月次。`ref_Elimination` の科目名と説明を併記。合算から連結へのウォーターフォール。\
  **2. Elimination        `ElimID` by month, with the account name and description from `ref_Elimination`. Gross to net waterfall.
  schedule**              

  **3. 会社別寄与**\      各社の合算売上高・売上原価、各社の帳簿に計上されている消去、およびグループ売上総利益への正味寄与。\
  **3. Entity             Each entity\'s gross revenue and cost of sales, the eliminations its own books carry, and its net contribution to group
  contribution**          gross profit.

  **4. 予算差異**\        月次・会社別の売上高・売上原価・売上総利益の差異。売上総利益率はポイント表示。\
  **4. Budget variance**  Revenue, cost of sales and gross profit variance by month and by entity; gross margin in percentage points.

  **5. 検証**\            `chk_ImportIntegrity` をテーブルで表示、検証メジャーをカードで表示、Diggle並行運用時の照合。\
  **5. Validation**       `chk_ImportIntegrity` as a table, the control measures as cards, and the Diggle parallel-run comparison.
  -------------------------------------------------------------------------------------------------------------------------------------------------

5ページ目は装飾ではありません。毎月「この数値が正しいとなぜ言えるのか」に対して、
ロジックを改めて検証し直すことなく答えるためのページです。

Page 5 is not decoration. It is the page that answers \"how do we know
this is correct\" every month, without anyone having to re-derive the
logic.

## 10. 本仕様の対象外

## 10. Scope not covered by this specification

**部門別損益計算書。**
現在の出力は法人単位のみであるため、モデルが作成するのは
グループ連結損益計算書であり、BG1〜BG4の部門別表示ではありません。方法は2つあります。

**Divisional P&L.** The current export is at legal-entity level only, so
the model produces a group consolidated P&L and not the BG1 to BG4
divisional view. Two routes exist:

1.  H&R神戸を含む全拠点を対象とした、各社の部門内訳表の出力。これが完全な解決策です。
    第6節の項目8。 A 部門内訳表 departmental export per entity, covering
    all locations including H&R Kobe. This is the complete solution.
    Item 8 in Section 6.
2.  `referral fee.xlsx` にあるリロジャパン勘定科目6530の部門別内訳。
    部門別の消去を近似できますが、通期のみで月次の内訳がないため、月次レポートの基礎にはできません。
    The RELO account 6530 split by division in `referral fee.xlsx`,
    which would allow a divisional elimination to be approximated. It is
    full-year only, with no monthly detail, so it cannot drive a monthly
    report.

**前年同期比。** FY2024のファイルが必要です。第6節の項目9。

**Prior-year comparatives.** Require the FY2024 files. Item 9 in Section
6.

**部門別の売上総利益より下の区分。**
元データでは販管費が部門に配賦されていません。
部門別の営業利益が必要な場合は、配賦基準を合意する必要があります。

**Below gross profit by division.** SG&A is not currently allocated to
divisions in the source data. If divisional operating profit is wanted,
an allocation basis has to be agreed.

**売上総利益より下の内部取引。**
本モデルの消去は売上総利益までを対象としており、
それより下は消去していません。連結営業利益を信頼できるものとするには、
以下の内部取引を処理する必要があります。`IJ data coversion.xlsx`
によれば、 イミグレーションジャパンは販管費に次の項目を計上しています。

**Inter-company items below the gross profit line.** The model
eliminates to gross profit. It does not eliminate below that line, and
there is inter-company traffic there that would need handling before
consolidated operating profit could be relied on.
`IJ data coversion.xlsx` shows Immigration Japan carrying, in SG&A:

  -------------------------------------------------------------------------
  IJ勘定科目 IJ account            金額 Amount  相手先 Counterparty
  -------------------------------- ------------ ---------------------------
  `7540 ``業務委託費` ---          ¥5,760,000   リロジャパン（EL5の相手方
  外注費（リロ業務委託費）                      --- 第5.4節）\
                                                RELO (the EL5 counterpart
                                                --- Section 5.4)

  `7140 ``業務委託費（人件費）`    ¥3,468,381   リロジャパン 出向負担金\
  --- 支払手数料（リロ出向負担金）              RELO secondment charge

  `7140 ``業務委託費（人件費）`    ¥3,682,704   H&R 出向負担金\
  --- 支払手数料（H&R出向負担金）               H&R secondment charge
  -------------------------------------------------------------------------

合計¥12,911,085です。いずれも売上高・売上原価・売上総利益には影響しないため、
第4節および第5節の内容には一切影響しません。営業利益まで拡張する場合には、
リロジャパンおよびH&R側の対応する収益と消去する必要があります。
特に出向負担金¥7,151,085については、リロジャパンとH&Rが当該収益を計上している
勘定科目を特定する必要があり、これは未確認です。

Together ¥12,911,085. None of it affects revenue, cost of sales or gross
profit, so none of it affects anything in Sections 4 and 5. All of it
would need eliminating against the corresponding income in RELO and H&R
if the model is extended to operating profit. The ¥7,151,085 of
secondment charges in particular should be matched against the accounts
RELO and H&R book that income to, which has not yet been identified.

**キャッシュフロー。** `2025``年度``_``連結``CF_Mar unit M YE.xlsx`
は存在しますが、 連結キャッシュフローは本モデルの対象外です。

**Cash flow.** `2025``年度``_``連結``CF_Mar unit M YE.xlsx` exists but
consolidated cash flow is outside the scope of this model.

## 付録 --- 添付ファイル

## Appendix --- accompanying files

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ファイル File                     内容 What it is
  --------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  `RNA_Elimination_Proof_JP.xlsx`   計算をExcelの数式として表示したブック（日英併記）。3つの元ファイルをそのまま収録し、7項目の消去、連結結果、4つの検証をすべて含みます。ロジックをご確認いただく主たる手段です。第5.2節参照。\
                                    The calculation in Excel as live formulas, bilingual. The three source exports verbatim, the seven eliminations, the consolidated result, and all four controls. The primary means of checking
                                    the logic. See Section 5.2.

  `rna_consolidation.py`            同じ計算を読みやすいスクリプトとして記述したもの。ロジックをコードでご確認されたい場合にご利用ください。読み取り専用です。Pythonとopenpyxlライブラリが必要です：`pip install openpyxl` のうえ
                                    `python rna_consolidation.py "C:\path\to\folder"`。\
                                    The same calculation as a readable script, for anyone who prefers to check the logic as code. Reads only. Requires Python and the openpyxl library.
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

*本書は日英併記です。記載内容について疑義が生じた場合は、数値そのものが優先します。
数値はすべて添付のExcelブックで確認でき、同ブックは元ファイルから直接算出しています。*

*This document is bilingual. Where the two texts could be read
differently, the figures themselves govern: all of them can be checked
in the accompanying Excel workbook, which computes them directly from
the source files.*
