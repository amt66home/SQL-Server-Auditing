USE [msdb]
GO

/****** Object:  ProxyAccount [AuditStatusProxy]    Script Date: 13/05/2020 11:04:21 ******/
EXEC msdb.dbo.sp_add_proxy @proxy_name=N'AuditProxy',@credential_name=N'SQLAudit', 
		@enabled=1
GO

EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'AuditProxy', @subsystem_id=12
GO


