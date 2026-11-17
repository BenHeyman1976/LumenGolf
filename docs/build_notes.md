# Build notes — paste-order for the PBIX

Run these steps in order on your PC. All files referenced live in this repo on branch `claude/trusting-brahmagupta-Zo0Ug`.

## Step 0 — validate the data in Python first

Before opening Power BI, run the Python script. If it fails, Power BI will too — and the error message is clearer in Python.

```bash
pip install openpyxl
cd scripts
python validate.py "C:\path\to\the\folder\containing\the\three\xlsx\files"
```

Expected final line: `ALL CHECKS PASS -- Power Query / DAX build is safe to proceed.`

If any check fails, stop and share the output here. Do not proceed to PBIX.

## Step 1 — open Power BI Desktop, create a new PBIX

Blank report. Save as `RNA_Consolidated_PL.pbix` somewhere outside this repo (binary; do not commit).

## Step 2 — parameters

**Home → Transform data → Home → Manage parameters → New parameter** (type **Text**) for each. Values per `powerquery/01_parameters.md`:

| Name | Value |
|---|---|
| `p_Folder` | `C:\your\folder\path\` **(with trailing backslash)** |
| `p_FileHR` | `H&R_FY2025予実表.xlsx` |
| `p_FileRELO` | `RELO_FY2025予実表.xlsx` |
| `p_FileRNAG` | `RNAG_FY2025予実表.xlsx` |

## Step 3 — paste the Power Query queries in this order

For each `.pq` file in `powerquery/`:
1. **Home → New source → Blank query**.
2. **View → Advanced Editor**.
3. Paste the entire contents of the `.pq` file (including comments).
4. Click **Done**.
5. **Rename the query** in the Queries pane on the left to match the filename (the part after the number prefix): e.g. `02_ref_Section.pq` → rename to `ref_Section`.

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

## Step 4 — set "Enable load = off" on intermediate queries

Right-click each of these in the Queries pane and uncheck **Enable load**:
- `ref_Section`
- `ref_Elimination`
- `fact_IJ`
- `fact_Source`
- `fact_Elimination`

Only `fact_PL`, `dim_Date`, `dim_Entity`, `dim_Scenario`, `chk_ImportIntegrity`, and `chk_Diggle` should be loaded to the model.

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

In `dim_Entity`: `Entity` sorted by `SortOrder`.
In `dim_Scenario`: `Scenario` sorted by `SortOrder`.

## Step 7 — measure table

**Home → Enter data** → one row, one column → **Load** as `_Measures`. Then right-click the column → hide. This is just a home for measures so they don't clutter real tables.

## Step 8 — paste the DAX measures

With `_Measures` selected:
- **Modeling → New measure**.
- Paste one measure at a time from the `.dax` files.

Order doesn't strictly matter (measures reference each other at evaluation time), but recommended paste order:
1. `dax/01_measures_core_pl.dax` — the eight core measures.
2. `dax/02_measures_below_gp.dax` — below-GP measures.
3. `dax/03_measures_actual_budget_variance.dax`.
4. `dax/04_measures_elimination_detail.dax`.
5. `dax/05_measures_controls.dax`.

Each file has `//` comments and measure bodies separated by blank lines — paste each measure independently (Power BI's New Measure dialog takes one at a time).

## Step 9 — build the five report pages per `report/pages.md`

The validation page (page 5) is the one to build first and keep visible. If `[Check Import Status]` reads `PASS`, everything else is trustworthy.

## Step 10 — acceptance

On a fresh Group P&L page with no slicers applied and `Scenario = Actual`:

| Measure | Expected (FY2025) |
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

If any of these are off, paste the number you got here and we'll diagnose.

## Troubleshooting

- **"Could not find 科目名 in column B"** — file isn't a Bugyo 予実表, or the layout changed. Open the file and check column B of the first 15 rows for the literal text `科目名`.
- **"No (発生) columns found"** — the file uses a different column header format. Check column C header of the file.
- **"Account rows fall outside every P&L section"** — a new account code has appeared that isn't under a P-code we recognise. The error names the codes; add them to the file or add a new row to `ref_Section` (requires confirming with finance which section it belongs to).
- **`fact_PL` loads but totals are off by roughly 2×** — somebody loaded `(残高)` columns as well as `(発生)`. The `MonthCols` filter in `fn_LoadEntity` should prevent this; check it wasn't modified.
- **`chk_ImportIntegrity` shows non-zero variance** — do not trust any number. Either the import logic broke or the file has a new section. Share the variance table.
