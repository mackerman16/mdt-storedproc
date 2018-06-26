USE [xAnalytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_OperationRole]    Script Date: 6/26/2018 11:06:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_OperationRole](
	[OperationRole_OID] [bigint] NOT NULL,
	[OperationRoleID] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[OperationID] [int] NULL,
	[RoleID] [int] NULL,
	[OperationRole_RUNNO_INSERT] [int] NOT NULL,
	[OperationRole_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_OperationRole_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Dim_OperationRole] PRIMARY KEY CLUSTERED 
(
	[OperationRole_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
