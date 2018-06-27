USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_Date]    Script Date: 6/21/2018 4:08:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_Date](
	[Date_OID] [bigint] NOT NULL,
	[DATE] [date] NULL,
	[DATE_YYYY_MM_DD] [varchar](10) NULL,
	[DATE_YYYYMMDD] [varchar](8) NULL,
	[YEAR] [int] NULL,
	[YEAR_STR] [varchar](5) NULL,
	[YEAR_STR2] [varchar](2) NULL,
	[MONTH] [int] NULL,
	[MONTH_STR2] [varchar](2) NULL,
	[MONTH_NAME] [varchar](12) NULL,
	[MONTH_NAME3] [varchar](3) NULL,
	[DAY_IN_MONTH] [int] NULL,
	[DAY_IN_MONTH_STR2] [varchar](2) NULL,
	[DAY_IN_YEAR] [int] NULL,
	[DAY_IN_WEEK] [int] NULL,
	[DAY_IN_WEEK_NAME] [varchar](10) NULL,
	[DAY_IN_WEEK_STR3] [varchar](3) NULL,
	[QTR] [int] NULL,
	[YYYYQQ] [varchar](6) NULL,
	[YYQQ] [varchar](4) NULL,
	[WEEK_IN_YEAR] [int] NULL,
	[Date_RUNNO_INSERT] [int] NOT NULL,
	[Date_RUNNO_UPDATE] [int] NOT NULL,
 CONSTRAINT [PK_TDMA_1Dim_Date] PRIMARY KEY CLUSTERED 
(
	[Date_OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
