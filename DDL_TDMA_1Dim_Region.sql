USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_Region]    Script Date: 6/27/2018 11:11:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_Region](
      [Region_VID] [bigint] NOT NULL,
      [Region_FromDate] [datetime2](6) NOT NULL,
      [Region_ToDate] [datetime2](6) NOT NULL,
      [Region_OID] [bigint] NOT NULL,
      [RegionID] [int] NULL,
      [RegionName] [varchar](50) NULL,
      [Description_01] [varchar](1000) NULL,
      [Active] [int] NULL,
      [SYS_SourceDB] [varchar](50) NOT NULL,
      [SYS_ETL_Timestamp] [datetime2](3) NULL,
      [OBSOLETE__INDICATION] [int] NOT NULL,
      [Region_RUNNO_INSERT] [int] NOT NULL,
      [Region_RUNNO_UPDATE] [int] NOT NULL,
      [SYS_SourceDB_Region_VID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Dim_Region] PRIMARY KEY CLUSTERED 
(
      [Region_VID] ASC,
      [SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
