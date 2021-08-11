<#
    Moves the current audit files into the archive
#>
# Fetch parameter values
Set-Location "C:\Audit\PowerShellScripts"
. .\ParameterScript.ps1

$ErrorLogPath
$ErrorLogFile
$ErrorLog = "$ErrorLogPath\$ErrorLogFile.log"
$ErrorDate = Get-Date
$AuditArchivePath 
$AuditFilePath 

Switch(Test-Path $AuditArchivePath)
{
True
{

Try
{

    foreach($AuditFile in Get-ChildItem $AuditFilePath -Recurse -File  -Include *.sqlaudit)
    {
    try { [IO.File]::OpenWrite($AuditFile).close();$true 
    Move-Item $AuditFile -Destination $AuditArchivePath -ErrorAction Stop
    Write-Host "the file $AuditFile was moved to $AuditArchivePath "}
    catch {$false}
    }

}
Catch
{
    Write-Output   "$ErrorDate -  AuditImportArchiveData ran into an issue: $($PSItem.ToString())" | Out-File $ErrorLog -Append

}

}
False
{
  Write-Output   "$ErrorDate The path $AuditArchivePath does not exist" | Out-File $ErrorLog -Append  
}
}


