USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_Alert_AlertCategory_AlertRule]    Script Date: 6/26/2018 10:53:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_Alert_AlertCategory_AlertRule](
	[Alert_VID] [bigint] NOT NULL,
	[Alert_FromDate] [datetime2](6) NOT NULL,
	[Alert_ToDate] [datetime2](6) NOT NULL,
	[Alert_OID] [bigint] NOT NULL,
	[AlertId] [bigint] NULL,
	[AlertCategoryId] [int] NULL,
	[AlertCategory] [varchar](50) NULL,
	[AlertCategory_LastUpdated] [datetime2](3) NULL,
	[AlertCategory_SystemUserId] [int] NULL,
	[AlertCategory_SYS_SourceDB] [varchar](50) NULL,
	[AlertCategory_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[AlertName] [varchar](50) NULL,
	[AlertDescription] [varchar](200) NULL,
	[AlertImageFilename] [varchar](100) NULL,
	[Alert_LastUpdated] [datetime2](3) NULL,
	[Alert_SystemUserId] [int] NULL,
	[Alert_SYS_SourceDB] [varchar](50) NOT NULL,
	[Alert_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[AlertRuleMappingId] [int] NULL,
	[AlertRuleId] [int] NULL,
	[AlertRule_RuleDescription] [varchar](200) NULL,
	[AlertRule_RuleLogic] [varchar](2000) NULL,
	[AlertRule_LastUpdated] [datetime2](3) NULL,
	[AlertRule_SystemUserId] [int] NULL,
	[AlertRule_SYS_SourceDB] [varchar](50) NULL,
	[AlertRule_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[AlertRuleMapping_LastUpdated] [datetime2](3) NULL,
	[AlertRuleMapping_SystemUserId] [int] NULL,
	[AlertRuleMapping_SYS_SourceDB] [varchar](50) NULL,
	[AlertRuleMapping_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[OBSOLETE__INDICATION] [int] NOT NULL,
	[Alert_RUNNO_INSERT] [int] NOT NULL,
	[Alert_RUNNO_UPDATE] [int] NOT NULL,
	[Alert_SYS_SourceDB_Alert_VID] [varchar](75) NULL,
 CONSTRAINT [PK_TDMA_1Dim_Alert_AlertCategory_AlertRule] PRIMARY KEY CLUSTERED 
(
	[Alert_VID] ASC,
	[Alert_SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


