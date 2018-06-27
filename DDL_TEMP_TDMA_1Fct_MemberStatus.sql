USE [Analytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Fct_MemberStatus]    Script Date: 6/26/2018 12:01:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Fct_MemberStatus](
	[TR_ID] [bigint] NOT NULL,
	[BeginDate_Date_OID] [bigint] NULL,
	[MemberStatusId] [int] NULL,
	[StatusId] [int] NULL,
	[Status] [varchar](50) NULL,
	[ExcusedAbsence] [int] NULL,
	[Status_SYS_SourceDB] [varchar](50) NULL,
	[Status_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[ICD9Id] [int] NULL,
	[BeginDate] [datetime2](3) NULL,
	[EndDate] [datetime2](3) NULL,
	[LastUpdated] [datetime2](3) NULL,
	[SystemUserId] [int] NULL,
	[IsEstimatedEndDate] [int] NULL,
	[IsInitialEnrollment] [int] NULL,
	[ICDVersion] [int] NULL,
	[GIGO_Flag] [int] NULL,
	[MemberStatus_SYS_SourceDB] [varchar](50) NOT NULL,
	[MemberStatus_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[FacilityId] [int] NULL,
	[FacilityTypeId] [int] NULL,
	[FacilityType] [varchar](50) NULL,
	[FacilityClass] [int] NULL,
	[FacilityType_SYS_SourceDB] [varchar](50) NULL,
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
	[Facility_SYS_SourceDB] [varchar](50) NULL,
	[Facility_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[MemberId] [int] NULL,
	[MemberStatus_RUNNO_INSERT] [int] NOT NULL,
	[MemberStatus_SYS_SourceDB_TR_ID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Fct_MemberStatus] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[MemberStatus_SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
