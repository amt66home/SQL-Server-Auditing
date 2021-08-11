/*
	Creates the TrackAllLogins server audit specification.
	Needs to be installed in the master database.
	Dependency:  TrackLogins audit
*/

USE [master]
GO

CREATE SERVER AUDIT SPECIFICATION [TrackAllLogins]
FOR SERVER AUDIT [TrackLogins]
ADD (AUDIT_CHANGE_GROUP),
ADD (FAILED_LOGIN_GROUP),
ADD (SUCCESSFUL_LOGIN_GROUP)
WITH (STATE = ON)
GO


