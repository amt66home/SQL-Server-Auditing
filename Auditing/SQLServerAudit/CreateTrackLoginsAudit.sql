/*
	Creates the track logins server audit.
	Needs to be installed in the Master database.
	The path for the audit files will need to set to whatever your path is and you will need to set the 
	maxsize and max_files.
	Recommend you do not change the on_failure setting unless specifically required to otherwise you can have unplanned outages
	if anything goes wrong with the auditing.
*/

USE [master]
GO

/****** Object:  Audit [TrackLogins]    Script Date: 29/05/2020 09:38:00 ******/
CREATE SERVER AUDIT [TrackLogins]
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
ALTER SERVER AUDIT [TrackLogins] WITH (STATE = ON)
GO


