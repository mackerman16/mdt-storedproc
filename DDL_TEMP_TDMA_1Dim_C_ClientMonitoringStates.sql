USE [xAnalytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Dim_C_ClientMonitoringStates]    Script Date: 6/26/2018 11:29:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Dim_C_ClientMonitoringStates](
	[C_ClientMonitoringStates_OID] [bigint] NOT NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[StateCode] [varchar](2) NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[C_ClientMonitoringStates_RUNNO_INSERT] [int] NOT NULL,
	[C_ClientMonitoringStates_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_C_ClientMonitoringStates_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Dim_C_ClientMonitoringStates] PRIMARY KEY CLUSTERED 
(
	[C_ClientMonitoringStates_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
