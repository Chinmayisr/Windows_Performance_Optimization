function Write-Log {
    param ([string]$message)
    $logFile = "C:\Windows_Optimization_Log.txt"
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logFile -Value "$timestamp - $message"
}


Write-Log "Disk cleanup initiated."
