Write-Host "=== Starting Windows Patching ===" -ForegroundColor Cyan

# Step 1: Check for updates
Write-Host "`nChecking for available updates..." -ForegroundColor Yellow
$updates = Get-WindowsUpdate -AcceptAll -IgnoreReboot

if ($updates.Count -eq 0) {
    Write-Host "No updates available." -ForegroundColor Green
    exit
}

Write-Host "`nUpdates found:" -ForegroundColor Yellow
$updates | Select-Object Title, KB, Size

# Step 2: Install updates
Write-Host "`nInstalling updates..." -ForegroundColor Yellow
Install-WindowsUpdate -AcceptAll -AutoReboot -IgnoreReboot

Write-Host "`nUpdates installed successfully." -ForegroundColor Green

# Step 3: Generate report
$reportPath = "C:\Logs\patch-report-$(Get-Date -Format 'yyyyMMdd-HHmm').txt"

Write-Host "`nGenerating patch report at $reportPath" -ForegroundColor Yellow

$updates | Out-File -FilePath $reportPath

Write-Host "`n=== Patching Completed ===" -ForegroundColor Cyan
