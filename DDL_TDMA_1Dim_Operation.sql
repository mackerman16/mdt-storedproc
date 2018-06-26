USE [xAnalytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_Operation]    Script Date: 6/26/2018 11:06:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_Operation](
	[Operation_OID] [bigint] NOT NULL,
	[OperationID] [int] NULL,
	[OperationKey] [varchar](10) NULL,
	[OperationName] [varchar](75) NULL,
	[OperationDescription] [varchar](150) NULL,
	[ParentKey] [varchar](10) NULL,
	[Restricted] [int] NULL,
	[ApplicationID] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[Operation_RUNNO_INSERT] [int] NOT NULL,
	[Operation_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_Operation_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Dim_Operation] PRIMARY KEY CLUSTERED 
(
	[Operation_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
