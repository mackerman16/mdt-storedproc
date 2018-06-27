USE [Analytics_DW]
GO

/****** Object:  Table [dw].[C_Client]    Script Date: 6/21/2018 4:09:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[C_Client](
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[ClientId] [int] NOT NULL,
	[MAS90Code] [varchar](50) NOT NULL,
	[StatusFlag] [char](2) NOT NULL,
	[PassTier] [varchar](25) NULL,
	[ClientName] [varchar](250) NOT NULL,
	[BillingSegment] [varchar](25) NULL,
	[ClientSegment] [varchar](100) NULL,
	[PassFlag] [char](1) NULL,
	[CareTypeMonitoring] [varchar](12) NULL,
	[MonitoringCoverage] [varchar](100) NULL,
	[CustomMonitoringCoverage] [varchar](50) NULL,
	[Clinical_Flag] [char](1) NOT NULL,
	[Client_SYS_ETL_Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_C_Client] PRIMARY KEY CLUSTERED 
(
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
