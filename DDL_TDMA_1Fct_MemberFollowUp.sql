USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Fct_MemberFollowUp]    Script Date: 6/26/2018 11:22:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Fct_MemberFollowUp](
	[TR_ID] [bigint] NOT NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[DueDate_Date_OID] [bigint] NULL,
	[FK_FK_Path2Instance_OID] [bigint] NOT NULL,
	[FK_FK_Path2Instance_VID] [bigint] NOT NULL,
	[FollowUpTypeId] [int] NULL,
	[FollowUpType] [varchar](50) NULL,
	[FollowUpType_SYS_SourceDB] [varchar](50) NULL,
	[FollowUpType_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[OwnerId] [int] NULL,
	[DueDate] [datetime2](3) NULL,
	[Priority] [int] NULL,
	[Complete] [int] NULL,
	[LastUpdated] [datetime2](3) NULL,
	[SystemUserId] [int] NULL,
	[GIGO_Flag] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[MemberFollowUpId] [int] NULL,
	[Path2PathwayFollowUp_PathwayInstanceId] [int] NULL,
	[Path2PathwayFollowUp_PathwayInstanceFlag] [varchar](1) NULL,
	[MemberId] [int] NULL,
	[MemberFollowUp_RUNNO_INSERT] [int] NOT NULL,
	[SYS_SourceDB_TR_ID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Fct_MemberFollowUp] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
