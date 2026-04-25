$monitoringLog = Get-ChildItem "C:\Logs\monitoring" -Filter "monitoring-*.log" -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
$backupLog     = Get-ChildItem "C:\Logs\backups"    -Filter "backup-*.log"     -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
$hardeningLog  = Get-ChildItem "C:\Logs\hardening"  -Filter "hardening-*.log"  -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1

$tasks = Get-ScheduledTask | Where-Object TaskName -like "VM-*"

$html = @"
<html>
<head>
  <title>SergeLab - VM Ops Dashboard</title>
  <style>
    body { font-family: Segoe UI, Arial; background:#111; color:#eee; }
    h1 { color:#4ea3ff; }
    .card { background:#1c1c1c; padding:15px; margin-bottom:15px; border-radius:6px; }
    table { width:100%; border-collapse:collapse; }
    th, td { padding:8px; border-bottom:1px solid #333; text-align:left; }
    th { background:#222; }
    .ok { color:#7CFC00; }
    .warn { color:#FFA500; }
  </style>
</head>
<body>
  <h1>SergeLab - VM Ops Dashboard</h1>

  <div class="card">
    <h2>Derniers événements</h2>
    <p><b>Dernier monitoring :</b> $($monitoringLog.LastWriteTime)</p>
    <p><b>Dernier backup :</b> $($backupLog.LastWriteTime)</p>
    <p><b>Dernier hardening :</b> $($hardeningLog.LastWriteTime)</p>
  </div>

  <div class="card">
    <h2>Tâches planifiées VM-*</h2>
    <table>
      <tr><th>Nom</th><th>État</th></tr>
"@

foreach ($t in $tasks) {
    $html += "<tr><td>$($t.TaskName)</td><td>$($t.State)</td></tr>"
}

$html += @"
    </table>
  </div>
</body>
</html>
"@

$outPath = "C:\SergeLab\enterprise-vm-ec2-management-lab\dashboard.html"
$html | Out-File -FilePath $outPath -Encoding UTF8

Write-Host "Dashboard généré : $outPath" -ForegroundColor Cyan
