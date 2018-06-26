USE [xAnalytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Fct_MemberMedication]    Script Date: 6/26/2018 11:22:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Fct_MemberMedication](
	[TR_ID] [bigint] NOT NULL,
	[StartDate_Date_OID] [bigint] NULL,
	[MemberMedicationId] [int] NULL,
	[MedicationDose] [varchar](100) NULL,
	[MedicationUnitId] [int] NULL,
	[MedicationFrequencyId] [int] NULL,
	[MedicationRouteId] [int] NULL,
	[StartDate] [datetime2](3) NULL,
	[EndDate] [datetime2](3) NULL,
	[ExtraDose] [int] NULL,
	[IsTracked] [int] NULL,
	[LastUpdated] [datetime2](3) NULL,
	[SystemUserId] [int] NULL,
	[GIGO_Flag] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[MedicationId] [int] NULL,
	[MedicationName] [varchar](50) NULL,
	[COPD] [int] NULL,
	[Active] [int] NULL,
	[MedSYS_SourceDB] [varchar](50) NULL,
	[MedSYS_ETL_Timestamp] [datetime2](3) NULL,
	[Member_OID] [bigint] NOT NULL,
	[Member_VID] [bigint] NOT NULL,
	[MemberId] [int] NULL,
	[MemberMedication_RUNNO_INSERT] [int] NOT NULL,
	[SYS_SourceDB_TR_ID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Fct_MemberMedication] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
