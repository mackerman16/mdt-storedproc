USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Fct_MemberDisease]    Script Date: 6/26/2018 11:19:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Fct_MemberDisease](
	[TR_ID] [bigint] NOT NULL,
	[EnrollmentDate_Date_OID] [bigint] NULL,
	[MemberDiseaseProgramEnrollmentId] [int] NULL,
	[MemberDiseaseProgramId] [int] NULL,
	[DiseaseProgramId] [int] NULL,
	[ProgramName] [varchar](50) NULL,
	[ProgramDescription] [varchar](255) NULL,
	[DP_LastUpdated] [datetime2](3) NULL,
	[DP_SystemUserId] [int] NULL,
	[VAVersion] [varchar](25) NULL,
	[DiseaseProgram_SYS_SourceDB] [varchar](50) NULL,
	[DiseaseProgram_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[Ranking] [int] NULL,
	[MDP_LastUpdated] [datetime2](3) NULL,
	[MDP_SystemUserId] [int] NULL,
	[IncludeOnAssessment] [int] NULL,
	[MDP_GIGO_Flag] [int] NULL,
	[MDP_SYS_SourceDB] [varchar](50) NULL,
	[MDP_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[DisenrollReasonId] [int] NULL,
	[DisenrollReason] [varchar](50) NULL,
	[DisenrollReason_SYS_SourceDB] [varchar](50) NULL,
	[DisenrollReason_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[EnrollmentDate] [datetime2](3) NULL,
	[DisenrollmentDate] [datetime2](3) NULL,
	[MDPE_LastUpdated] [datetime2](3) NULL,
	[MDPE_SystemUserId] [int] NULL,
	[MDPE_GIGO_Flag] [int] NULL,
	[MDPE_SYS_SourceDB] [varchar](50) NOT NULL,
	[MDPE_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[MemberId] [int] NULL,
	[MemberDiseaseProgramEnrollment_RUNNO_INSERT] [int] NOT NULL,
	[MDPE_SYS_SourceDB_TR_ID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Fct_MemberDisease] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[MDPE_SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
