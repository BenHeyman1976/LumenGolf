# RNA Group Consolidated P&L — Power BI build

Prototype replacing Diggle with a Power BI model that produces the RNA Group consolidated P&L (H&R Consultants, RELO Japan, RNA Group, Immigration Japan), from Kanjo Bugyo Cloud (勘定奉行) 予算実績対比表 exports.

## Source of truth

`docs/spec_v3.md` — the bilingual (JA primary, EN secondary) consolidation specification, v3.0, 13 October 2026, with the finance team's responses to the open-items section. **In any conflict, the Japanese version is authoritative.**

The spec's elimination logic is already verified to the yen against the client's existing consolidated report — 54 import-integrity checks, 6 derived-net-profit checks, 39 consolidated-report comparisons, all zero variance (spec §5.1). This repo implements that spec in Power Query + DAX; it does not redesign it.

## Layout

| Path | Contents |
|---|---|
| `docs/` | Spec, build notes, open-items tracker |
| `config/` | Lookup CSVs — section map, elimination register, entities, scenarios |
| `powerquery/` | Power Query M scripts (spec §7) — paste into PBIX Advanced Editor |
| `dax/` | DAX measures (spec §8) — paste into PBIX New Measure dialog |
| `report/` | Report-page layout notes (spec §9) |
| `scripts/` | Python validation — reproduces spec §4 numbers before PBIX work begins |
| `samples/` | Local-only drop zone for real source files (gitignored) |

## Build order

1. Share the 4 source files + `RNA_Elimination_Proof_JP.xlsx` via Google Drive (session-side).
2. Run `scripts/validate.py` — must hit spec §4.1 numbers to the yen.
3. Follow `docs/build_notes.md` to paste Power Query and DAX into the PBIX.
4. Verify against spec §5.1 control checks.

## Scope

FY2025 (April 2025 – March 2026), budget + actual, consolidated P&L down to gross profit (spec §10 lists what is explicitly out of scope: below-GP extension, divisional split, FY2024 comparatives, BS/CF, line-by-line Diggle comparison).
