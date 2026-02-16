# Troubleshooting Guide

This page helps diagnose and resolve issues when running the OpenClaw Total Wipeout tool on Windows.

---

## Script will not run / “not digitally signed”

### Cause  
You are running the repo from a **cloud‑synced folder** such as:

- OneDrive
- Dropbox
- iCloud
- Google Drive

These locations enforce additional execution restrictions.

### Fix  
Move the entire repo to a **local, non‑synced folder**, for example:

C:\Users\<you>\Desktop\openclaw-wipe

Then run:

powershell
```
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
.\run-windows-wipe.ps1
```

“Could not locate wipe-openclaw-windows.ps1”
Cause
GitHub ZIPs often create a double‑nested folder:
openclaw-total-wipeout/
  openclaw-total-wipeout/
    run-windows-wipe.ps1
    scripts/

The launcher must detect the correct folder.

Fix
Ensure the structure looks like:
repo/
  run-windows-wipe.ps1
  scripts/
    wipe-openclaw-windows.ps1
    
If nested, run from the inner folder.

“The term 'openclaw' is not recognized…”
Meaning
This is good.
It means OpenClaw is no longer on your PATH.

No action required.

“WARNING: openclaw still resolves to…”
Cause
A leftover shim or WindowsApps stub still exists.

Fix
The wipe script already checks these locations:

%APPDATA%\npm\openclaw*

%LOCALAPPDATA%\Microsoft\WindowsApps\openclaw*

If the script prints a path, delete it manually:
```
Remove-Item "<path shown>" -Force
```
Then run the wipe again.

“npm uninstall failed” or “npm not installed”
Meaning
This is normal if:

npm is not installed

OpenClaw was not installed globally

The wipe continues normally.

Script prints garbage characters like “ðŸ…”
Cause
PowerShell cannot parse emoji or corrupted UTF‑8.

Fix
Ensure all .ps1 files in the repo:

contain ASCII only

are saved as UTF‑8 (no BOM)

The corrected repo version already enforces this.

“Access denied” when deleting files
Cause
A process may be locking a file or folder.

Fix
Close all terminals, editors, or programs that may be using OpenClaw files, then run:

```
.\run-windows-wipe.ps1
```

If needed, run PowerShell as Administrator.

“ExecutionPolicy Bypass is not allowed”
Cause
Group Policy or enterprise restrictions.

Fix
Use this instead:

```
powershell -ExecutionPolicy RemoteSigned -File run-windows-wipe.ps1
```
Or run from an elevated PowerShell session.

Wipe script deleted the repo folder
Cause
This happened in older versions that used wildcard deletion like:
```
Get-ChildItem -Recurse -Filter "openclaw*"
```

Fix
The corrected version never deletes based on name patterns.
Update to the latest version of the repo.

Nothing happens when running the script
Cause
You may be running the script from the wrong folder.

Fix
Ensure you are in the same directory as run-windows-wipe.ps1:
```
cd "C:\path\to\repo"
.\run-windows-wipe.ps1

```

Still stuck?

Verify:

You are not in a cloud-synced folder

You are running the corrected scripts

Your repo structure matches the expected layout

If issues persist, re-download the repo and run from a clean local folder.
