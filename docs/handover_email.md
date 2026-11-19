# Handover email (draft)

**To:** [RNA Group finance team reviewer]
**Cc:** [CP]
**Subject:** RNA Group Consolidated P&L — Power BI model ready for review (FY2025)

---

[お名前]-san,

Following the specification you signed off (v3.0, 13 October 2026), the Power BI model replacing Diggle for the RNA Group consolidated P&L is now built and ready for your review.

Everything is in the SharePoint folder below:

> **IT Team / Consolidated documents / Power BI model**

Four files:

- `RNA_Consolidated_PL.pbix` — the Power BI report
- `H&R_FY2025予実表.xlsx`, `RELO_FY2025予実表.xlsx`, `RNAG_FY2025予実表.xlsx` — the three source files, versions matching the spec's §2.1 SHA-256 hashes

## What has been built

A five-page Power BI report reproducing the consolidation logic in spec §3 to §5, from the Bugyo `予算実績対比表` exports. Every number in spec §4 (full-year and all 12 months, both Actual and Budget) reconciles **to the yen**, and every control in spec §5.1 passes.

| Page | Content |
|---|---|
| 1. Group P&L | Monthly revenue, COGS, gross profit, gross margin — Actual vs Budget, with variance. Slicers for fiscal year, entity, scenario. |
| 2. Elimination schedule | EL1–EL7 by month with account names and descriptions. The audit trail: what was eliminated and why. |
| 3. Entity contribution | Each entity's gross, eliminations and net contribution to group gross profit. |
| 4. Budget variance | Revenue, COGS, GP variance by month and entity, with colour scale. |
| 5. Validation | Live controls proving each refresh is correct — the page to look at first every month. |

A separate bilingual walkthrough (`page_guide_JP.md`) covers each page in Japanese with English alongside.

## To open the report

1. Download `RNA_Consolidated_PL.pbix` from SharePoint to your PC.
2. Make sure the three 予実表 files are also available in a folder your PC can see — easiest is to Sync the `Power BI model` folder via OneDrive so it appears in File Explorer.
3. Open the PBIX in Power BI Desktop.
4. **Home → Transform data → Manage parameters → `p_Folder`** — set the value to the full local path of that folder (with a trailing `\`).
   - Example: `C:\Users\<yourname>\OneDrive - morethanrelo\IT Team - Documents\Consolidated documents\Power BI model\`
5. **Close & Apply → Refresh.**
6. Open Page 5 (Validation) first — all control cards should show `PASS` / 0 / the expected non-zero values noted on the page.

## Acceptance numbers for FY2025 Actual

To confirm the model reproduces the consolidation correctly:

| Measure | Expected |
|---|---|
| Consolidated Revenue | ¥1,476,550,791 |
| Consolidated COGS | ¥578,712,037 |
| Gross Profit | ¥897,838,754 |
| Gross Margin | 60.8% |
| Check Import Status | PASS |
| Check 5230 Residual (Actual) | ¥62,500 |
| EL5 Unmatched | ¥5,760,000 |
| Check vs Diggle | 0 |

All 12 monthly figures in spec §4.3 also reproduce exactly.

## Open items still to settle (none block this review)

Noted in full in the repo under `docs/open_items.md`; the ones that matter for v2:

- **5230 sub-account monthly export** — EL1 is currently derived (RELO 6530 − H&R 5255 − H&R 5135), per spec §3.3 and §6.1. When the monthly sub-account export (補助科目内訳) arrives, EL1 becomes a direct read and the derivation becomes a cross-check.
- **Budget elimination residual ¥6,602,954** on account 5230 — CP noted this is a Diggle budget-basis artefact (spec §6.2). Surfaced in the model via `Check 5230 Residual (Budget)` — visible rather than hidden.
- **IJ shared-services EL5 (¥5,760,000)** — unmatched at the cost-of-sales level because IJ books the cost in SG&A `7540 業務委託費`. Spec §5.4; `[EL5 Unmatched]` measure makes this transparent. Does not affect figures through gross profit.

## Hosting

For v1 the PBIX reads from a local path via `p_Folder`. Longer term the intention is to host it either as a direct SharePoint-connector pull (code already written, parked in the repo pending a cross-tenant account), or as a Power BI Service workspace with scheduled refresh. We can plan that once the numbers are signed off and the client's IT confirms the account/tenancy setup.

## Next step

Could you confirm the Page 5 controls all pass on your machine, and that the figures on Page 1 reconcile to your consolidated report? Once confirmed we can move to the hosting discussion and label translation.

Happy to walk you through live over Teams if easier.

Kind regards,
Ben
