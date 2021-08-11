/*
	Creates the audit data server audit for auditing changes to imported audit data.
	Needs to be installed in the Master database.
*/

USE [master]
GO

/****** Object:  Audit [AuditDataAudit]    Script Date: 29/05/2020 09:34:54 ******/
CREATE SERVER AUDIT [AuditDataAudit]
TO FILE 
(	FILEPATH = N'C:\Audit\AuditFiles\'
	,MAXSIZE = 2 MB
	,MAX_FILES = 3
	,RESERVE_DISK_SPACE = OFF
)
WITH
(	QUEUE_DELAY = 1000
	,ON_FAILURE = CONTINUE
	
)
ALTER SERVER AUDIT [AuditDataAudit] WITH (STATE = ON)
GO


