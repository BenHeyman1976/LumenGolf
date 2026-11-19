# 01 — Parameters (spec §7.1, SharePoint variant)

Create in Power BI Desktop via **Home → Manage Parameters → New Parameter**, type **Text**.

| Name | Example value |
|---|---|
| `p_SharePointSite` | `https://morethanrelo.sharepoint.com/sites/ITTeam` |
| `p_FolderPath` | `PowerBI Project 2026/Power BI model` |
| `p_FileHR` | `H&R_FY2025予実表.xlsx` |
| `p_FileRELO` | `RELO_FY2025予実表.xlsx` |
| `p_FileRNAG` | `RNAG_FY2025予実表.xlsx` |

## Why two parameters instead of one path

- `p_SharePointSite` — the SharePoint **site** URL (no trailing slash). Everything up to `/sites/<SiteName>`.
- `p_FolderPath` — the path **within** the default `Shared Documents` library, using **forward slashes** (/), **no leading or trailing slash**.

If the client reorganises their SharePoint, only these two values change.

## Authentication

On first refresh, Power BI prompts for credentials against the SharePoint URL. Choose **Organizational account** → sign in with the Microsoft work account that has access to the site. Power BI caches this; subsequent refreshes don't prompt.

## Why this is safer than a local-path approach

- **Files never leave the client's tenant.** Nothing synced to any personal OneDrive or laptop.
- **Access is SharePoint-governed.** Anyone opening the PBIX only sees data they'd see in the browser.
- **Audit stays with SharePoint.** Who opened/refreshed what is visible in SharePoint logs.
- **Portable.** Every PBIX user resolves the same URL; no per-user path editing.
