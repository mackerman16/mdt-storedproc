USE [Analytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Dim_ICD10Data]    Script Date: 6/26/2018 11:33:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Dim_ICD10Data](
	[ICD10Data_OID] [bigint] NOT NULL,
	[ICD10DataID] [int] NULL,
	[ICD10DataCode] [varchar](255) NULL,
	[ICD10DataDescription] [varchar](255) NULL,
	[ParentID] [int] NULL,
	[IsHeader] [int] NULL,
	[HasNonHeaderChild] [int] NULL,
	[HasHeaderChild] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[ICD10Data_RUNNO_INSERT] [int] NOT NULL,
	[ICD10Data_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_ICD10Data_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Dim_ICD10Data] PRIMARY KEY CLUSTERED 
(
	[ICD10Data_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
