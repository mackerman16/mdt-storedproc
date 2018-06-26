USE [xAnalytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_ICD9Index]    Script Date: 6/26/2018 11:03:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_ICD9Index](
	[ICD9Index_OID] [bigint] NOT NULL,
	[ICD9IndexID] [int] NULL,
	[ICD9Description] [varchar](255) NULL,
	[Group1] [int] NULL,
	[Group2] [int] NULL,
	[Group3] [int] NULL,
	[StartTxt] [varchar](255) NULL,
	[EndTxt] [varchar](255) NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[ICD9Index_RUNNO_INSERT] [int] NOT NULL,
	[ICD9Index_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_ICD9Index_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Dim_ICD9Index] PRIMARY KEY CLUSTERED 
(
	[ICD9Index_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
