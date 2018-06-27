USE [Analytics_DW]
GO

/****** Object:  Table [dw].[TEMP_TDMA_1Dim_SystemUser]    Script Date: 6/26/2018 11:39:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[TEMP_TDMA_1Dim_SystemUser](
	[SystemUser_OID] [bigint] NOT NULL,
	[SystemUserID] [int] NULL,
	[CustomerID] [int] NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Enabled] [int] NULL,
	[ForcePasswordChange] [int] NULL,
	[LastLoggedIn] [datetime2](3) NULL,
	[LastPasswordChange] [datetime2](3) NULL,
	[FailedLoginAttempts] [int] NULL,
	[PasswordNeverExpires] [int] NULL,
	[SystemViewLevel] [int] NULL,
	[DefaultManagementGroup] [int] NULL,
	[AgreeToEULA] [int] NULL,
	[EULADate] [datetime2](3) NULL,
	[AllowMultiLogin] [int] NULL,
	[UserViewLevel] [int] NULL,
	[UserView] [int] NULL,
	[UserViewProfessional] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[SystemUser_RUNNO_INSERT] [int] NOT NULL,
	[SystemUser_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_SystemUser_OID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TEMP_TDMA_1Dim_SystemUser] PRIMARY KEY CLUSTERED 
(
	[SystemUser_OID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
