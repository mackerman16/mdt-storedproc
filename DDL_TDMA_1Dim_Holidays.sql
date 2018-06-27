USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_Holidays]    Script Date: 6/26/2018 11:03:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_Holidays](
	[Holidays_OID] [bigint] NOT NULL,
	[HolidayID] [int] NULL,
	[HolidayDate] [datetime2](3) NULL,
	[HolidayDescription] [varchar](50) NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[Holidays_RUNNO_INSERT] [int] NOT NULL,
	[Holidays_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_Holidays_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Dim_Holidays] PRIMARY KEY CLUSTERED 
(
	[Holidays_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
