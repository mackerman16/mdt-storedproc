USE [xAnalytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Fct_MemberFacility]    Script Date: 6/26/2018 11:57:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Fct_MemberFacility](
	[TR_ID] [bigint] NOT NULL,
	[StartDate_Date_OID] [bigint] NULL,
	[MemberFacilityId] [int] NULL,
	[PrimaryFacility] [int] NULL,
	[Notes] [varchar](255) NULL,
	[LastUpdated] [datetime2](3) NULL,
	[SystemUserId] [int] NULL,
	[StartDate] [datetime2](3) NULL,
	[EndDate] [datetime2](3) NULL,
	[Active] [int] NULL,
	[GIGO_Flag] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[FacilityId] [int] NULL,
	[FacilityTypeId] [int] NULL,
	[FacilityType] [varchar](50) NULL,
	[FacilityClass] [int] NULL,
	[FacFacSYS_SourceDB] [varchar](50) NULL,
	[FacFacSYS_ETL_Timestamp] [datetime2](3) NULL,
	[FacilityName] [varchar](50) NULL,
	[Street] [varchar](60) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[Phone] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[FacActive] [int] NULL,
	[Street2_01] [varchar](120) NULL,
	[ExternalID] [varchar](100) NULL,
	[Abbreviation] [varchar](50) NULL,
	[EmailAddress] [varchar](4000) NULL,
	[FacSYS_SourceDB] [varchar](50) NULL,
	[FacSYS_ETL_Timestamp] [datetime2](3) NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[MemberId] [int] NULL,
	[MemberFacility_RUNNO_INSERT] [int] NOT NULL,
	[SYS_SourceDB_TR_ID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Fct_MemberFacility] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
