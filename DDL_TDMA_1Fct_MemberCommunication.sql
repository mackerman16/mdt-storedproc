USE [xAnalytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Fct_MemberCommunication]    Script Date: 6/26/2018 11:19:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Fct_MemberCommunication](
	[TR_ID] [bigint] NOT NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[Relationship_OID] [bigint] NOT NULL,
	[Relationship_VID] [bigint] NOT NULL,
	[CommunicationDate_Date_OID] [bigint] NULL,
	[FK_FK_Path2Instance_OID] [bigint] NOT NULL,
	[FK_FK_Path2Instance_VID] [bigint] NOT NULL,
	[MemberCommunicationId] [int] NULL,
	[CommunicationTypeId] [int] NULL,
	[CommunicationTypeDesc] [varchar](50) NULL,
	[CommType_SYS_SourceDB] [varchar](50) NULL,
	[CommType_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[CommunicationReasonId] [int] NULL,
	[CommunicationReasonDesc] [varchar](50) NULL,
	[Verify] [int] NULL,
	[IsPathway] [int] NULL,
	[CommReason_SYS_SourceDB] [varchar](50) NULL,
	[CommReason_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[CommunicationResultId] [int] NULL,
	[CommunicationResultDesc] [varchar](50) NULL,
	[Contacted] [int] NULL,
	[CommResult_CommunicationTypeID] [int] NULL,
	[Enabled] [int] NULL,
	[CourtesyCallReport] [int] NULL,
	[LeftMessage] [int] NULL,
	[NoAnswer] [int] NULL,
	[NotAvailable] [int] NULL,
	[Busy] [int] NULL,
	[CommResult_SYS_SourceDB] [varchar](50) NULL,
	[CommResult_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[CommunicationDate] [datetime2](3) NULL,
	[LastUpdated] [datetime2](3) NULL,
	[SystemUserId] [int] NULL,
	[MemberNoteId] [int] NULL,
	[GIGO_Flag] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[PathwayInstanceId] [int] NULL,
	[PathwayInstanceFlag] [varchar](1) NULL,
	[MemberId] [int] NULL,
	[MemberCommunication_RUNNO_INSERT] [int] NOT NULL,
	[SYS_SourceDB_TR_ID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Fct_MemberCommunication] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
