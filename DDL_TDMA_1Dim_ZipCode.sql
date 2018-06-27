USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_ZipCode]    Script Date: 6/26/2018 11:15:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_ZipCode](
	[ZipCode_OID] [bigint] NOT NULL,
	[RowID] [int] NULL,
	[ZIP_CODE] [varchar](255) NULL,
	[STATE] [varchar](255) NULL,
	[AREA_CODE] [varchar](255) NULL,
	[TIME_ZONE] [int] NULL,
	[DAY_LIGHT_SAVING] [int] NULL,
	[GMT_DST] [datetime2](3) NULL,
	[TimeZoneId] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[ZipCode_RUNNO_INSERT] [int] NOT NULL,
	[ZipCode_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_ZipCode_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Dim_ZipCode] PRIMARY KEY CLUSTERED 
(
	[ZipCode_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
