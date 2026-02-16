# run-windows-wipe.ps1
# Robust launcher for wipe-openclaw-windows.ps1 that works even when the repo
# is nested inside another folder (GitHub ZIP double-folder issue).

$ErrorActionPreference = "Stop"

Write-Host "[INFO] Locating repo root..."

# Folder where THIS script lives
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Candidate 1: scripts folder in the same directory
$candidate1 = Join-Path $scriptDir "scripts\wipe-openclaw-windows.ps1"

# Candidate 2: scripts folder in the parent directory
$parentDir = Split-Path -Parent $scriptDir
$candidate2 = Join-Path $parentDir "scripts\wipe-openclaw-windows.ps1"

# Decide which one is real
if (Test-Path $candidate1) {
    $repoRoot = $scriptDir
    $wipeScript = $candidate1
}
elseif (Test-Path $candidate2) {
    $repoRoot = $parentDir
    $wipeScript = $candidate2
}
else {
    Write-Host "[ERROR] Could not locate scripts/wipe-openclaw-windows.ps1"
    Write-Host "Checked:"
    Write-Host "  $candidate1"
    Write-Host "  $candidate2"
    exit 1
}

Write-Host "[INFO] Repo root resolved to:"
Write-Host "  $repoRoot"
Write-Host "[INFO] Using wipe script:"
Write-Host "  $wipeScript"
Write-Host ""
Write-Host "[INFO] Running wipe script..."
Write-Host ""

powershell.exe -ExecutionPolicy Bypass -File "$wipeScript"
