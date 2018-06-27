USE [Analytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Fct_MemberEnrollment]    Script Date: 6/26/2018 11:57:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Fct_MemberEnrollment](
	[TR_ID] [bigint] NOT NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[ActionDate_Date_OID] [bigint] NULL,
	[EnrollmentID] [int] NULL,
	[ActionID] [int] NULL,
	[ActionDate] [datetime2](3) NULL,
	[AddedBySystemUserId] [int] NULL,
	[AddedOn] [datetime2](3) NULL,
	[GIGO_Flag] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[InactiveReasonId] [int] NULL,
	[InactiveReason] [varchar](50) NULL,
	[InaSYS_SourceDB] [varchar](50) NULL,
	[InaSYS_ETL_Timestamp] [datetime2](3) NULL,
	[MemberId] [int] NULL,
	[MemberEnrollment_RUNNO_INSERT] [int] NOT NULL,
	[SYS_SourceDB_TR_ID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Fct_MemberEnrollment] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
