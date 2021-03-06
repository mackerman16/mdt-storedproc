USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Fct_C_FlexHealthCheckResponse]    Script Date: 6/26/2018 11:18:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Fct_C_FlexHealthCheckResponse](
	[TR_ID] [bigint] NOT NULL,
	[TransmitDate_Date_OID] [bigint] NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[C_FlexMemberHealthCheckItem_OID] [bigint] NOT NULL,
	[C_FlexMemberHealthCheckItem_VID] [bigint] NOT NULL,
	[FlexHealthCheckResponseId] [int] NULL,
	[AnswerIndex] [int] NULL,
	[DeviceLogId] [int] NULL,
	[TransmitDate] [datetime2](3) NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[MemberId] [int] NULL,
	[C_FlexHealthCheckResponse_RUNNO_INSERT] [int] NOT NULL,
	[SYS_SourceDB_TR_ID] [varchar](75) NULL,
 CONSTRAINT [PK_TDMA_1Fct_C_FlexHealthCheckResponse] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
