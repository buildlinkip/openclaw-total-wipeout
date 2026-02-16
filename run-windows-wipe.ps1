# run-windows-wipe.ps1
# Launcher for the Windows wipe script from the repo root (handles nested GitHub ZIP folders safely).

$ErrorActionPreference = "Stop"

Write-Host "[INFO] Locating repo root relative to this script..."

# Folder where THIS script lives
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Prefer the folder this script is in as repo root
$repoRoot = $scriptDir
$scriptsDir = Join-Path $repoRoot "scripts"
$wipeScript = Join-Path $scriptsDir "wipe-openclaw-windows.ps1"

# If scripts folder not found here, try parent as fallback
if (-not (Test-Path $wipeScript)) {
    $parent = Split-Path -Parent $scriptDir
    $altScriptsDir = Join-Path $parent "scripts"
    $altWipeScript = Join-Path $altScriptsDir "wipe-openclaw-windows.ps1"

    if (Test-Path $altWipeScript) {
        $repoRoot = $parent
        $scriptsDir = $altScriptsDir
        $wipeScript = $altWipeScript
    }
}

if (-not (Test-Path $wipeScript)) {
    Write-Host "[ERROR] Could not find wipe-openclaw-windows.ps1."
    Write-Host "  Tried:"
    Write-Host "    $wipeScript"
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
