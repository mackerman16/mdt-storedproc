USE [xAnalytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Dim_UsersInRole]    Script Date: 6/26/2018 11:51:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Dim_UsersInRole](
	[UsersInRole_OID] [bigint] NOT NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[RoleID] [int] NULL,
	[SystemUserID] [int] NULL,
	[UsersInRole_RUNNO_INSERT] [int] NOT NULL,
	[UsersInRole_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_UsersInRole_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Dim_UsersInRole] PRIMARY KEY CLUSTERED 
(
	[UsersInRole_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
