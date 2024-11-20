$tempDirs = @("C:\Windows\Temp", "$env:Temp")


foreach ($dir in $tempDirs) {
    Write-Output "Cleaning up temporary files in $dir"
    Remove-Item "$dir\*" -Recurse -Force -ErrorAction SilentlyContinue
}
Write-Output "Temporary file cleanup completed."
