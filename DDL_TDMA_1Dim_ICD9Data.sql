USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_ICD9Data]    Script Date: 6/26/2018 11:03:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_ICD9Data](
	[ICD9Data_OID] [bigint] NOT NULL,
	[ICD9ID] [numeric](38, 12) NULL,
	[Code] [varchar](255) NULL,
	[ICD9Description] [varchar](255) NULL,
	[Group1] [int] NULL,
	[Group2] [int] NULL,
	[Group3] [int] NULL,
	[Display] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[ICD9Data_RUNNO_INSERT] [int] NOT NULL,
	[ICD9Data_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_ICD9Data_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Dim_ICD9Data] PRIMARY KEY CLUSTERED 
(
	[ICD9Data_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
