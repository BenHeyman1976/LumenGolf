# Build notes — paste-order for the PBIX

Everything needed to build the Power BI report from the spec (`docs/spec_v3.md`). Follow in order; each step takes a couple of minutes.

## Step 1 — open Power BI Desktop, create a new PBIX

Blank report. Save as `RNA_Consolidated_PL.pbix`.

## Step 2 — parameters

**Home → Transform data** opens the Power Query Editor. In the editor: **Home → Manage parameters → New parameter**, type **Text**, for each of the five below.

| Name | Example value |
|---|---|
| `p_SharePointSite` | `https://morethanrelo.sharepoint.com/sites/ITTeam` — the site URL, no trailing slash |
| `p_FolderPath` | `PowerBI Project 2026/Power BI model` — path within Shared Documents, forward slashes, no leading/trailing slash |
| `p_FileHR` | `H&R_FY2025予実表.xlsx` |
| `p_FileRELO` | `RELO_FY2025予実表.xlsx` |
| `p_FileRNAG` | `RNAG_FY2025予実表.xlsx` |

Files are read directly from SharePoint — nothing lands on anyone's PC. On first refresh, Power BI prompts for credentials against the SharePoint URL: pick **Organizational account** and sign in with the Microsoft work account that has access to the site. Power BI caches this so subsequent refreshes don't prompt.

## Step 3 — paste the Power Query queries in order

For each `.pq` file in `powerquery/`:
1. **Home → New source → Blank query**.
2. **View → Advanced Editor**.
3. Paste the entire contents of the `.pq` file (including comments).
4. Click **Done**.
5. **Rename the query** in the Queries pane on the left to the name after the number prefix: e.g. `02_ref_Section.pq` → rename to `ref_Section`.

Paste order (dependencies require this exact sequence):

| # | File | Query name |
|---|---|---|
| 1 | `02_ref_Section.pq` | `ref_Section` |
| 2 | `03_ref_Elimination.pq` | `ref_Elimination` |
| 3 | `04_fn_LoadEntity.pq` | `fn_LoadEntity` |
| 4 | `05_fact_IJ.pq` | `fact_IJ` |
| 5 | `06_fact_Source.pq` | `fact_Source` |
| 6 | `07_fact_Elimination.pq` | `fact_Elimination` |
| 7 | `08_fact_PL.pq` | `fact_PL` |
| 8 | `09_dim_Date.pq` | `dim_Date` |
| 9 | `10_dim_Entity.pq` | `dim_Entity` |
| 10 | `11_dim_Scenario.pq` | `dim_Scenario` |
| 11 | `12_chk_ImportIntegrity.pq` | `chk_ImportIntegrity` |
| 12 | `13_chk_Diggle.pq` | `chk_Diggle` |

## Step 4 — "Enable load = off" on intermediate queries

Right-click each of these in the Queries pane and uncheck **Enable load**:
- `ref_Section`
- `ref_Elimination`
- `fact_IJ`
- `fact_Source`
- `fact_Elimination`

Only `fact_PL`, `dim_Date`, `dim_Entity`, `dim_Scenario`, `chk_ImportIntegrity`, and `chk_Diggle` should load to the model.

Then **Home → Close & Apply**.

## Step 5 — relationships

**Model view**:
- `dim_Date` → right-click → **Mark as date table** → pick `Date`.
- Create relationships, all **one-to-many, single direction**:
  - `dim_Date[Date]` ↔ `fact_PL[Date]`
  - `dim_Entity[EntityCode]` ↔ `fact_PL[EntityCode]`
  - `dim_Scenario[Scenario]` ↔ `fact_PL[Scenario]`

## Step 6 — sort columns

In `dim_Date`:
- Click `MonthName` → **Column tools → Sort by column → FiscalMonthNo**.
- Click `FYMonthLabel` → **Column tools → Sort by column → FiscalMonthNo**.

In `dim_Entity`: `Entity` → sort by `SortOrder`.
In `dim_Scenario`: `Scenario` → sort by `SortOrder`.

## Step 7 — measure table

**Home → Enter data** → one row, one column → **Load** as `_Measures`. Right-click the column → hide. This is a container for measures so they don't clutter the real tables.

## Step 8 — paste the DAX measures

Select `_Measures`, then for each measure in the `.dax` files:
- **Modeling → New measure**.
- Paste one measure body at a time (each file holds several measures separated by blank lines).

Paste order:
1. `dax/01_measures_core_pl.dax` — the eight core P&L measures.
2. `dax/02_measures_below_gp.dax` — below-gross-profit measures.
3. `dax/03_measures_actual_budget_variance.dax` — scenario and variance measures.
4. `dax/04_measures_elimination_detail.dax` — elimination schedule measures.
5. `dax/05_measures_controls.dax` — the four controls.

## Step 9 — build the five report pages per `report/pages.md`

The validation page (page 5) is the one to build first and keep visible — it answers "how do we know this is correct" every month.

## Step 10 — acceptance

On a fresh Group P&L page with no slicers applied and `Scenario = Actual`, FY2025:

| Measure | Expected |
|---|---|
| `[Revenue]` | ¥1,476,550,791 |
| `[COGS]` | ¥578,712,037 |
| `[Gross Profit]` | ¥897,838,754 |
| `[Gross Margin %]` | 60.8% |
| `[Check Import Variance]` | 0 |
| `[Check Import Status]` | `PASS` |
| `[Check 5230 Residual]` | ¥62,500 |
| `[Check Elimination Symmetry]` | 0 |
| `[EL5 Unmatched]` | ¥5,760,000 |
| `[Check vs Diggle]` | 0 for both Revenue and COGS |

All 12 monthly figures in spec §4.3 must reproduce exactly.

## Troubleshooting

- **"Could not find 科目名 in column B"** — file isn't a Bugyo 予実表, or the layout changed. Open the file and check column B of the first 15 rows for the literal text `科目名`.
- **"No (発生) columns found"** — the file uses a different column header format. Check column C header.
- **"Account rows fall outside every P&L section"** — a new account code has appeared that isn't under a P-code we recognise. The error names the codes; either the file is missing a P-code subtotal or `ref_Section` needs a new row (confirm with finance which section the new account belongs to).
- **`fact_PL` loads but totals are roughly 2×** — somebody loaded `(残高)` columns as well as `(発生)`. The `MonthCols` filter in `fn_LoadEntity` should prevent this; check it wasn't modified.
- **`chk_ImportIntegrity` shows non-zero variance** — do not trust any number. Either the import logic broke or the file has a new section. Investigate the variance table (page 5).
