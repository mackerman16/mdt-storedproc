USE [Analytics_DW]
GO

/****** Object:  Table [dw].[RunData]    Script Date: 6/21/2018 3:58:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[RunData](
	[Table_Name] [varchar](100) NOT NULL,
	[MASTER_LastRunTimestamp] [datetime] NOT NULL,
	[StartRunTime] [datetime] NOT NULL,
	[EndRunTime] [datetime] NOT NULL,
	[TotalSourceRecordCount] [bigint] NOT NULL,
	[TotalTargetRecordCount] [bigint] NOT NULL,
	[TotalRecordCountPassed] [varchar](1) NOT NULL,
	[TotalSourceUpdateCount] [bigint] NOT NULL,
	[TotalTargetUpdateCount] [bigint] NOT NULL,
	[TotalUpdateCountPassed] [varchar](1) NOT NULL,
 CONSTRAINT [PK_RunData] PRIMARY KEY CLUSTERED 
(
	[Table_Name] ASC,
	[MASTER_LastRunTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
