#!/usr/bin/env python3
"""
RNA Group consolidation — Python reference implementation.

Mirrors the Power Query logic in powerquery/*.pq verbatim. Reads the three
Bugyo exports + the hand-keyed IJ data, applies the seven eliminations
(EL1-EL7, with EL1 derived), and prints the four controls from spec §5.1.

Purpose: prove the elimination logic against the real source files BEFORE
building the PBIX. If this script's numbers do not match spec §4.1 exactly,
the implementation is wrong — nothing to do with Power BI.

Usage:
    pip install openpyxl
    python validate.py "C:/path/to/folder/containing/the/three/xlsx/files"

Exit codes: 0 pass, 1 fail.
"""

from __future__ import annotations

import sys
import re
from datetime import date
from pathlib import Path
from collections import defaultdict
from typing import Iterable

try:
    from openpyxl import load_workbook
except ImportError:
    sys.exit("openpyxl not installed. Run: pip install openpyxl")


# --- spec §2.1 filenames -----------------------------------------------------
FILE_HR   = "H&R_FY2025予実表.xlsx"
FILE_RELO = "RELO_FY2025予実表.xlsx"
FILE_RNAG = "RNAG_FY2025予実表.xlsx"

# --- spec §7.2 ref_Section ---------------------------------------------------
REF_SECTION = [
    # PCode,  Section,                 SectionNo, Sign
    ("P1000", "Revenue",               1,  1),
    ("P1100", "COGS",                  2, -1),
    ("P3001", "SG&A Personnel",        3, -1),
    ("P3002", "SG&A Other",            4, -1),
    ("P4110", "Non-operating income",  5,  1),
    ("P4120", "Non-operating expense", 6, -1),
    ("P5110", "Extraordinary income",  7,  1),
    ("P5120", "Extraordinary loss",    8, -1),
    ("P6110", "Tax",                   9, -1),
]
PCODES = [r[0] for r in REF_SECTION]
PCODE_TO_SECTION = {r[0]: r[1] for r in REF_SECTION}

# --- spec §7.3 ref_Elimination -----------------------------------------------
REF_ELIMINATION = [
    # ElimID, Entity, AccountCode, Section
    ("EL1", "H&R",  "5230", "Revenue"),
    ("EL2", "H&R",  "5255", "Revenue"),
    ("EL3", "H&R",  "5135", "Revenue"),
    ("EL4", "RELO", "5360", "Revenue"),
    ("EL5", "RELO", "5145", "Revenue"),
    ("EL6", "RELO", "6530", "COGS"),
    ("EL7", "H&R",  "6360", "COGS"),
]

# --- spec §7.5 IJ hand-keyed values ------------------------------------------
IJ_ROWS = [
    # Date, Section, Amount
    (date(2026, 1, 1), "Revenue", 3603746),
    (date(2026, 2, 1), "Revenue", 2160162),
    (date(2026, 3, 1), "Revenue", 3656682),
    (date(2026, 1, 1), "COGS",     102781),
    (date(2026, 2, 1), "COGS",      54271),
    (date(2026, 3, 1), "COGS",     121147),
]

# --- spec §4.1 expected totals (FY2025) --------------------------------------
EXPECTED_ACTUAL = {
    "Gross Revenue":          1735168178,
    "Revenue Eliminations":   -258617387,
    "Consolidated Revenue":   1476550791,
    "Gross COGS":              831569424,
    "COGS Eliminations":      -252857387,
    "Consolidated COGS":       578712037,
    "Gross Profit":            897838754,
}
EXPECTED_BUDGET = {
    "Gross Revenue":          1879767866,
    "Revenue Eliminations":   -266704397,
    "Consolidated Revenue":   1613063469,
    "Gross COGS":              863813564,
    "COGS Eliminations":      -266704397,
    "Consolidated COGS":       597109167,
    "Gross Profit":           1015954302,
}

# --- spec §4.3 monthly actual expected ---------------------------------------
EXPECTED_MONTHLY_ACTUAL = {
    date(2025,  4, 1): (144198233, -22996540, 121201693, 49041138, 72160555),
    date(2025,  5, 1): (136661188, -18517385, 118143803, 46908349, 71235454),
    date(2025,  6, 1): (146418184, -21557667, 124860517, 49968264, 74892253),
    date(2025,  7, 1): (170241924, -25554265, 144687659, 57694972, 86992687),
    date(2025,  8, 1): (153561650, -22148102, 131413548, 47157170, 84256378),
    date(2025,  9, 1): (168366744, -22059617, 146307127, 51364423, 94942704),
    date(2025, 10, 1): (153489127, -18540051, 134949076, 55765600, 79183476),
    date(2025, 11, 1): (125824046, -16378325, 109445721, 46627351, 62818370),
    date(2025, 12, 1): (133168715, -19723119, 113445596, 45649614, 67795982),
    date(2026,  1, 1): (137500396, -25236928, 112263468, 42064003, 70199465),
    date(2026,  2, 1): (123187806, -20306773, 102881033, 41743995, 61137038),
    date(2026,  3, 1): (142550165, -25598615, 116951550, 44727158, 72224392),
}


# --- loader (mirror of fn_LoadEntity) ----------------------------------------
HEADER_RE = re.compile(r"(\d{4})年\s*(\d{1,2})月(予算|実績)\(発生\)")

def load_entity(path: Path, entity_name: str, entity_code: str) -> list[dict]:
    """
    Reads one Bugyo 予算実績対比表 (predicted vs actual) export, returns long format.
    One row per Entity / AccountCode / Date / Scenario / Amount.
    """
    wb = load_workbook(path, data_only=True, read_only=True)
    if "損益計算書" not in wb.sheetnames:
        raise RuntimeError(f"{path.name}: sheet '損益計算書' not found")
    ws = wb["損益計算書"]

    # Find header row by content: the row where column B contains '科目名'.
    rows = list(ws.iter_rows(values_only=True))
    header_idx = None
    for i, row in enumerate(rows):
        if len(row) >= 2 and row[1] and str(row[1]).strip() == "科目名":
            header_idx = i
            break
    if header_idx is None:
        raise RuntimeError(f"{path.name}: header row (B='科目名') not found — layout changed")

    header = [str(c).strip() if c is not None else "" for c in rows[header_idx]]
    data = rows[header_idx + 1 :]

    # Identify monthly (発生) columns and parse each to (date, scenario).
    month_cols: list[tuple[int, date, str]] = []
    for ci, name in enumerate(header):
        m = HEADER_RE.search(name)
        if not m:
            continue
        year, month, scen_char = int(m.group(1)), int(m.group(2)), m.group(3)
        scenario = "Budget" if scen_char == "予算" else "Actual"
        month_cols.append((ci, date(year, month, 1), scenario))
    if not month_cols:
        raise RuntimeError(f"{path.name}: no (発生) columns found")

    # Section-row positions for 'assign to next P-code below'.
    section_positions: list[tuple[int, str]] = []
    for ri, row in enumerate(data):
        code_raw = row[0]
        code = str(code_raw).strip() if code_raw is not None else ""
        if code in PCODES:
            section_positions.append((ri, code))

    def pcode_for_row(ri: int) -> str | None:
        for pos, pc in section_positions:
            if pos > ri:
                return pc
        return None

    out: list[dict] = []
    for ri, row in enumerate(data):
        code_raw = row[0]
        name_raw = row[1]
        if code_raw is None:
            continue
        code = str(code_raw).strip()
        # detail row = exactly 4 numeric digits
        if not (len(code) == 4 and code.isdigit()):
            continue
        name = str(name_raw).strip() if name_raw is not None else ""
        pcode = pcode_for_row(ri)
        if pcode is None:
            raise RuntimeError(
                f"{path.name}: row {ri} account {code} falls outside every P&L section — layout changed"
            )
        section = PCODE_TO_SECTION[pcode]
        for ci, d, scen in month_cols:
            if ci >= len(row):
                continue
            v = row[ci]
            if v is None or v == 0:
                continue
            try:
                amt = float(v)
            except (TypeError, ValueError):
                continue
            if amt == 0:
                continue
            out.append({
                "Entity": entity_name,
                "EntityCode": entity_code,
                "AccountCode": code,
                "AccountName": name,
                "Section": section,
                "PCode": pcode,
                "Date": d,
                "Scenario": scen,
                "Amount": amt,
                "RecordType": "Source",
                "ElimID": None,
            })
    return out


def load_ij() -> list[dict]:
    """fact_IJ — hand-keyed; spec §7.5."""
    out = []
    for d, section, amt in IJ_ROWS:
        out.append({
            "Entity": "Immigration Japan",
            "EntityCode": "IJ",
            "AccountCode": "5900" if section == "Revenue" else "6900",
            "AccountName": "IJ revenue (manual)" if section == "Revenue" else "IJ cost (manual)",
            "Section": section,
            "PCode": None,
            "Date": d,
            "Scenario": "Actual",
            "Amount": float(amt),
            "RecordType": "Source",
            "ElimID": None,
        })
    return out


def build_eliminations(source: list[dict]) -> list[dict]:
    """fact_Elimination — spec §7.7. Returns negative rows to be appended."""
    def grab(entity: str, code: str) -> dict[tuple[date, str], float]:
        bucket: dict[tuple[date, str], float] = defaultdict(float)
        for r in source:
            if r["Entity"] == entity and r["AccountCode"] == code:
                bucket[(r["Date"], r["Scenario"])] += r["Amount"]
        return bucket

    b6530 = grab("RELO", "6530")
    b5255 = grab("H&R",  "5255")
    b5135 = grab("H&R",  "5135")
    b5360 = grab("RELO", "5360")
    b5145 = grab("RELO", "5145")
    b6360 = grab("H&R",  "6360")

    def look(bucket: dict, d: date, s: str) -> float:
        return bucket.get((d, s), 0.0)

    spine = sorted({(r["Date"], r["Scenario"]) for r in source})
    reg = {r[0]: r for r in REF_ELIMINATION}  # ElimID -> row

    rows: list[dict] = []
    for d, s in spine:
        values = {
            "EL1": look(b6530, d, s) - look(b5255, d, s) - look(b5135, d, s),
            "EL2": look(b5255, d, s),
            "EL3": look(b5135, d, s),
            "EL4": look(b5360, d, s),
            "EL5": look(b5145, d, s),
            "EL6": look(b6530, d, s),
            "EL7": look(b6360, d, s),
        }
        for elim_id, gross in values.items():
            if gross == 0:
                continue
            _, ent, code, section = reg[elim_id]
            rows.append({
                "Entity": ent,
                "EntityCode": "HR" if ent == "H&R" else "RJ",
                "AccountCode": code,
                "AccountName": "",
                "Section": section,
                "PCode": None,
                "Date": d,
                "Scenario": s,
                "Amount": -gross,
                "RecordType": "Elimination",
                "ElimID": elim_id,
            })
    return rows


def totals(rows: Iterable[dict], scenario: str) -> dict[str, float]:
    gross_rev = sum(r["Amount"] for r in rows
                    if r["Scenario"] == scenario and r["Section"] == "Revenue" and r["RecordType"] == "Source")
    elim_rev  = sum(r["Amount"] for r in rows
                    if r["Scenario"] == scenario and r["Section"] == "Revenue" and r["RecordType"] == "Elimination")
    gross_cog = sum(r["Amount"] for r in rows
                    if r["Scenario"] == scenario and r["Section"] == "COGS"    and r["RecordType"] == "Source")
    elim_cog  = sum(r["Amount"] for r in rows
                    if r["Scenario"] == scenario and r["Section"] == "COGS"    and r["RecordType"] == "Elimination")
    rev = gross_rev + elim_rev
    cog = gross_cog + elim_cog
    return {
        "Gross Revenue":        gross_rev,
        "Revenue Eliminations": elim_rev,
        "Consolidated Revenue": rev,
        "Gross COGS":           gross_cog,
        "COGS Eliminations":    elim_cog,
        "Consolidated COGS":    cog,
        "Gross Profit":         rev - cog,
    }


def monthly_actual_rows(rows: list[dict]) -> dict[date, tuple[int, int, int, int, int]]:
    out: dict[date, tuple[int, int, int, int, int]] = {}
    months = sorted({r["Date"] for r in rows if r["Scenario"] == "Actual"})
    for m in months:
        subset = [r for r in rows if r["Scenario"] == "Actual" and r["Date"] == m]
        gross_rev = sum(r["Amount"] for r in subset if r["Section"] == "Revenue" and r["RecordType"] == "Source")
        elim_rev  = sum(r["Amount"] for r in subset if r["Section"] == "Revenue" and r["RecordType"] == "Elimination")
        gross_cog = sum(r["Amount"] for r in subset if r["Section"] == "COGS"    and r["RecordType"] == "Source")
        elim_cog  = sum(r["Amount"] for r in subset if r["Section"] == "COGS"    and r["RecordType"] == "Elimination")
        rev = gross_rev + elim_rev
        cog = gross_cog + elim_cog
        gp = rev - cog
        out[m] = (int(round(gross_rev)), int(round(elim_rev)), int(round(rev)),
                  int(round(cog)), int(round(gp)))
    return out


def fmt(n: float) -> str:
    return f"{int(round(n)):>16,}"


def check_row(label: str, expected: int, actual: float) -> bool:
    diff = int(round(actual)) - expected
    status = "PASS" if diff == 0 else f"FAIL diff={diff:+,}"
    print(f"  {label:<25} expected {expected:>16,}  got {fmt(actual)}  {status}")
    return diff == 0


def main() -> int:
    if len(sys.argv) != 2:
        print(__doc__)
        return 2
    folder = Path(sys.argv[1])
    if not folder.is_dir():
        print(f"not a directory: {folder}")
        return 2

    paths = {
        "H&R":       folder / FILE_HR,
        "RELO":      folder / FILE_RELO,
        "RNA Group": folder / FILE_RNAG,
    }
    for name, p in paths.items():
        if not p.is_file():
            print(f"missing input file for {name}: {p}")
            return 2

    print("Loading source files ...")
    source: list[dict] = []
    source += load_entity(paths["H&R"],       "H&R",       "HR")
    source += load_entity(paths["RELO"],      "RELO",      "RJ")
    source += load_entity(paths["RNA Group"], "RNA Group", "RNAG")
    source += load_ij()
    print(f"  loaded {len(source):,} source rows")

    elims = build_eliminations(source)
    print(f"  built  {len(elims):,} elimination rows")

    fact = source + elims

    all_pass = True

    print("\n===== Control: full-year ACTUAL vs spec §4.1 =====")
    t_act = totals(fact, "Actual")
    for k, v in EXPECTED_ACTUAL.items():
        all_pass &= check_row(k, v, t_act[k])

    print("\n===== Control: full-year BUDGET vs spec §4.1 =====")
    t_bud = totals(fact, "Budget")
    for k, v in EXPECTED_BUDGET.items():
        all_pass &= check_row(k, v, t_bud[k])

    print("\n===== Control: monthly actual vs spec §4.3 =====")
    monthly = monthly_actual_rows(fact)
    labels = ("Gross Revenue", "Elimination", "Consolidated Revenue", "Consolidated COGS", "Gross Profit")
    for m, exp in EXPECTED_MONTHLY_ACTUAL.items():
        got = monthly.get(m, (0, 0, 0, 0, 0))
        ok = got == exp
        all_pass &= ok
        tag = "PASS" if ok else "FAIL"
        print(f"  {m}  expected {exp}  got {got}  {tag}")

    print("\n===== Control D: account 5230 residual (spec §5.1) =====")
    for scenario, expected in [("Actual", 62500), ("Budget", 6602954)]:
        booked = sum(r["Amount"] for r in fact
                     if r["Entity"] == "H&R" and r["AccountCode"] == "5230"
                     and r["Scenario"] == scenario and r["RecordType"] == "Source")
        eliminated = sum(r["Amount"] for r in fact
                         if r["Entity"] == "H&R" and r["AccountCode"] == "5230"
                         and r["Scenario"] == scenario and r["RecordType"] == "Elimination")
        residual = booked + eliminated
        all_pass &= check_row(f"5230 residual {scenario}", expected, residual)

    print("\n===== EL5 Unmatched (spec §5.4, informational) =====")
    el5 = sum(-r["Amount"] for r in fact
              if r["ElimID"] == "EL5" and r["Scenario"] == "Actual")
    check_row("EL5 Unmatched Actual", 5760000, el5)

    print()
    if all_pass:
        print("ALL CHECKS PASS -- Power Query / DAX build is safe to proceed.")
        return 0
    print("ONE OR MORE CHECKS FAILED -- do NOT build the PBIX until resolved.")
    return 1


if __name__ == "__main__":
    sys.exit(main())
