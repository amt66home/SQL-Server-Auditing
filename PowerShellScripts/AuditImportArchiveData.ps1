

# Fetch parameter values
Set-Location "C:\Audit\PowerShellScripts"
. .\ParameterScript.ps1

#Install-Module -Name SqlServer -AllowClobber


$ErrorLogPath
$ErrorLogFile
$ErrorLog = "$ErrorLogPath\$ErrorLogFile.log"
$ErrorDate = Get-Date
$Computername 
$Database
$Table
$AuditArchivePath 
$AuditFile = Get-Item $AuditArchivePath\*.sqlaudit 
$NewDate = "01/01/2000 00:00:00"


Try
{

    foreach($AuditFile in Get-ChildItem $AuditArchivePath -Recurse -File  -Include *.sqlaudit)
    {
        if($AuditFile.LastWriteTime -ne "01/01/2000 00:00:00")
        {

            $AuditData = Invoke-Sqlcmd -ServerInstance $Computername -Database $Database -Query "INSERT INTO $Table
            (
                user_defined_information, user_defined_event_id, transaction_id, target_server_principal_sid, target_server_principal_name, target_server_principal_id, target_database_principal_name, 
                target_database_principal_id, succeeded, statement, session_server_principal_name, session_id, server_principal_sid, server_principal_name, server_principal_id, server_instance_name, 
                sequence_number, sequence_group_id, schema_name, response_rows, permission_bitmask, object_name, object_id, is_column_permission, host_name, file_name, event_time, duration_milliseconds, 
                database_principal_name, database_principal_id, database_name, data_sensitivity_information, connection_id, client_ip, class_type, audit_schema_version, audit_file_offset, application_name, 
                affected_rows, additional_information, action_id
            )
            SELECT 
                user_defined_information, user_defined_event_id, transaction_id, target_server_principal_sid, target_server_principal_name, target_server_principal_id, target_database_principal_name, 
                target_database_principal_id, succeeded, statement, session_server_principal_name, session_id, server_principal_sid, server_principal_name, server_principal_id, server_instance_name, 
                sequence_number, sequence_group_id, schema_name, response_rows, permission_bitmask, object_name, object_id, is_column_permission, host_name, right(file_name,78) as file_name, event_time, duration_milliseconds, 
                database_principal_name, database_principal_id, database_name, data_sensitivity_information, connection_id, client_ip, class_type, audit_schema_version, audit_file_offset, application_name, 
                affected_rows, additional_information, action_id
            FROM sys.fn_get_audit_file ('$AuditFile',default,default);"  -ErrorAction Stop


        $AuditFile.LastWriteTime = $NewDate 
        $AuditFileLastWrite = $AuditFile.LastWriteTime
        write-host "$AuditFile last write time is $AuditFileLastWrite"}

        }

    }
catch
    {
         
        Write-Output   "$ErrorDate -  AuditImportArchiveData ran into an issue: $($PSItem.ToString())" | Out-File $ErrorLog -Append
    
    }