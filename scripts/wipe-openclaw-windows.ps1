Write-Host "=== OpenClaw Windows wipe ==="
$answer = Read-Host "Wipe OpenClaw from Windows? (y/N)"
if ($answer -notin @("y","Y","yes","YES")) { Write-Host "Aborted."; exit }

Write-Host "[1/4] Removing global npm install..."
npm uninstall -g openclaw 2>$null

Write-Host "[2/4] Removing folders..."
$paths = @(
    "$env:USERPROFILE\.openclaw",
    "$env:LOCALAPPDATA\openclaw",
    "$env:APPDATA\openclaw",
    "$env:TEMP\openclaw"
)
foreach ($p in $paths) {
    if (Test-Path $p) { Remove-Item -Recurse -Force $p }
}

Write-Host "[3/4] Removing leftover folders..."
Get-ChildItem -Path "$env:USERPROFILE" -Filter "*openclaw*" -Recurse -ErrorAction SilentlyContinue |
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "[4/4] Checking PATH..."
$found = & where.exe openclaw 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "WARNING: openclaw still found:"
    Write-Host $found
} else {
    Write-Host "OpenClaw removed from Windows."
}
