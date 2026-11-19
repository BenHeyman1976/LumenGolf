# Open items (spec §6 — client responses tracked)

Items the finance team / Corporate Planning need to resolve, and how each affects the build. Nothing here blocks the prototype; items 1, 2 and 4 must be settled before the model is treated as the system of record.

| # | Topic | Finance response | Impact on build | Action owner |
|---|---|---|---|---|
| 6.1 | 5230 sub-account monthly export | ✅ Possible via Bugyo option. Monthly cadence assumed. Operational flow (who, when, to whom) still to agree. | **Non-blocking.** EL1 stays derived (`RELO 6530 − H&R 5255 − H&R 5135`) until the sub-account export arrives. At that point EL1 becomes a direct read and the derivation becomes a cross-check. Keep both paths in code. | Client ops + us |
| 6.2 | ¥6,602,954 budget 5230 residual | ❌ Not reconcilable by CP. Diggle budget is built from division/location gross sales, no IC-elim assumption. The difference is real but by design. | **Document only.** Surface via `[Check 5230 Residual]` on both scenarios; label the Budget value "expected ¥6.6m per spec §6.2 — different budget basis". Add note to the Validation page. | Us (documentation) |
| 6.3 | IJ standard Bugyo export | ❌ IJ doesn't use Bugyo. CP maintains IJ budget in Diggle as BG(IM); actuals from IJ栗原-san's Excel. | **Non-blocking.** Keep `fact_IJ` hand-keyed per spec §7.5. Document the manual step in the operational runbook. | Client finance |
| 6.4 | IJ ¥5,760,000 account coding | ✅ Confirmed: `7540 業務委託費` (SG&A, below GP). | **Resolved.** Model correct to GP. `[EL5 Unmatched]` measure retains transparency. When model extends below GP, elimination must target IJ 7540, not COGS. | Done |
| 6.5 | IJ ¥278,199 treatment | ✅ CP confirms following the consolidated report (in COGS at 6540). | **Resolved.** Model already follows this. | Done |
| 6.6 | Net profit control tolerance | Suggested in spec: 0.1% of consolidated net profit. Awaiting finance confirmation. | **Non-blocking** for FY2025 prototype (we're only going to GP). When below-GP work begins, add `[Check Net Profit Identity]` with the agreed tolerance as a parameter. | Client finance |
| 6.7 | IC inventory at year end | Awaiting | **Non-blocking** for FY2025 (spec assumes zero; result reconciles). Flag as caveat in build_notes. | Client finance |
| 6.8 | Divisional export (per 部門) | Out of current scope. Required for BG1–BG4 divisional P&L and divisional operating profit. | Future phase. Needs 部門内訳表 per entity including H&R神戸, on same template. | Deferred |
| 6.9 | FY2024 files | Not yet supplied | Out of current scope. Loading FY2024 is adding files through `fn_LoadEntity`, no code change. Prior-year measures (`[Revenue PY Act]`, `[GP PY Act]`) return blank until then. | Client finance |

## What we are waiting on from the client to finish the prototype

Must-have:
- **The three Bugyo 予実表 files** (H&R, RELO, RNA Group) for FY2025.
- **`IJ data coversion.xlsx`** (to confirm the hand-keyed IJ figures still match).
- **`2025年度_連結レポート_Mar unit K YE.xlsx`** (for Control C — the only use of this file).
- **`RNA_Elimination_Proof_JP.xlsx`** (the reference workbook — cross-check against our Python validation output).

Nice-to-have:
- `rna_consolidation.py` — the reference script, to compare our logic line-by-line.
- The file hashes from spec §2.1 so we know we have the exact versions the spec describes.

Delivery: Google Drive folder shared with the user's account; this session can read via `mcp__Google_Drive__*`.

## Hosting / data-source upgrade (deferred — awaiting client IT engagement)

The current build reads the three 予実表 files via **`p_Folder` as a local filesystem path**. The intended user will Sync the SharePoint folder to their PC via OneDrive and repoint `p_Folder` at the synced local path. Works, but puts files on each user's disk.

A **SharePoint-connector variant** was built and tested briefly in commit `04d3a1a` ("Switch file-reading layer to SharePoint connector"), then reverted in `e4d9bc6` because cross-tenant auth couldn't be completed in the developer environment:
- Files live on `morethanrelo.sharepoint.com` tenant.
- Developer (Ben) holds a `legacyandkey.com` account and a `relonetworkasia` account; no morethanrelo guest. Can't authenticate Power BI Desktop against morethanrelo directly.
- Client end-users on `relonetworkasia` may or may not have cross-tenant guest access to the morethanrelo site — unverified.

**When to resurrect:**
- Client's IT confirms a native account on the morethanrelo tenant (or cross-tenant SharePoint access with Power BI Desktop allowed by Conditional Access), **or**
- The report migrates to Power BI Service with an on-tenant workspace and a scheduled refresh via Data Gateway or SharePoint connector.

**How to resurrect:**
- `git cherry-pick 04d3a1a` restores the SharePoint-variant code (parameters, `fn_LoadEntity`, `chk_ImportIntegrity`, updated build_notes).
- The variant uses two parameters: `p_SharePointSite` (site URL, e.g. `https://morethanrelo.sharepoint.com/sites/ITTeam`) and `p_FolderPath` (path within Shared Documents).
- On first refresh, PBI prompts for an **Organizational account** against the SharePoint URL.
