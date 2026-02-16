$repo = Get-ChildItem -Path C:\ -Recurse -Directory -Filter 'openclaw-total-wipeout*' -ErrorAction SilentlyContinue | Select-Object -First 1

if (-not $repo) {
    Write-Host "Could not find the repo on C:. Make sure it's unzipped."
    exit
}

$script = Join-Path $repo.FullName "scripts\wipe-openclaw-windows.ps1"
Write-Host "Running wipe script at: $script"
powershell -ExecutionPolicy Bypass -File $script
