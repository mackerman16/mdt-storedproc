USE [Analytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Dim_Path2InstanceTriggers]    Script Date: 6/26/2018 11:37:20 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Dim_Path2InstanceTriggers](
	[Path2InstanceTriggers_OID] [bigint] NOT NULL,
	[Path2TriggerId] [int] NULL,
	[PathwayInstanceId] [int] NULL,
	[TriggerRuleId] [int] NULL,
	[DisplayText] [varchar](500) NULL,
	[RuleLevel] [int] NULL,
	[GIGO_Flag] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[Path2InstanceTriggers_RUNNO_INSERT] [int] NOT NULL,
	[Path2InstanceTriggers_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_Path2InstanceTriggers_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Dim_Path2InstanceTriggers] PRIMARY KEY CLUSTERED 
(
	[Path2InstanceTriggers_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
