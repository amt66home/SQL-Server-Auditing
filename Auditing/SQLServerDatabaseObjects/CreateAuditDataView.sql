/*
	Strips out uneccessary columns to give a cleaner view of the data.
	Install this in the Master database.  
	Not using a replicated database so it is fit for purpose 	on an always on or instances with replication/mirroring/logshipping configured.
*/

USE [master]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[uvw_AuditData]
AS

/*
 You need to add an hour to the time because it is UTC
 Action ID:
 LGIS = LOGIN SUCCEEDED
 LGIF = LOGIN FAILURE

 */

SELECT event_time, action_id, succeeded, server_principal_name, server_instance_name, database_name, client_ip, application_name, host_name, statement, additional_information
FROM auditdata
GO


