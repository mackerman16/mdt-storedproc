USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_FlexAnswerType]    Script Date: 6/26/2018 11:01:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_FlexAnswerType](
	[FlexAnswerType_OID] [bigint] NOT NULL,
	[FlexAnswerTypeId] [int] NULL,
	[FlexAnswerTypeMask] [int] NULL,
	[FlexAnswerTypeName] [varchar](50) NULL,
	[IsActive] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[FlexAnswerType_RUNNO_INSERT] [int] NOT NULL,
	[FlexAnswerType_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_FlexAnswerType_OID] [varchar](75) NULL,
 CONSTRAINT [PK_TDMA_1Dim_FlexAnswerType] PRIMARY KEY CLUSTERED 
(
	[FlexAnswerType_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
