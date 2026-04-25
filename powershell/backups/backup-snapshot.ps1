param(
    [string]$SnapshotName = "Snapshot-$(Get-Date -Format 'yyyyMMdd-HHmm')",
    [string]$LogPath = "C:\Logs\backups"
)

Write-Host "=== Starting Snapshot Backup ===" -ForegroundColor Cyan

# Create log directory if missing
if (!(Test-Path $LogPath)) {
    New-Item -ItemType Directory -Path $LogPath | Out-Null
}

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logFile = "$LogPath\backup-$(Get-Date -Format 'yyyyMMdd').log"

# Simulate snapshot creation
Write-Host "`nCreating snapshot: $SnapshotName" -ForegroundColor Yellow

# In a real cloud environment, this would be:
# Azure: New-AzSnapshot
# AWS:   New-EC2Snapshot
# Here we simulate:
Start-Sleep -Seconds 2

Write-Host "Snapshot created successfully." -ForegroundColor Green

# Log entry
$logEntry = "[$timestamp] Snapshot created: $SnapshotName"
$logEntry | Out-File -FilePath $logFile -Append

Write-Host "`nBackup log updated at $logFile" -ForegroundColor Yellow
Write-Host "`n=== Backup Completed ===" -ForegroundColor Cyan
