
Param(   
    [Parameter(Mandatory=$false)] [string] $Computername = 'DEV\Instance',
    [Parameter(Mandatory=$false)] [string] $Database = 'Master',
    [Parameter(Mandatory=$false)] [string] $Table = "$database.dbo.AuditData",            # Do not change the table name
    [Parameter(Mandatory=$false)] [string] $AuditFilePath = 'C:\Audit\AuditFiles',  
    [Parameter(Mandatory=$false)] [string] $filter = "*.sqlaudit",
    [Parameter(Mandatory=$false)] [string] $AuditArchivePath = 'C:\Audit\AuditArchive',
    [Parameter(Mandatory=$false)] [string] $ScriptPath = 'C:\Audit\PowerShellScripts',
    [Parameter(Mandatory=$false)] [string] $ImportArchiveDataScript = 'AuditImportArchiveData',
    [Parameter(Mandatory=$false)] [string] $Retention = "-7" ,
    [Parameter(Mandatory=$false)] [string] $ErrorLogPath = "C:\Audit\AuditFiles",
    [Parameter(Mandatory=$false)] [string] $ErrorLogFile = "AuditErrorLog"


    ) 
 
