USE [xAnalytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Dim_DevicePeripheral]    Script Date: 6/26/2018 11:29:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Dim_DevicePeripheral](
	[DevicePeripheral_OID] [bigint] NOT NULL,
	[DevicePeripheralId] [int] NULL,
	[PeripheralName] [varchar](50) NULL,
	[PeripheralDisplayName] [varchar](260) NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[DevicePeripheral_RUNNO_INSERT] [int] NOT NULL,
	[DevicePeripheral_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_DevicePeripheral_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Dim_DevicePeripheral] PRIMARY KEY CLUSTERED 
(
	[DevicePeripheral_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
