USE [xAnalytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_Role]    Script Date: 6/26/2018 11:11:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_Role](
	[Role_OID] [bigint] NOT NULL,
	[RoleID] [int] NULL,
	[CustomerID] [int] NULL,
	[CustomerName] [varchar](50) NULL,
	[PromoCodeID] [int] NULL,
	[Customer_SYS_SourceDB] [varchar](50) NULL,
	[Customer_SYS_ETL_Timestamp] [datetime2](3) NULL,
	[RoleName] [varchar](50) NULL,
	[RoleDescription] [varchar](150) NULL,
	[RoleType] [int] NULL,
	[RoleKey] [int] NULL,
	[Enabled] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[Role_RUNNO_INSERT] [int] NOT NULL,
	[Role_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_Role_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Dim_Role] PRIMARY KEY CLUSTERED 
(
	[Role_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
