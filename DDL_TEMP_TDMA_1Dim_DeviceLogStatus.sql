USE [Analytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Dim_DeviceLogStatus]    Script Date: 6/26/2018 11:29:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Dim_DeviceLogStatus](
	[DeviceLogStatus_OID] [bigint] NOT NULL,
	[DeviceLogStatusId] [int] NULL,
	[DeviceLogMask] [int] NULL,
	[DeviceLogStatus] [varchar](50) NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[DeviceLogStatus_RUNNO_INSERT] [int] NOT NULL,
	[DeviceLogStatus_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_DeviceLogStatus_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Dim_DeviceLogStatus] PRIMARY KEY CLUSTERED 
(
	[DeviceLogStatus_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
