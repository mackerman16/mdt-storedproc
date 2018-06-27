USE [Analytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Fct_DeviceRegistration]    Script Date: 6/26/2018 11:54:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Fct_DeviceRegistration](
	[TR_ID] [bigint] NOT NULL,
	[DateAssigned_Date_OID] [bigint] NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[DeviceType_OID] [bigint] NOT NULL,
	[DeviceType_VID] [bigint] NOT NULL,
	[DeviceRegistrationID] [int] NULL,
	[UnitID] [bigint] NULL,
	[DateAssigned] [datetime2](3) NULL,
	[DateUnassigned] [datetime2](3) NULL,
	[UnassignReason] [varchar](50) NULL,
	[UnitVersion] [numeric](5, 2) NULL,
	[LastUpdated] [datetime2](3) NULL,
	[SystemUserID] [int] NULL,
	[MediaVersion] [int] NULL,
	[UnassignedBySystemUserId] [int] NULL,
	[IVRTaskOrderNumber] [varchar](50) NULL,
	[CellularTaskOrderNumber] [varchar](50) NULL,
	[ComputedUnitID] [varchar](10) NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[MemberId] [int] NULL,
	[DeviceRegistration_RUNNO_INSERT] [int] NOT NULL,
	[SYS_SourceDB_TR_ID] [varchar](75) NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Fct_DeviceRegistration] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
