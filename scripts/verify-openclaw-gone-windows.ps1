Write-Host "=== Verify OpenClaw on Windows ==="
$found = & where.exe openclaw 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "OpenClaw STILL present:"
    Write-Host $found
    exit 1
} else {
    Write-Host "OpenClaw not found on Windows."
}
