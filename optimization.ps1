
function Write-Log {
    param ([string]$message)
    $logFile = "C:\Windows_Optimization_Log.txt"
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logFile -Value "$timestamp - $message"
}

Write-Output "Starting Disk Cleanup..."
Write-Log "Disk cleanup initiated."
Start-Process cleanmgr.exe -ArgumentList "/sagerun:1" -Wait
Write-Log "Disk cleanup completed."

$tempDirs = @("C:\Windows\Temp", "$env:Temp")
foreach ($dir in $tempDirs) {
    Write-Output "Cleaning up temporary files in $dir"
    Write-Log "Cleaning up temporary files in $dir"
    Remove-Item "$dir\*" -Recurse -Force -ErrorAction SilentlyContinue
}
Write-Log "Temporary file cleanup completed."

Write-Output "Disabling unnecessary startup programs..."
Write-Log "Disabling unnecessary startup programs."
$startupItems = Get-CimInstance -ClassName Win32_StartupCommand | Where-Object {$_.Location -eq 'Startup'}
foreach ($item in $startupItems) {
    Write-Output "Disabling $($item.Name)"
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name $item.Name -Value ""
    Write-Log "Disabled startup item: $($item.Name)"
}
Write-Log "Startup program management completed."

Write-Output "Optimization script completed."
Write-Log "Windows Performance Optimization completed."
