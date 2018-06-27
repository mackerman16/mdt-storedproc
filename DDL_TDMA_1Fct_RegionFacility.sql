USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Fct_RegionFacility]    Script Date: 6/27/2018 11:01:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Fct_RegionFacility](
      [TR_ID] [bigint] NOT NULL,
      [Region_OID] [bigint] NOT NULL,
      [Region_VID] [bigint] NOT NULL,
      [Facility_OID] [bigint] NOT NULL,
      [Facility_VID] [bigint] NOT NULL,
      [LastUpdated_Date_OID] [bigint] NULL,
      [RegionGroupID] [int] NULL,
      [SYS_SourceDB] [varchar](50) NOT NULL,
      [SYS_ETL_Timestamp] [datetime2](3) NULL,
      [LastUpdated] [datetime2](3) NULL,
      [RegionFacility_RUNNO_INSERT] [int] NOT NULL,
      [SYS_SourceDB_TR_ID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Fct_RegionFacility] PRIMARY KEY CLUSTERED 
(
      [TR_ID] ASC,
      [SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
