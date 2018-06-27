USE [Analytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Fct_MemberLab]    Script Date: 6/26/2018 11:59:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Fct_MemberLab](
	[TR_ID] [bigint] NOT NULL,
	[LabDate_Date_OID] [bigint] NULL,
	[MemberLabId] [int] NULL,
	[LabId] [int] NULL,
	[LabName] [varchar](255) NULL,
	[LabUnit] [varchar](255) NULL,
	[Active] [int] NULL,
	[LabSYS_SourceDB] [varchar](50) NULL,
	[LabSYS_ETL_Timestamp] [datetime2](3) NULL,
	[LabDate] [datetime2](3) NULL,
	[LabValue] [varchar](50) NULL,
	[LastUpdated] [datetime2](3) NULL,
	[SystemUserId] [int] NULL,
	[PathwayComplete] [int] NULL,
	[GIGO_Flag] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[MemberId] [int] NULL,
	[MemberLab_RUNNO_INSERT] [int] NOT NULL,
	[SYS_SourceDB_TR_ID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Fct_MemberLab] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
