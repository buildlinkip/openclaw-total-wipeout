# wipe-openclaw-windows.ps1
# Safe Windows wipe script for OpenClaw. Deletes only known debris locations.
# No wildcard deletion. No profile recursion. No repo self-deletion.

$ErrorActionPreference = "Stop"

Write-Host "=== OpenClaw Windows Wipe ==="
Write-Host ""

$confirm = Read-Host "Wipe OpenClaw from Windows? (y/N)"
if ($confirm -ne "y") {
    Write-Host "Aborted."
    exit 0
}

Write-Host "[1/4] Removing global npm install..."
try {
    npm uninstall -g openclaw --silent | Out-Null
} catch {
    Write-Host "npm uninstall failed or npm not installed. Continuing."
}

Write-Host "[2/4] Removing known OpenClaw directories..."

$targets = @(
    "$env:USERPROFILE\.openclaw",
    "$env:LOCALAPPDATA\openclaw",
    "$env:APPDATA\openclaw",
    "$env:TEMP\openclaw"
)

foreach ($t in $targets) {
    if (Test-Path $t) {
        Write-Host "Removing $t"
        Remove-Item $t -Recurse -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "[3/4] Removing npm shims..."

$npmShim1 = Join-Path $env:APPDATA "npm\openclaw"
$npmShim2 = Join-Path $env:APPDATA "npm\openclaw.cmd"

foreach ($shim in @($npmShim1, $npmShim2)) {
    if (Test-Path $shim) {
        Write-Host "Removing $shim"
        Remove-Item $shim -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "[4/4] Checking PATH for remaining OpenClaw commands..."

# 1. Check if the command resolves
$cmd = Get-Command openclaw -ErrorAction SilentlyContinue
if ($cmd) {
    Write-Host "WARNING: openclaw still resolves to:"
    Write-Host "  $($cmd.Source)"
    exit 1
}

# 2. Check WindowsApps stubs
$winApps = Join-Path $env:LOCALAPPDATA "Microsoft\WindowsApps"
$stubs = Get-ChildItem $winApps -Filter "openclaw*" -ErrorAction SilentlyContinue

if ($stubs) {
    Write-Host "WARNING: WindowsApps stub still exists:"
    foreach ($s in $stubs) {
        Write-Host "  $($s.FullName)"
    }
    exit 1
}

Write-Host "OpenClaw fully removed from Windows."
exit 0
