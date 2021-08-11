/*
	Creates the database audit specification that audits the SQL Agent Jobs.
	Will audit changes to agent jobs or if any agent job is deleted.
	Needs to be installed in the MSDB database.
*/

USE [msdb]
GO

CREATE DATABASE AUDIT SPECIFICATION [AuditAgentJobStatus]
FOR SERVER AUDIT [AuditSQLAgentJobs]
ADD (EXECUTE ON OBJECT::[dbo].[sp_update_job] BY [public]),
ADD (EXECUTE ON OBJECT::[dbo].[sp_agent_delete_job] BY [public])
WITH (STATE = ON)
GO


