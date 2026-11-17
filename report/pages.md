# Report pages (spec §9)

Five pages. Page 5 is not decoration — it is the page that answers "how do we know this is correct" every month without anyone having to re-derive the logic.

## 1. Group P&L
Revenue, cost of sales, gross profit and gross margin by month, actual against budget with variance.
**Slicers:** fiscal year (`dim_Date[FYLabel]`), entity (`dim_Entity[Entity]`), scenario (`dim_Scenario[Scenario]`).
**Measures:** `[Revenue Act]`, `[Revenue Bud]`, `[Revenue Var]`, `[COGS Act]`, `[COGS Bud]`, `[COGS Var]`, `[GP Act]`, `[GP Bud]`, `[GP Var]`, `[GM% Act]`, `[GM% Bud]`, `[GM% Var pts]`.
**Rows / columns:** `dim_Date[FYMonthLabel]` on columns, measures on rows (or matrix as finance prefers).

## 2. Elimination schedule
`ElimID` by month. Join to `ref_Elimination` for `AccountName` and `Description`. Gross → eliminations → net waterfall.
**Visuals:** matrix with `fact_PL[ElimID]` and `fact_PL[AccountName]` on rows, `dim_Date[FYMonthLabel]` on columns, `[Elimination by Line]` as value. Waterfall chart using `[Gross Revenue]` → `[Revenue Eliminations]` → `[Revenue]` (and the COGS equivalent).

## 3. Entity contribution
Each entity's gross revenue and cost of sales, the eliminations its own books carry, and its net contribution to group gross profit.
**Visuals:** matrix with `dim_Entity[Entity]` on rows, measures `[Gross Revenue]`, `[Revenue Eliminations]`, `[Gross COGS]`, `[COGS Eliminations]`, `[Gross Profit]` on columns.

## 4. Budget variance
Revenue, COGS, GP variance by month and by entity; gross margin variance in percentage points.
**Visuals:** matrix with `dim_Entity[Entity]` and `dim_Date[FYMonthLabel]`, values `[Revenue Var]`, `[COGS Var]`, `[GP Var]`, `[GM% Var pts]`. Conditional formatting: red when adverse, green when favourable.

## 5. Validation
- `chk_ImportIntegrity` as a plain table (Entity, Section, Stated, Imported, Variance).
- Cards: `[Check Import Variance]`, `[Check Import Status]`, `[Check 5230 Residual]`, `[Check Elimination Symmetry]`, `[EL5 Unmatched]`, `[Check vs Diggle]`.
- Note on the page: "All variances must be zero except [Check 5230 Residual] (¥62,500 actual expected) and [EL5 Unmatched] (¥5,760,000 actual expected — see spec §5.4)."
