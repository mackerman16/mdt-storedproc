USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Fct_C_DeviceReading]    Script Date: 6/26/2018 11:15:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Fct_C_DeviceReading](
	[TR_ID] [bigint] NOT NULL,
	[Biometric_DateEntered_Date_OID] [bigint] NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[DeviceSetting_OID] [bigint] NOT NULL,
	[DeviceSetting_VID] [bigint] NOT NULL,
	[C_Biometric_OID] [bigint] NOT NULL,
	[C_Biometric_VID] [bigint] NOT NULL,
	[FK2_FK_Path2Instance_OID] [bigint] NOT NULL,
	[FK2_FK_Path2Instance_VID] [bigint] NOT NULL,
	[BiometricReadingID] [bigint] NULL,
	[BiometricEntryTypeId] [int] NULL,
	[BiometricEntryTypeName] [varchar](50) NULL,
	[Biometric_DateEntered] [datetime2](3) NULL,
	[BiometricReading_1] [numeric](38, 12) NULL,
	[BiometricReading_2] [numeric](38, 12) NULL,
	[BiometricReading_3] [numeric](38, 12) NULL,
	[BiometricReading_4] [numeric](38, 12) NULL,
	[BiometricReading_5] [varchar](50) NULL,
	[isExcluded] [int] NULL,
	[ExcludedDatetime] [datetime2](3) NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[UnitID] [bigint] NULL,
	[UnitType] [int] NULL,
	[Status] [int] NULL,
	[ErrorStatus] [int] NULL,
	[DateEntered] [datetime2](3) NULL,
	[DevAcknowledged] [datetime2](3) NULL,
	[AcknowledgedBySystemUserId] [int] NULL,
	[server] [varchar](25) NULL,
	[commport] [varchar](25) NULL,
	[PathwayComplete] [int] NULL,
	[HL7Sent] [int] NULL,
	[HL7Attempts] [int] NULL,
	[DateReviewed] [datetime2](3) NULL,
	[ReviewedBy] [int] NULL,
	[EnterState] [varchar](10) NULL,
	[DeviceLog_SYS_SourceDB] [varchar](50) NOT NULL,
	[DeviceLog_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[DeviceLogID] [int] NULL,
	[UnknownDeviceID] [int] NULL,
	[DeviceID] [bigint] NULL,
	[AnswerString] [varchar](255) NULL,
	[DeviceUnknown_Acknowledged] [int] NULL,
	[DeviceUnknown_SystemUserID] [int] NULL,
	[DeviceUnknown_SYS_SourceDB] [varchar](50) NULL,
	[DeviceUnknown_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[PK_DeviceLogID] [int] NULL,
	[MemberId] [int] NULL,
	[ExcludedBySystemUserId] [int] NULL,
	[C_DeviceReading_SystemUserId] [int] NULL,
	[GIGO_Flag] [int] NULL,
	[P2DLM_DeviceLogId] [int] NULL,
	[P2DLM_MemberId] [int] NULL,
	[P2DLM_TransmissionTime] [datetime2](3) NULL,
	[P2DLM_ProcessTime] [datetime2](3) NULL,
	[P2DLM_ProcessStatus] [varchar](10) NULL,
	[P2DLM_GIGO_Flag] [int] NULL,
	[P2DLM_SYS_SourceDB] [varchar](50) NULL,
	[P2DLM_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[P2IB_PathwayInstanceId] [int] NULL,
	[P2IB_DeviceLogId] [int] NULL,
	[P2IB_DefaultSettingGroupId] [int] NULL,
	[P2IB_MemberSettingGroupId] [int] NULL,
	[P2IB_GIGO_Flag] [int] NULL,
	[P2IB_SYS_SourceDB] [varchar](50) NULL,
	[P2IB_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[P2IB_PathwayInstanceFlag] [varchar](1) NULL,
	[C_DeviceReading_RUNNO_INSERT] [int] NOT NULL,
	[DeviceLog_SYS_SourceDB_TR_ID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Fct_C_DeviceReading] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[DeviceLog_SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
