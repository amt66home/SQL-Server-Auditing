/*
 For auditing audit data tampering
 Must be created in the database which hosts the AuditData table
 */

USE [master]
GO

CREATE DATABASE AUDIT SPECIFICATION [DataChangeAudit]
FOR SERVER AUDIT [AuditDataAudit]
ADD (DELETE ON OBJECT::[dbo].[AuditData] BY [public]),
ADD (UPDATE ON OBJECT::[dbo].[AuditData] BY [public])
WITH (STATE = ON)
GO


