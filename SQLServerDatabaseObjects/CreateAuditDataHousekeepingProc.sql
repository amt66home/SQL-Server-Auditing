/*
	Deletes data past retention from the AuditData table. 
*/

USE [master]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_AuditDataHousekeeping]
@Retention int = 180
AS

BEGIN TRAN
DELETE from AuditData
where event_time < GETDATE()-@Retention
COMMIT



GO


