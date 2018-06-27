USE [Analytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Dim_Path2Instance]    Script Date: 6/26/2018 11:37:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Dim_Path2Instance](
	[Path2Instance_VID] [bigint] NOT NULL,
	[Path2Instance_FromDate] [datetime2](6) NOT NULL,
	[Path2Instance_ToDate] [datetime2](6) NOT NULL,
	[Path2Instance_OID] [bigint] NOT NULL,
	[PathwayInstanceId] [int] NULL,
	[PathwayDefinitionId] [int] NULL,
	[P2D_DefinitionGlobalId] [uniqueidentifier] NULL,
	[P2D_PathwayName] [varchar](50) NULL,
	[P2D_Version] [varchar](10) NULL,
	[P2D_PathwayCategory] [varchar](50) NULL,
	[P2D_SYS_SourceDB] [varchar](50) NULL,
	[P2D_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[AddlCR_CloseReasonId] [int] NULL,
	[AddlCR_ReasonText] [varchar](500) NULL,
	[AddlCR_SYS_SourceDB] [varchar](50) NULL,
	[AddlCR_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[CloseCR_CloseReasonId] [int] NULL,
	[CloseCR_ReasonText] [varchar](500) NULL,
	[CloseCR_SYS_SourceDB] [varchar](50) NULL,
	[CloseCR_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[ReferCR_CloseReasonId] [int] NULL,
	[ReferCR_ReasonText] [varchar](500) NULL,
	[ReferCR_SYS_SourceDB] [varchar](50) NULL,
	[ReferCR_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[P2I_CreateTime] [datetime2](3) NULL,
	[P2I_DueTime] [datetime2](3) NULL,
	[P2I_Status] [varchar](50) NULL,
	[P2I_MemberId] [int] NULL,
	[P2I_CloseTime] [datetime2](3) NULL,
	[P2I_ClosedByUserId] [int] NULL,
	[P2I_ReferTime] [datetime2](3) NULL,
	[P2I_ReferredByUserId] [int] NULL,
	[P2I_RescheduleTime] [datetime2](3) NULL,
	[P2I_CreatedByUserId] [int] NULL,
	[P2I_SYS_SourceDB] [varchar](50) NOT NULL,
	[P2I_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[OBSOLETE__INDICATION] [int] NOT NULL,
	[Path2Instance_RUNNO_INSERT] [int] NOT NULL,
	[Path2Instance_RUNNO_UPDATE] [int] NOT NULL,
	[P2I_SYS_SourceDB_Path2Instance_VID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Dim_Path2Instance] PRIMARY KEY CLUSTERED 
(
	[Path2Instance_VID] ASC,
	[P2I_SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
