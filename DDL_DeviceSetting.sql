USE [xAnalytics_DW]
GO

/****** Object:  Table [dm].[TDMA_1Dim_DeviceSetting]    Script Date: 6/21/2018 4:00:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dm].[TDMA_1Dim_DeviceSetting](
	[DeviceSetting_VID] [bigint] NOT NULL,
	[DeviceSetting_FromDate] [datetime2](6) NOT NULL,
	[DeviceSetting_ToDate] [datetime2](6) NOT NULL,
	[DeviceSetting_OID] [bigint] NOT NULL,
	[DeviceSettingID] [int] NULL,
	[UnitID] [bigint] NULL,
	[TargetWt] [numeric](4, 1) NULL,
	[MinWeight] [numeric](4, 1) NULL,
	[MaxWeight] [numeric](4, 1) NULL,
	[WeightGain] [numeric](4, 1) NULL,
	[WeightInDays] [int] NULL,
	[MaxGlucose] [numeric](5, 2) NULL,
	[MinGlucose] [numeric](5, 2) NULL,
	[MinPulse] [int] NULL,
	[MaxPulse] [int] NULL,
	[MinSPO2] [int] NULL,
	[MinPEFR] [int] NULL,
	[MinFEV1] [numeric](4, 1) NULL,
	[MinSystolic] [int] NULL,
	[MaxSystolic] [int] NULL,
	[MinDiastolic] [int] NULL,
	[MaxDiastolic] [int] NULL,
	[Temperature] [numeric](4, 1) NULL,
	[OxygenUsage] [int] NULL,
	[HGBMonths] [int] NULL,
	[SxThreshold] [numeric](4, 2) NULL,
	[SxVariance] [numeric](4, 2) NULL,
	[SxDays] [int] NULL,
	[ComplianceThreshold] [int] NULL,
	[ComplianceDays] [int] NULL,
	[Praise] [int] NULL,
	[DateEntered] [datetime2](3) NULL,
	[SystemUserID] [int] NULL,
	[DevicePeripherals] [int] NULL,
	[AlertOnSPO2] [int] NULL,
	[AlertOnPulseHigh] [int] NULL,
	[AlertOnPulseLow] [int] NULL,
	[AlertOnSystolicHigh] [int] NULL,
	[AlertOnSystolicLow] [int] NULL,
	[AlertOnDiastolicHigh] [int] NULL,
	[AlertOnDiastolicLow] [int] NULL,
	[AlertOnGlucoseHigh] [int] NULL,
	[AlertOnGlucoseLow] [int] NULL,
	[AlertOnPEFR] [int] NULL,
	[AlertOnFEV1] [int] NULL,
	[MemberId] [int] NULL,
	[DisplayWeightInKg] [int] NULL,
	[DisplayTempInCelsius] [int] NULL,
	[DisplayGlucoseInMillimoles] [int] NULL,
	[WeightGain2] [numeric](4, 1) NULL,
	[WeightInDays2] [int] NULL,
	[WeightLoss] [numeric](4, 1) NULL,
	[WeightLossDays] [int] NULL,
	[InactiveDate] [datetime2](3) NULL,
	[WeightGainXLast] [numeric](4, 1) NULL,
	[AlertOnWeightGainXLast] [int] NULL,
	[AlertOnMaxWeight] [int] NULL,
	[AlertOnMinWeight] [int] NULL,
	[AlertOnWeightGainXY1] [int] NULL,
	[AlertOnWeightGainXY2] [int] NULL,
	[AlertOnWeightLossXY1] [int] NULL,
	[AlertOnSymptom] [int] NULL,
	[AlertOnSymptomVariance] [int] NULL,
	[AlertOnCompliance] [int] NULL,
	[MemberWelcomePendingUpdate] [int] NULL,
	[EDW] [numeric](5, 2) NULL,
	[DeviceUsesKilograms] [int] NULL,
	[DeviceYesterdayCompare] [int] NULL,
	[DeviceMaxCompare] [int] NULL,
	[DisplayFluidInCups] [int] NULL,
	[IsRequiredWeight] [int] NULL,
	[WeightDailyRotationTypeId] [int] NULL,
	[IsRequiredBloodPressure] [int] NULL,
	[BloodPressureDailyRotationTypeId] [int] NULL,
	[IsRequiredPulseOx] [int] NULL,
	[PulseOxDailyRotationTypeId] [int] NULL,
	[IsRequiredGlucose] [int] NULL,
	[GlucoseDailyRotationTypeId] [int] NULL,
	[IsRequiredPeakFlow] [int] NULL,
	[PeakFlowDailyRotationTypeId] [int] NULL,
	[BreakfastStart] [datetime2](3) NULL,
	[BreakfastEnd] [datetime2](3) NULL,
	[LunchStart] [datetime2](3) NULL,
	[LunchEnd] [datetime2](3) NULL,
	[DinnerStart] [datetime2](3) NULL,
	[DinnerEnd] [datetime2](3) NULL,
	[TargetSystolic] [int] NULL,
	[TargetDiastolic] [int] NULL,
	[TargetPulse] [int] NULL,
	[TargetMaxGlucose] [int] NULL,
	[TargetMinGlucose] [int] NULL,
	[TargetMaxPreMealGlucose] [int] NULL,
	[TargetMinPreMealGlucose] [int] NULL,
	[TargetMaxAfterMealGlucose] [int] NULL,
	[TargetMinAfterMealGlucose] [int] NULL,
	[FluidLimitOunces] [int] NULL,
	[SodiumLimit] [int] NULL,
	[CholesterolMonths] [int] NULL,
	[LDLGoal] [int] NULL,
	[HDLGoal] [int] NULL,
	[TriglycerideGoal] [int] NULL,
	[TotalCholesterolGoal] [int] NULL,
	[KetoneCheckLimit] [int] NULL,
	[MaxPEFR] [int] NULL,
	[MaxPainThreshold] [int] NULL,
	[TargetHGBA1C] [int] NULL,
	[DeviceDisplayFluidInCups] [int] NULL,
	[DeviceDisplayWeightInKg] [int] NULL,
	[DeviceDisplayTempInCelsius] [int] NULL,
	[DeviceDisplayGlucoseInMillimoles] [int] NULL,
	[EducationLevel] [int] NULL,
	[VariableHexString] [varchar](50) NULL,
	[ExpectedTransDaysInWeek] [int] NULL,
	[NotReportedDays] [int] NULL,
	[TargetSteps] [int] NULL,
	[SYS_SourceDB] [varchar](50) NOT NULL,
	[SYS_ETL_Timestamp] [datetime2](3) NULL,
	[OBSOLETE__INDICATION] [int] NOT NULL,
	[DeviceSetting_RUNNO_INSERT] [int] NOT NULL,
	[DeviceSetting_RUNNO_UPDATE] [int] NOT NULL,
	[SYS_SourceDB_DeviceSetting_VID] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TDMA_1Dim_DeviceSetting] PRIMARY KEY CLUSTERED 
(
	[DeviceSetting_VID] ASC,
	[SYS_SourceDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
