# レポートの使い方 — ページ別ガイド
# Report user guide — page by page

本書は日英併記です（日本語を主、英語を従）。
This document is bilingual; Japanese is primary, English follows.

モデルおよびロジックの詳細仕様は `docs/spec_v3.md` を参照してください。本書はその出力を日常的に使うための補足です。
For the full logic and design specification, see `docs/spec_v3.md`. This document is a companion for day-to-day use of the output.

---

## 共通事項 / Shared across all pages

### スライサー / Slicers

- **会計年度 / FYLabel** — 表示する会計年度（4月〜3月）。通常は FY2025 を選択。
- **会社 / Entity** — 会社でフィルター。選択を外す（または「すべて選択」）とグループ連結。
- **予算実績区分 / Scenario** — 実績（Actual）または予算（Budget）の切替。

- **Fiscal Year (FYLabel)** — the fiscal year on display (April–March). Normally set to FY2025.
- **Entity** — filter to one or more entities. Clear (or "Select all") for the full group consolidation.
- **Scenario** — switch between Actual and Budget.

### 金額の正負について / On signs

- 売上高、営業外収益、特別利益はプラスで表示されます。
- 売上原価、販管費、営業外費用、特別損失、法人税等はプラスで保持し、集計時に符号を適用します。
- 消去行は常にマイナスで表示され、合算値（Gross）から控除されて連結値になります。

- Revenue, Non-operating income and Extraordinary income are positive.
- COGS, SG&A, Non-operating expense, Extraordinary loss and Tax are stored positive; signs are applied when rolling up to profit.
- Elimination rows always carry a negative amount — they subtract from gross to produce the consolidated figure.

---

## ページ1 — グループ損益計算書
## Page 1 — Group P&L

### 目的 / Purpose

グループ連結の月次損益計算書。実績・予算・差異を並べて表示します。
The monthly consolidated P&L for the group, with Actual, Budget and Variance side by side.

### 何を見ているか / What you are looking at

行には月次の指標、列には12か月（4月〜3月）と通期合計。
Rows: the measures by month, with a Total column for the full year across the rightmost columns.

- `Revenue Act` / `Revenue Bud` / `Revenue Var` — 連結売上高の実績・予算・差異
- `COGS Act` / `COGS Bud` / `COGS Var` — 連結売上原価の実績・予算・差異
- `GP Act` / `GP Bud` / `GP Var` — 連結売上総利益の実績・予算・差異
- `GM% Act` / `GM% Bud` / `GM% Var pts` — 売上総利益率

いずれも**消去後**の数値です。消去の内訳はページ2で確認できます。
All values are **post-elimination**. For the breakdown of what was eliminated, see Page 2.

### 使い方 / How to use

- 「予算差異が大きい月はどこか」「どの会社が差異を生んでいるか」を確認するページ。
- 会社スライサーで1社に絞ると、その会社単体の数値が見えます。全選択に戻すとグループ連結。
- The page to answer *where in the year is budget variance biggest* and *which entity is driving it*.
- Filtering the Entity slicer to one entity shows that entity standalone; selecting all returns to the group consolidation.

### 典型的な確認値（FY2025実績） / Typical sanity numbers (FY2025 Actual)

| 項目 Item | 金額 Amount |
|---|---|
| Revenue Act (通期) | ¥1,476,550,791 |
| COGS Act (通期) | ¥578,712,037 |
| GP Act (通期) | ¥897,838,754 |
| GM% Act (通期) | 60.8% |

---

## ページ2 — 消去明細
## Page 2 — Elimination schedule

### 目的 / Purpose

ID別の消去金額を月次で表示し、何を・いくら消去したかを明示します。監査証跡のページです。
Shows each elimination line (EL1–EL7) by month, with the account name and description. This is the audit-trail page.

### 何を見ているか / What you are looking at

- 行：消去ID（EL1〜EL7）＋勘定科目名
- 列：各月＋通期合計
- 値：消去額（正の数で表示）

- Rows: elimination ID (EL1–EL7) + account name
- Columns: each month + full-year total
- Values: the elimination amount (shown positive for readability)

### 7つの消去ロジック / The seven elimination lines

| ID | 会社 Entity | 勘定 Account | 内容 What |
|---|---|---|---|
| EL1 | H&R | 5230 | リロジャパンへのリロケーション紹介売上（RMC補助科目分、派生計算）／ Relocation referral billed to RELO (RMC sub-account, derived) |
| EL2 | H&R | 5255 | 運転免許書換サポート売上 ／ Driving licence conversion support |
| EL3 | H&R | 5135 | イミグレーション売上 ／ Immigration referral |
| EL4 | RELO | 5360 | H&R東京への紹介料 ／ Referral fee to H&R Tokyo |
| EL5 | RELO | 5145 | IJシェアードサービス売上 ／ Shared services to IJ |
| EL6 | RELO | 6530 | H&R紹介原価 ／ Cost side of EL1+EL2+EL3 |
| EL7 | H&R | 6360 | RELO紹介原価 ／ Cost side of EL4 |

### 使い方 / How to use

- 「このIDの通期消去額は正しいか」を経理部提出資料と照合するページ。
- EL1は補助科目内訳が月次に含まれないため**派生計算**です（仕様書 §3.3）。将来、月次の補助科目データが入手できれば直接読み取りに切り替えます。
- The page for tying each ElimID's full-year amount back to the finance team's working papers.
- EL1 is **derived** (`RELO 6530 − H&R 5255 − H&R 5135`) because the 5230 sub-account split is not in the monthly export (spec §3.3). When the monthly 補助科目 export arrives, EL1 switches to a direct read.

### 典型的な確認値（FY2025実績） / Typical sanity numbers (FY2025 Actual)

| ID | 通期 Full-year |
|---|---|
| EL1 | ¥198,575,679 |
| EL2 | ¥23,130,446 |
| EL3 | ¥1,327,027 |
| EL4 | ¥29,824,235 |
| EL5 | ¥5,760,000 |
| EL6 | ¥223,033,152 |
| EL7 | ¥29,824,235 |
| 合計 Total | ¥511,474,774 |

---

## ページ3 — 会社別寄与
## Page 3 — Entity contribution

### 目的 / Purpose

各社の合算、各社の消去、各社の連結寄与を一覧表示します。「どの会社がグループ利益に何円寄与しているか」の答え。
Shows per-entity gross, per-entity eliminations, and per-entity contribution to group gross profit. Answers *who contributes what*.

### 何を見ているか / What you are looking at

- 行：会社（H&R、RELO、RNA Group、イミグレーションジャパン）＋合計
- 列：Gross Revenue、Revenue Eliminations、Revenue、Gross COGS、COGS Eliminations、COGS、Gross Profit

消去は当該仕訳を**計上した会社**側に表示されます。相手方には表示されません。
Eliminations appear with the entity that **booked** the IC revenue/cost, not the counterparty.

### 読み方 / How to read it

- **H&R の Revenue Eliminations** = EL1 + EL2 + EL3（H&Rが計上した内部取引売上）
- **RELO の Revenue Eliminations** = EL4 + EL5
- **H&R の COGS Eliminations** = EL7
- **RELO の COGS Eliminations** = EL6
- **RNA Group** は持株会社で売上・原価なし。販管費のみ（本ページには表示なし）。
- **イミグレーションジャパン** は実績のみ、予算なし。

- **H&R's Revenue Eliminations** = EL1 + EL2 + EL3 (the three IC revenues H&R books).
- **RELO's Revenue Eliminations** = EL4 + EL5.
- **H&R's COGS Eliminations** = EL7.
- **RELO's COGS Eliminations** = EL6.
- **RNA Group** is the holding company — no revenue, no COGS, only SG&A (not shown on this page).
- **Immigration Japan** has actuals only; no budget was provided (spec §2.3).

### 合計行の照合 / Reconciling the totals

合計行の Revenue / COGS / Gross Profit は、ページ1の通期合計と完全一致します。不一致がある場合は、計算中に何らかのフィルターが残っている可能性があります。
The Totals row for Revenue / COGS / Gross Profit should match Page 1's full-year totals exactly. Any mismatch means a filter is still applied somewhere.

---

## ページ4 — 予算差異
## Page 4 — Budget variance

### 目的 / Purpose

会社×月で予算差異を一覧表示し、どこで予算から乖離しているかを即座に把握します。
Variance by entity × month, so the reader can see at a glance where actuals diverge from plan.

### 何を見ているか / What you are looking at

- 行：会社、列：月
- 値：`Revenue Var`、`COGS Var`、`GP Var`、`GP Var %`
- 背景色：グラデーション（赤＝悪化、緑＝改善）

- Rows: entity, Columns: month.
- Values: `Revenue Var`, `COGS Var`, `GP Var`, `GP Var %`.
- Background colour: gradient (red = unfavourable, green = favourable).

### 使い方 / How to use

- セルの赤濃淡で「月次の予算未達」を即座に把握。
- 全選択、月次横断、通期合計で「どの月の、どの会社の、何が」原因だったかを辿れます。
- Scan the red intensity to spot monthly under-performance against plan.
- With all entities selected and the months across, you can trace *which month, which entity, which line* drove the full-year variance.

### 既知の留意点 / Known caveats

- **イミグレーションジャパン** は予算が提供されていないため、差異は全て実績＝差異となります（予算ゼロとの差）。これは誤りではなく、データ範囲の制約です。
- **予算の売上高・売上原価には ¥6,602,954 の消去差額** が科目5230に残ります（仕様書 §6.2）。これはDiggleで予算を部門別ベースで作成しており、連結時の社内取引消去を前提としない設計差であることが Corporate Planning より確認されています。

- **Immigration Japan** has no budget supplied, so its variance equals its actuals (actual − 0). Not an error; a data-scope limitation.
- **Budget 5230 carries a ¥6,602,954 elimination residual** (spec §6.2). CP has confirmed this is a Diggle-side budgeting-basis artefact (budgets are built by division/location gross, no IC-elimination assumption), not a model defect.

---

## ページ5 — 検証
## Page 5 — Validation

### 目的 / Purpose

毎月の更新後、「この数値を信頼してよいか」を確認するためのページ。
The page to answer *is this month's refresh correct?* — every time, before relying on any other page.

### 何を見ているか / What you are looking at

**6つの検証カード：**

| カード Card | 期待値 Expected | 意味 Meaning |
|---|---|---|
| `Check Import Status` | **PASS** | 取り込みに欠落・重複なし |
| `Check Import Variance` | 0 | 同上。1円でも差があれば調査 |
| `Check 5230 Residual` | ¥62,500 (実績) | 勘定5230の消去後残高＝外部売上 |
| `Check Elimination Symmetry` | 0 | EL1〜EL4 と EL6, EL7 が均衡 |
| `EL5 Unmatched` | ¥5,760,000 | IJへのシェアードサービス。意図的に相手側未消去 |
| `Check vs Diggle` | 0 | Diggle出力との並行運用照合 |

**取込整合性テーブル：** 27行（3社 × 9区分）、全て Variance = 0 でなければなりません。
**Import integrity table:** 27 rows (3 entities × 9 sections), every Variance must be 0.

**Diggle並行運用テーブル：** 本モデルの Revenue Act / COGS Act が Diggle の数値と完全一致。
**Parallel run vs Diggle table:** the model's Revenue Act / COGS Act must equal the Diggle figures exactly.

### 期待されるゼロ以外の値（異常ではありません） / Expected non-zero values (not failures)

- **`Check 5230 Residual` (実績) = ¥62,500**：勘定5230にはH&Rの外部売上 ¥62,500 が含まれており、消去後にそのまま残るべき金額（仕様書 §3.3）。
- **`Check 5230 Residual` (予算) = ¥6,602,954**：予算の設計差（上記ページ4参照、仕様書 §6.2）。
- **`EL5 Unmatched` = ¥5,760,000**：RELOからIJへのシェアードサービス料。IJ側の相手科目が販管費のため、本モデル（売上総利益まで）では未消去。隠さず明示表示（仕様書 §5.4）。

- **`Check 5230 Residual` (Actual) = ¥62,500** — H&R 5230 contains ¥62,500 of external revenue that correctly survives elimination (spec §3.3).
- **`Check 5230 Residual` (Budget) = ¥6,602,954** — the budget-basis difference (see Page 4, spec §6.2).
- **`EL5 Unmatched` = ¥5,760,000** — RELO→IJ shared services; IJ books the offsetting cost in SG&A `7540 業務委託費`, which this model (down to gross profit only) does not reach. Surfaced rather than absorbed (spec §5.4).

### 月次チェックリスト / Monthly check-off

更新のたびに、以下を確認してから他のページを使用してください：
Every time the model is refreshed, confirm the below before using any other page:

1. ✅ `Check Import Status` = **PASS**
2. ✅ `Check Import Variance` = 0
3. ✅ `Check Elimination Symmetry` = 0
4. ✅ `Check vs Diggle` = 0（Diggle稼働中のみ／while Diggle is still running）
5. ✅ 取込整合性テーブルの全27行で Variance = 0
6. ⚠️ `Check 5230 Residual` および `EL5 Unmatched` は上記の期待値であること

いずれかの✅が成立しない場合、他ページの数値を使用する前に原因を調査してください。
If any of the ✅ items fail, investigate before using numbers from any other page.

---

## 更新頻度と手順 / Refresh cadence and procedure

### 月次更新 / Monthly refresh

1. 当月分の3つの予実表ファイル（H&R / RELO / RNAG）を、`p_Folder` が指すフォルダに上書き配置。
2. イミグレーションジャパンの数値をハンドキーで更新（`fact_IJ` クエリの該当行、仕様書 §2.3）。
3. Power BI Desktop で **Home → Refresh**。
4. **ページ5（検証）** を開き、上記チェックリストを確認。
5. 問題なければ保存し、SharePointの `Power BI model` フォルダに上書き。

1. Overwrite the three monthly 予実表 files (H&R / RELO / RNAG) in the folder `p_Folder` points at.
2. Hand-key the Immigration Japan figures for the month (edit `fact_IJ` query, spec §2.3).
3. In Power BI Desktop: **Home → Refresh**.
4. Open **Page 5 (Validation)** and run the checklist above.
5. If clean, save and overwrite the PBIX in the SharePoint `Power BI model` folder.

### 年次追加 / Year-end additions

FY2026以降の読み込みは、同じフォルダに該当年度のファイルを置き、`fact_Source` にファイル追加するだけです（コード変更は最小限）。
Loading FY2026 and beyond is a matter of adding files to the same folder and adding one line per entity to `fact_Source`; code changes are minimal.

---

## ラベルの日本語化について / On label translation

本モデルの構造・ロジックは英語で開発しましたが、画面ラベル（視覚タイトル、列見出し、区分名）はシンプルに置換可能です。経理部が実際に使用したい日本語名をご指示いただければ、該当する箇所を書き換えます。

The model structure and logic were developed in English; the on-screen labels (visual titles, column headers, section names) are simple to swap. Let us know the exact Japanese labels your team prefers, and we will apply them where needed.

---

## 連絡先 / Contact

Ben Heyman — ben.heyman@hotmail.co.uk
