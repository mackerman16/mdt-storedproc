USE [Analytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Fct_AssessmentTransmitLog]    Script Date: 6/26/2018 11:52:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Fct_AssessmentTransmitLog](
	[TR_ID] [bigint] NOT NULL,
	[TransmitDate_Date_OID] [bigint] NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[FlexHealthCheckGroup_OID] [bigint] NOT NULL,
	[FlexHealthCheckGroup_VID] [bigint] NOT NULL,
	[AssessmentTransmitLogId] [int] NULL,
	[DeviceLogId] [int] NULL,
	[TransmitDate] [datetime2](3) NULL,
	[AnswerString] [varchar](120) NULL,
	[QuestionMask] [varchar](29) NULL,
	[DeviceTypeId] [int] NULL,
	[transmitScore] [int] NULL,
	[ComplianceScore] [int] NULL,
	[MemberScore] [int] NULL,
	[MemberScoreTotal] [int] NULL,
	[MissedDays] [int] NULL,
	[Acute] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[AssessmentId] [int] NULL,
	[Assessment_DeviceTypeId] [int] NULL,
	[DiseaseProgramID] [int] NULL,
	[MaxDays] [int] NULL,
	[Obsolete] [int] NULL,
	[AssessmentTypeId] [int] NULL,
	[AssessmentName] [varchar](50) NULL,
	[Assessment_SYS_SourceDB] [varchar](50) NULL,
	[Assessment_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[GIGO_Flag] [int] NULL,
	[MemberId] [int] NULL,
	[AssessmentTransmitLog_RUNNO_INSERT] [int] NOT NULL,
	[SYS_SourceDB_TR_ID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TEMP_AssessmentTransmitLog] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
