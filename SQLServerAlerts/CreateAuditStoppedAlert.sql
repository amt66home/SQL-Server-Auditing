USE [msdb]
GO

/****** Object:  Alert [AuditStopped]    Script Date: 27/05/2020 14:18:40 ******/
EXEC msdb.dbo.sp_add_alert @name=N'AuditStopped', 
		@message_id=0, 
		@severity=10, 
		@enabled=1, 
		@delay_between_responses=0, 
		@include_event_description_in=1, 
		@event_description_keyword=N'Audit is disabled', 
		@category_name=N'[Uncategorized]'
		GO


