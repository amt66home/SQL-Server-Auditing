/*
	Creates the AuditData table which all the audit data will be imported into from the audit log files.
	Install this in the Master database.  
	Not using a replicated database so it is fit for purpose 	on an always on or instances with replication/mirroring/logshipping configured.
*/

USE [master]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AuditData](
	[event_time] [datetime2](7) NOT NULL,
	[sequence_number] [int] NOT NULL,
	[action_id] [varchar](4) NULL,
	[succeeded] [bit] NOT NULL,
	[permission_bitmask] [varbinary](16) NOT NULL,
	[is_column_permission] [bit] NOT NULL,
	[session_id] [smallint] NOT NULL,
	[server_principal_id] [int] NOT NULL,
	[database_principal_id] [int] NOT NULL,
	[target_server_principal_id] [int] NOT NULL,
	[target_database_principal_id] [int] NOT NULL,
	[object_id] [int] NOT NULL,
	[class_type] [varchar](2) NULL,
	[session_server_principal_name] [nvarchar](128) NULL,
	[server_principal_name] [nvarchar](128) NULL,
	[server_principal_sid] [varbinary](85) NULL,
	[database_principal_name] [nvarchar](128) NULL,
	[target_server_principal_name] [nvarchar](128) NULL,
	[target_server_principal_sid] [varbinary](85) NULL,
	[target_database_principal_name] [nvarchar](128) NULL,
	[server_instance_name] [nvarchar](128) NULL,
	[database_name] [nvarchar](128) NULL,
	[schema_name] [nvarchar](128) NULL,
	[object_name] [nvarchar](128) NULL,
	[statement] [nvarchar](4000) NULL,
	[additional_information] [nvarchar](4000) NULL,
	[file_name] [nvarchar](260) NOT NULL,
	[audit_file_offset] [bigint] NOT NULL,
	[user_defined_event_id] [smallint] NOT NULL,
	[user_defined_information] [nvarchar](4000) NULL,
	[audit_schema_version] [int] NOT NULL,
	[sequence_group_id] [varbinary](85) NULL,
	[transaction_id] [bigint] NOT NULL,
	[client_ip] [nvarchar](128) NULL,
	[application_name] [nvarchar](128) NULL,
	[duration_milliseconds] [bigint] NOT NULL,
	[response_rows] [bigint] NOT NULL,
	[affected_rows] [bigint] NOT NULL,
	[connection_id] [uniqueidentifier] NULL,
	[data_sensitivity_information] [nvarchar](4000) NULL,
	[host_name] [nvarchar](128) NULL
) ON [PRIMARY]
GO


