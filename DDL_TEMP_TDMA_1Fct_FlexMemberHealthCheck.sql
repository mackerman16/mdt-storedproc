USE [xAnalytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Fct_FlexMemberHealthCheck]    Script Date: 6/26/2018 11:54:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Fct_FlexMemberHealthCheck](
	[TR_ID] [bigint] NOT NULL,
	[StartDate_Date_OID] [bigint] NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[FlexHealthCheckGroup_OID] [bigint] NOT NULL,
	[FlexHealthCheckGroup_VID] [bigint] NOT NULL,
	[FlexMemberHealthCheckId] [int] NULL,
	[DaysInRotation] [int] NULL,
	[RestartRotationOnDay] [int] NULL,
	[StartDate] [datetime2](3) NULL,
	[AssignedBySystemUserId] [int] NULL,
	[EndDate] [datetime2](3) NULL,
	[EndedBySystemUserId] [int] NULL,
	[IsActive] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[GIGO_Flag] [int] NULL,
	[MemberId] [int] NULL,
	[FlexMemberHealthCheck_RUNNO_INSERT] [int] NOT NULL,
	[SYS_SourceDB_TR_ID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Fct_FlexMemberHealthCheck] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
