USE [xAnalytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Dim_ICDCodeGrouping]    Script Date: 6/26/2018 11:33:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Dim_ICDCodeGrouping](
	[ICDCodeGrouping_OID] [bigint] NOT NULL,
	[ICDCodeGroupingId] [int] NULL,
	[GroupingName] [varchar](255) NULL,
	[GroupingDescription] [varchar](255) NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[ICDCodeGrouping_RUNNO_INSERT] [int] NOT NULL,
	[ICDCodeGrouping_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_ICDCodeGrouping_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Dim_ICDCodeGrouping] PRIMARY KEY CLUSTERED 
(
	[ICDCodeGrouping_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
