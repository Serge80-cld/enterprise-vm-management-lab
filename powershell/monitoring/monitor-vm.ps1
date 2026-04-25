param(
    [string]$ComputerName = "localhost",
    [string]$LogPath = "C:\Logs\monitoring"
)

# Create log directory if missing
if (!(Test-Path $LogPath)) {
    New-Item -ItemType Directory -Path $LogPath | Out-Null
}

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logFile = "$LogPath\monitoring-$(Get-Date -Format 'yyyyMMdd').log"

# Collect CPU
$cpu = Get-Counter '\Processor(_Total)\% Processor Time'
$cpuValue = [math]::Round($cpu.CounterSamples.CookedValue, 2)

# Collect RAM
$ram = Get-Counter '\Memory\Available MBytes'
$ramValue = [math]::Round($ram.CounterSamples.CookedValue, 2)

# Collect Disk
$disks = Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3"

# Build log entry
$logEntry = "`n[$timestamp] CPU: $cpuValue% | RAM Available: $ramValue MB"

foreach ($disk in $disks) {
    $sizeGB = [math]::Round($disk.Size / 1GB, 2)
    $freeGB = [math]::Round($disk.FreeSpace / 1GB, 2)
    $usedGB = $sizeGB - $freeGB
    $percent = [math]::Round(($usedGB / $sizeGB) * 100, 2)

    $logEntry += " | Disk $($disk.DeviceID): $percent% used"
}

# Write to log
$logEntry | Out-File -FilePath $logFile -Append

Write-Host "Monitoring entry added:" -ForegroundColor Cyan
Write-Host $logEntry -ForegroundColor Yellow
