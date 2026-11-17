# 01 — Parameters (spec §7.1)

Create in Power BI Desktop via **Home → Manage Parameters → New Parameter**, type **Text**.

| Name | Value |
|---|---|
| `p_Folder` | The folder holding the three input files, **with a trailing backslash**. Example: `C:\RNA\FY2025\` |
| `p_FileHR` | `H&R_FY2025予実表.xlsx` |
| `p_FileRELO` | `RELO_FY2025予実表.xlsx` |
| `p_FileRNAG` | `RNAG_FY2025予実表.xlsx` |

Holding the folder as a parameter is what lets the report be repointed at SharePoint later without any code change.
