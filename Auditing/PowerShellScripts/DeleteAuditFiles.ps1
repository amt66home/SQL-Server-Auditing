# Delete audit files older than their retention date - add a check of the last write date so that files that have not had a data collection do not get deleted
# Change the retention to look at the 
# Fetch parameter values
Set-Location "C:\Audit\PowerShellScripts"
. .\ParameterScript.ps1


$ErrorLogPath
$ErrorLogFile
$ErrorLog = "$ErrorLogPath\$ErrorLogFile.log"
$AuditArchivePath 
$filter 
$Retention 
$CurrentDate = Get-Date
$DeleteDate = $CurrentDate.AddDays($Retention) # subtract retention days from current date to get the date parameter for deleting

try 
{
    Get-ChildItem "$AuditArchivePath\$filter" -ErrorAction Stop | Where-Object {$_.CreationTime -lt $DeleteDate -and $_.LastWriteTime -eq "01/01/2000 00:00:00"} |Remove-Item -ErrorAction Stop
} 

catch
{
 
    Write-Output   "$CurrentDate -  DeleteAuditFiles ran into an issue: $($PSItem.ToString())" | Out-File $ErrorLog -Append
    
}
