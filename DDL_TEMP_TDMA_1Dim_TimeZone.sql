USE [xAnalytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Dim_TimeZone]    Script Date: 6/26/2018 11:39:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Dim_TimeZone](
	[TimeZone_OID] [bigint] NOT NULL,
	[TimeZoneId] [int] NULL,
	[TimeZone] [varchar](50) NULL,
	[ShortText] [varchar](50) NULL,
	[MicrosoftTimeZoneId] [varchar](256) NULL,
	[UTCOffsetInMinutes] [int] NULL,
	[DST] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[TimeZone_RUNNO_INSERT] [int] NOT NULL,
	[TimeZone_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_TimeZone_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Dim_TimeZone] PRIMARY KEY CLUSTERED 
(
	[TimeZone_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
