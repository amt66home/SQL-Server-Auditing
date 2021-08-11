# Fetch parameter values
Set-Location "C:\Audit\PowerShellScripts"
. .\ParameterScript.ps1

$AuditArchivePath 
$ErrorLogPath 
$ErrorLogFile
$ErrorLog = "$ErrorLogPath\$ErrorLogFile.log"
$NewFName = "$ErrorLogFile-$(get-date -f yyyy-MM-dd-hh-mm-ss).log"
$Retention 
$CurrentDate = Get-Date
$DeleteDate = $CurrentDate.AddDays($Retention) # subtract retention days from current date to get the date parameter for deleting
$FileType = "$errorlogfile*.log"

Try
{
    #Check if the log file exists and if it does rename it
    Switch (Test-Path $ErrorLog)
    {
  
        True {Rename-Item -Path $ErrorLog  -NewName $ErrorLogPath\$NewFName  
        Move-Item $ErrorLogPath\$NewFName -Destination $AuditArchivePath -ErrorAction Stop}
        False {Write-Warning "$ErrorLogPath\$NewFName does not exist"}
    }
# put code here to delete log files older than retention
   Get-ChildItem "$AuditArchivePath\$FileType" -ErrorAction Stop | Where-Object {$_.LastWriteTime -lt $DeleteDate} |Remove-Item -ErrorAction Stop

} 
 

catch
    {
         
        Write-Output   "$ErrorDate -  AuditLogHousekeeping ran into an issue: $($PSItem.ToString())" | Out-File $ErrorLog -Append
    
    }

