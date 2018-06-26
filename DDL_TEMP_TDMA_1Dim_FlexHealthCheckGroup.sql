USE [xAnalytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Dim_FlexHealthCheckGroup]    Script Date: 6/26/2018 11:31:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Dim_FlexHealthCheckGroup](
	[FlexHealthCheckGroup_VID] [bigint] NOT NULL,
	[FlexHealthCheckGroup_FromDate] [datetime2](6) NOT NULL,
	[FlexHealthCheckGroup_ToDate] [datetime2](6) NOT NULL,
	[FlexHealthCheckGroup_OID] [bigint] NOT NULL,
	[FHCG_FlexHealthCheckGroupId] [int] NULL,
	[FHCG_FlexHealthCheckGroupHash] [varchar](64) NULL,
	[FHCG_InsertDate] [datetime2](3) NULL,
	[FHCG_SYS_SourceDB] [varchar](50) NOT NULL,
	[FHCG_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[FTHC_FlexTemplateHealthCheckId] [int] NULL,
	[FC_FlexComorbidityId] [int] NULL,
	[FC_FlexComorbidityName] [varchar](256) NULL,
	[FC_FlexComorbidityAbbrev] [varchar](256) NULL,
	[FC_SYS_SourceDB] [varchar](50) NULL,
	[FC_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[SMT_SnippetMessagingTypeId] [int] NULL,
	[SMT_DisplayName] [varchar](250) NULL,
	[SMT_Description] [varchar](250) NULL,
	[SMT_SYS_SourceDB] [varchar](50) NULL,
	[SMT_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[FTHC_FlexTemplateHealthCheckName] [varchar](50) NULL,
	[FTHC_FlexTemplateHealthCheckDescription] [varchar](50) NULL,
	[FTHC_DaysInRotation] [int] NULL,
	[FTHC_RestartRotationOnDay] [int] NULL,
	[FTHC_IsSystem] [int] NULL,
	[FTHC_FlexTemplateTypeId] [int] NULL,
	[FTHC_InsertedDate] [datetime2](3) NULL,
	[FTHC_InsertedBySystemUserId] [int] NULL,
	[FTHC_IsActive] [int] NULL,
	[FTHC_IsSnippet] [int] NULL,
	[FTHC_DiseaseProgramId] [int] NULL,
	[FTHC_SnippetId] [int] NULL,
	[FTHC_ObsoleteTemplateMediaVersion] [int] NULL,
	[FTHC_DevicePeripheralId] [int] NULL,
	[FTHC_EnableConfigureSchedule] [int] NULL,
	[FTHC_SYS_SourceDB] [varchar](50) NULL,
	[FTHC_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[OBSOLETE__INDICATION] [int] NOT NULL,
	[FlexHealthCheckGroup_RUNNO_INSERT] [int] NOT NULL,
	[FlexHealthCheckGroup_RUNNO_UPDATE] [int] NOT NULL,
	[FHCG_SYS_SourceDB_FlexHealthCheckGroup_VID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Dim_FlexHealthCheckGroup] PRIMARY KEY CLUSTERED 
(
	[FlexHealthCheckGroup_VID] ASC,
	[FHCG_SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
