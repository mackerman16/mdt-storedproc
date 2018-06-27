USE [Analytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_C_Biometric]    Script Date: 6/21/2018 4:06:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_C_Biometric](
	[C_Biometric_VID] [bigint] NOT NULL,
	[C_Biometric_FromDate] [datetime2](6) NOT NULL,
	[C_Biometric_ToDate] [datetime2](6) NOT NULL,
	[C_Biometric_OID] [bigint] NOT NULL,
	[BiometricId] [int] NULL,
	[BiometricName] [varchar](25) NULL,
	[BiometricCode] [varchar](10) NULL,
	[BiometricCategory] [varchar](50) NULL,
	[Measure_1] [varchar](50) NULL,
	[Measure_2] [varchar](50) NULL,
	[Measure_3] [varchar](50) NULL,
	[Measure_4] [varchar](50) NULL,
	[Measure_5] [varchar](50) NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[OBSOLETE__INDICATION] [int] NOT NULL,
	[C_Biometric_RUNNO_INSERT] [int] NOT NULL,
	[C_Biometric_RUNNO_UPDATE] [int] NOT NULL,
 CONSTRAINT [PK_TDMA_1Dim_C_Biometric] PRIMARY KEY CLUSTERED 
(
	[C_Biometric_VID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
