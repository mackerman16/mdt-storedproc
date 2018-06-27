USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Fct_AlertLog]    Script Date: 6/26/2018 11:15:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Fct_AlertLog](
	[TR_ID] [bigint] NOT NULL,
	[AlertDate_Date_OID] [bigint] NULL,
	[FK1_FK_Path2Instance_OID] [bigint] NOT NULL,
	[FK1_FK_Path2Instance_VID] [bigint] NOT NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[AlertLogId] [int] NULL,
	[AlertDate] [datetime2](3) NULL,
	[AlertType] [bigint] NULL,
	[DeviceLogId] [int] NULL,
	[VerifyAttempts] [int] NULL,
	[Verified] [datetime2](3) NULL,
	[VerifiedBy] [int] NULL,
	[Referred] [int] NULL,
	[ReferredBy] [int] NULL,
	[GIGO_Flag] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[P2IFR_AlertLogId] [int] NULL,
	[P2IFR_PathwayInstanceId] [int] NULL,
	[P2IFR_PathwayInstanceFlag] [varchar](1) NULL,
	[P2IFR_SYS_SourceDB] [varchar](50) NULL,
	[P2IFR_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[P2FRALM_AlertLogId] [int] NULL,
	[P2FRALM_MemberId] [int] NULL,
	[P2FRALM_TransmissionTime] [datetime2](3) NULL,
	[P2FRALM_ProcessTime] [datetime2](3) NULL,
	[P2FRALM_ProcessStatus] [varchar](10) NULL,
	[P2FRALM_GIGO_Flag] [int] NULL,
	[P2FRALM_SYS_SourceDB] [varchar](50) NULL,
	[P2FRALM_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[MemberId] [int] NULL,
	[AlertLog_RUNNO_INSERT] [int] NOT NULL,
	[SYS_SourceDB_TR_ID] [varchar](75) NULL,
 CONSTRAINT [PK_TDMA_1Fct_AlertLog] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
