USE [xAnalytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Dim_DeviceType]    Script Date: 6/26/2018 11:31:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Dim_DeviceType](
	[DeviceType_VID] [bigint] NOT NULL,
	[DeviceType_FromDate] [datetime2](6) NOT NULL,
	[DeviceType_ToDate] [datetime2](6) NOT NULL,
	[DeviceType_OID] [bigint] NOT NULL,
	[DeviceKeyID] [int] NULL,
	[DeviceTypeID] [int] NULL,
	[DeviceName] [varchar](50) NULL,
	[MinVer] [numeric](5, 2) NULL,
	[MaxVer] [numeric](5, 2) NULL,
	[FixedBranching] [int] NULL,
	[Assessments] [int] NULL,
	[Weight] [int] NULL,
	[BloodPressure] [int] NULL,
	[Glucose] [int] NULL,
	[PulseOX] [int] NULL,
	[Pulse] [int] NULL,
	[PeakFlow] [int] NULL,
	[Enabled] [int] NULL,
	[SupportedPeripherals] [int] NULL,
	[MaxTwoWayScreens] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[OBSOLETE__INDICATION] [int] NOT NULL,
	[DeviceType_RUNNO_INSERT] [int] NOT NULL,
	[DeviceType_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_DeviceType_VID] [varchar](75) NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Dim_DeviceType] PRIMARY KEY CLUSTERED 
(
	[DeviceType_VID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
