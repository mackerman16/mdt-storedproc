USE [xAnalytics_DW]
GO

/****** Object:  Table [dw].[LastRunTimestamp]    Script Date: 6/21/2018 3:54:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[LastRunTimestamp](
	[ID] [int] NOT NULL,
	[MASTER_LastRunTimestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_LastRunTimestamp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


