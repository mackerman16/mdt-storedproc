USE [xAnalytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_Relationship]    Script Date: 6/26/2018 11:11:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_Relationship](
	[Relationship_VID] [bigint] NOT NULL,
	[Relationship_FromDate] [datetime2](6) NOT NULL,
	[Relationship_ToDate] [datetime2](6) NOT NULL,
	[Relationship_OID] [bigint] NOT NULL,
	[RelationshipId] [int] NULL,
	[RelationshipTypeId] [int] NULL,
	[Title] [varchar](20) NULL,
	[FirstName] [varchar](30) NULL,
	[MiddleName] [varchar](20) NULL,
	[LastName] [varchar](30) NULL,
	[Profession] [varchar](30) NULL,
	[Street] [varchar](60) NULL,
	[Street2] [varchar](60) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[Email] [varchar](60) NULL,
	[FacilityId] [int] NULL,
	[Note] [varchar](1000) NULL,
	[RelatedSystemUserId] [int] NULL,
	[Signature] [varchar](250) NULL,
	[Active] [int] NULL,
	[LastUpdated] [datetime2](3) NULL,
	[SystemUserId] [int] NULL,
	[NPI] [varchar](50) NULL,
	[UserTimeZoneId] [int] NULL,
	[LicenseNo] [varchar](30) NULL,
	[PECOS] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[OBSOLETE__INDICATION] [int] NOT NULL,
	[Relationship_RUNNO_INSERT] [int] NOT NULL,
	[Relationship_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_Relationship_VID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Dim_Relationship] PRIMARY KEY CLUSTERED 
(
	[Relationship_VID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
