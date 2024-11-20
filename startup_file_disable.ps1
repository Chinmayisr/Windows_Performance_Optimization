Write-Output "Disabling unnecessary startup programs..."
$startupItems = Get-CimInstance -ClassName Win32_StartupCommand | Where-Object {$_.Location -eq 'Startup'}
foreach ($item in $startupItems) {
    Write-Output "Disabling $($item.Name)"
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name $item.Name -Value ""
}
Write-Output "Startup program management completed."
