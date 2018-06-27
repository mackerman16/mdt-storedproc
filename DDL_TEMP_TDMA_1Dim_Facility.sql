USE [xAnalytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Dim_Facility]    Script Date: 6/27/2018 11:22:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Dim_Facility](
	[Facility_VID] [bigint] NOT NULL,
	[Facility_FromDate] [datetime2](6) NOT NULL,
	[Facility_ToDate] [datetime2](6) NOT NULL,
	[Facility_OID] [bigint] NOT NULL,
	[FacilityId] [int] NULL,
	[FacilityTypeId] [int] NULL,
	[FacilityType] [varchar](50) NULL,
	[FacilityClass] [int] NULL,
	[FaciltyType_SYS_SourceDB] [varchar](50) NULL,
	[FacilityType_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[FacilityName] [varchar](50) NULL,
	[Street] [varchar](60) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[Phone] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[Active] [int] NULL,
	[Street2] [varchar](120) NULL,
	[ExternalID] [varchar](100) NULL,
	[Abbreviation] [varchar](50) NULL,
	[EmailAddress] [varchar](4000) NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[OBSOLETE__INDICATION] [int] NOT NULL,
	[Facility_RUNNO_INSERT] [int] NOT NULL,
	[Facility_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_Facility_VID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Dim_Facility] PRIMARY KEY CLUSTERED 
(
	[Facility_VID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
