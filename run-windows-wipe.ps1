# Auto-locate the OpenClaw wipeout repo anywhere on C:
$repo = Get-ChildItem -Path C:\ -Recurse -Directory -Filter 'openclaw-total-wipeout*' -ErrorAction SilentlyContinue |
        Select-Object -First 1

if (-not $repo) {
    Write-Host "[ERROR] Could not find the OpenClaw wipeout repo on C:. Make sure it's unzipped."
    exit
}

$script = Join-Path $repo.FullName "scripts\wipe-openclaw-windows.ps1"

Write-Host "[INFO] Found repo at: $($repo.FullName)"
Write-Host "[INFO] Running wipe script..."
powershell -ExecutionPolicy Bypass -File $script
