USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Fct_MemberNote]    Script Date: 6/26/2018 11:24:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Fct_MemberNote](
	[TR_ID] [bigint] NOT NULL,
	[NoteDate_Date_OID] [bigint] NULL,
	[MemberNoteId] [int] NULL,
	[NoteDate] [datetime2](3) NULL,
	[IsCommitted] [int] NULL,
	[SystemUserId] [int] NULL,
	[UserEntered] [int] NULL,
	[GIGO_Flag] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[MemberId] [int] NULL,
	[MemberNote_RUNNO_INSERT] [int] NOT NULL,
	[SYS_SourceDB_TR_ID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Fct_MemberNote] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
