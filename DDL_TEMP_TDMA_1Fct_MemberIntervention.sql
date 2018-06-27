USE [Analytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Fct_MemberIntervention]    Script Date: 6/26/2018 11:59:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Fct_MemberIntervention](
	[TR_ID] [bigint] NOT NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[Relationship_OID] [bigint] NOT NULL,
	[Relationship_VID] [bigint] NOT NULL,
	[InterventionDate_Date_OID] [bigint] NULL,
	[FK_FK_Path2Instance_OID] [bigint] NOT NULL,
	[FK_FK_Path2Instance_VID] [bigint] NOT NULL,
	[MemberInterventionId] [int] NULL,
	[InterventionTypeId] [int] NULL,
	[InterventionTypeDesc] [varchar](50) NULL,
	[InterventionTypeClass] [varchar](50) NULL,
	[InterventionActionId] [int] NULL,
	[InterventionActionDesc] [varchar](50) NULL,
	[InterventionActionClass] [varchar](50) NULL,
	[InterventionResultId] [int] NULL,
	[InterventionResultDesc] [varchar](50) NULL,
	[InterventionResultClass] [varchar](50) NULL,
	[AlertLogId] [int] NULL,
	[InterventionDate] [datetime2](3) NULL,
	[Complete] [int] NULL,
	[Severity] [int] NULL,
	[FacilityId] [int] NULL,
	[LastUpdated] [datetime2](3) NULL,
	[SystemUserId] [int] NULL,
	[GIGO_Flag] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[PathwayInstanceId] [int] NULL,
	[P2PI_SYS_SourceDB] [varchar](50) NULL,
	[P2PI_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[PathwayInstanceFlag] [varchar](1) NULL,
	[Member_Id] [int] NULL,
	[MemberIntervention_RUNNO_INSERT] [int] NOT NULL,
	[SYS_SourceDB_TR_ID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Fct_MemberIntervention] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
