/*
	Creates the Server Audit for auditing the SQL Agent Jobs.
	Must be installed in the Master database.
*/

USE [master]
GO

CREATE SERVER AUDIT [AuditSQLAgentJobs]
TO APPLICATION_LOG
WITH
(	QUEUE_DELAY = 1000
	,ON_FAILURE = CONTINUE
	
)
ALTER SERVER AUDIT [AuditSQLAgentJobs] WITH (STATE = ON)
GO


