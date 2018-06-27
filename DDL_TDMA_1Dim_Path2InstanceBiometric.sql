USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_Path2InstanceBiometric]    Script Date: 6/26/2018 11:08:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_Path2InstanceBiometric](
	[Path2InstanceBiometric_OID] [bigint] NOT NULL,
	[PathwayInstanceId] [int] NULL,
	[DeviceLogId] [int] NULL,
	[DefaultSettingGroupId] [int] NULL,
	[MemberSettingGroupId] [int] NULL,
	[GIGO_Flag] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[Path2InstanceBiometric_RUNNO_INSERT] [int] NOT NULL,
	[Path2InstanceBiometric_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_Path2InstanceBiometric_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Dim_Path2InstanceBiometric] PRIMARY KEY CLUSTERED 
(
	[Path2InstanceBiometric_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
