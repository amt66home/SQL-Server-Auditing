<#
    Executes scripts to archive any audit files it finds and import data from the audit files in the
    archive folder if it hasn't already been imported
#>
# Fetch parameter values
Set-Location "C:\Audit\PowerShellScripts"
. .\ParameterScript.ps1

#Install-Module -Name SqlServer -AllowClobber

$ErrorLogPath
$ErrorLogFile
$ErrorLog = "$ErrorLogPath\$ErrorLogFile.log"
$ScriptPath
$ArchiveScript = 'AuditFileArchive.ps1'
$ImportArchiveDataScript = 'AuditImportArchiveData.ps1'

Try
{
    Invoke-Expression -Command "$ScriptPath\$ArchiveScript" -ErrorAction Stop
    Invoke-Expression -Command "$ScriptPath\$ImportArchiveDataScript" -ErrorAction Stop
}
Catch
{
    Write-Output   "$ErrorDate -  AuditRestartRoutine ran into an issue: $($PSItem.ToString())" | Out-File $ErrorLog -Append

}

