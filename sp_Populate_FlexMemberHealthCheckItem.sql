
/*
 * Function used to generate the insert statement used when combining the FlexMemberHealthCheckItem table
 * from many clients into one target table. The generated insert statement must be run once for each client. 
 *
 * Parameters:
 *      @table NVARCHAR(250) - the name of the target table we wish to enter the data into
 *      @dbname NVARCHAR(50) - the name of the client database we wish to pull the data from
 *      @lastRuntimeForClient DATETIME - the last time we captured data (@dbname)
 *
 * Returns:
 *      @constructedInsert NVARCHAR(4000) - the insert statement used to capture the FlexMemberHealthCheckItem data from a specific client and insert it into a target table
 */
CREATE FUNCTION dw.FlexMemberHealthCheckItem_GenerateInsert (@table NVARCHAR(250), @dbname NVARCHAR(50), @lastRuntime DATETIME) RETURNS NVARCHAR(4000) AS
BEGIN

    -- The insert statement used to capture the FlexMemberHealthCheckItem data and insert it into a target table.
    -- Note on WHERE clause: We add 1 second to From Date to retrieve all records inserted or updated that have happened since our last runtime.
    --                       Both dates in WHERE clause are converted to varchar in order for compare to work with '21' being the format of varchar
    --                       we want as a result of the convert. We have the To Date set to the future to compensate for the differing server times
    --                       causing records in the data mart with SYS_ETL_Timestamps set in the future.
    DECLARE @constructedInsert AS NVARCHAR(4000) = N'INSERT INTO ' + @table + 
                                                   N' SELECT C_FlexMemberHealthCheckItem_VID
      ,C_FlexMemberHealthCheckItem_FromDate
      ,C_FlexMemberHealthCheckItem_ToDate
      ,C_FlexMemberHealthCheckItem_OID
      ,FMHCI_FlexHealthCheckGroupId
      ,FMHCI_HealthCheckItemIndex
      ,FST_FlexScoreTypeId
      ,FST_FlexScoreType
      ,FST_IsActive
      ,FST_SYS_SourceDB
      ,FST_SYS_ETL_Timestamp
      ,FS_FlexScoreId
      ,FS_FlexScoreValue
      ,FS_ActiveDate
      ,FS_ActivatedBySystemUserId
      ,FS_InactiveDate
      ,FS_InactivatedBySystemUserId
      ,FS_SYS_SourceDB
      ,FS_SYS_ETL_Timestamp
      ,FMHCI_DailyRotationTypeId
      ,FMHCI_FullRotation
      ,FMHCI_SnippetId
      ,FMHCI_EducationLevel
      ,FMHCI_IsActive
      ,FMHCI_IsRoot
      ,FMHCI_AnswerTypeVal
      ,FMHCI_SYS_SourceDB
      ,FMHCI_SYS_ETL_Timestamp
      ,FMS_FlexMessageSetId
      ,FMST_FlexMessageSetTypeId
      ,FMST_FlexMessageSetType
      ,FMST_FlexMessageSetTypeShort
      ,FMST_IsActive
      ,FMST_SYS_SourceDB
      ,FMST_SYS_ETL_Timestamp
      ,FMSC_FlexMessageSetCategoryId
      ,FMSC_FlexMessageSetCategoryName
      ,FMSC_FlexMessageSetCategoryDescription
      ,FMSC_IsActive
      ,FMSC_SYS_SourceDB
      ,FMSC_SYS_ETL_Timestamp
      ,FMS_FlexBiometricTypeId
      ,FMS_FlexMedicationID
      ,FMS_FlexMedicationSiteID
      ,FMS_MBRepeatQuestionID
      ,FMS_DateTimeCollectionTypeID
      ,FMS_IsSystem
      ,FMS_IsActive
      ,FMS_AnswerResponseText
      ,FMS_SYS_SourceDB
      ,FMS_SYS_ETL_Timestamp
      ,FMS_Header_FlexMessageId
      ,FMS_IndexItemId
      ,FM_Answer_FlexMessageId
      ,FM_Answer_IndexItemId
      ,FMT_Answer_FlexMessageTypeId
      ,FMT_Answer_FlexMessageType
      ,FMT_Answer_IsActive
      ,FMT_Answer_SYS_SourceDB
      ,FMT_Answer_SYS_ETL_Timestamp
      ,FM_Answer_DeviceMessageId
      ,FM_Answer_FlexMessageText
      ,FM_Answer_CompatibilityType
      ,FM_Answer_MediaVersion
      ,FM_Answer_IsSystem
      ,FM_Answer_IsActive
      ,FM_Answer_AnswerTextVal
      ,FM_Answer_SYS_SourceDB
      ,FM_Answer_SYS_ETL_Timestamp
      ,FM_Question_FlexMessageId
      ,FM_Question_IndexItemId
      ,FMT_Question_FlexMessageTypeId
      ,FMT_Question_FlexMessageType
      ,FMT_Question_IsActive
      ,FMT_Question_SYS_SourceDB
      ,FMT_Question_SYS_ETL_Timestamp
      ,FM_Question_DeviceMessageId
      ,FM_Question_FlexMessageText
      ,FM_Question_CompatibilityType
      ,FM_Question_MediaVersion
      ,FM_Question_IsSystem
      ,FM_Question_IsActive
      ,FM_Question_AnswerTextVal
      ,FM_Question_SYS_SourceDB
      ,FM_Question_SYS_ETL_Timestamp
      ,FMHCI_IndexItemId
      ,OBSOLETE__INDICATION
      ,C_FlexMemberHealthCheckItem_RUNNO_INSERT
      ,C_FlexMemberHealthCheckItem_RUNNO_UPDATE
      ,CONCAT(FMHCI_SYS_SourceDB,' + ' - ' + 'C_FlexMemberHealthCheckItem_VID)
      FROM ' + @dbname + N'.dm.TDMA_1Dim_FlexMemberHealthCheckItem
      WHERE (FMHCI_SYS_ETL_Timestamp BETWEEN DATEADD(ss, 1, ''' + CONVERT(NVARCHAR(30), @lastRuntime, 21) + N''')
                               AND CONVERT(NVARCHAR(30), DATEADD(day, 5, GETDATE()), 21));'
    RETURN @constructedInsert
END

/*
 * Stored procedure that loops through all clients, captures the FlexMemberHealthCheckItem inserts and updates
 * (since the last time this procedure was ran), and enters the data into one combined target table.
 */ 
CREATE PROCEDURE dw.sp_Populate_FlexMemberHealthCheckItem AS

    -- The source table we wish to retrieve the inserts and updates from
    DECLARE @sourceTable AS NVARCHAR(100) = N'TDMA_1Dim_FlexMemberHealthCheckItem';

    -- Temporary table used during the process of moving data from client table to target table.
    DECLARE @tempTable AS NVARCHAR(100) = N'xAnalytics_DW.dw.TEMP_TDMA_1Dim_FlexMemberHealthCheckItem';

    -- Target table.
    DECLARE @targetTable AS NVARCHAR(100) = N'xAnalytics_DW.dm.TDMA_1Dim_FlexMemberHealthCheckItem';

    -- Temporary table used during data quality validation.
    DECLARE @tempRunDataTable AS NVARCHAR(100) = N'xAnalytics_DW.dw.TEMP_RunData';

    -- The variable we will momentarily store each client database name in as we loop through our cursor.
    DECLARE @dbname AS NVARCHAR(50)

    -- Checking the last time we captured data.
    DECLARE @lastRuntime AS DATETIME
    SELECT @lastRuntime = MASTER_LastRunTimestamp
                          FROM [xAnalytics_DW].[dw].[LastRunTimestamp]
                          WHERE ID = 1;

    -- Truncate the temp table for FlexMemberHealthCheckItem.
    DECLARE @truncateTempTable AS NVARCHAR(4000) = 'TRUNCATE TABLE ' + @tempTable + N';'
    EXECUTE (@truncateTempTable)

    -- The cursor used to loop through our list of clients to capture their database name.
    DECLARE dbc CURSOR FOR
       SELECT SYS_SourceDB FROM xAnalytics_DW.dw.C_Client

    -- Opening our declared cursor.
    OPEN dbc

        -- Looping through the cursor and storing each database name into the @dbname variable.
        FETCH FROM dbc INTO @dbname
        WHILE @@FETCH_STATUS = 0
        
        BEGIN
            BEGIN TRY
                -- Checks how many records we should be capturing from FlexMemberHealthCheckItem for each client and stores them in a temporary table.
                DECLARE @countAndTrackNewRecords AS NVARCHAR(4000) =
                            N'DECLARE @newRecordsCounted AS BIGINT;
                              SELECT @newRecordsCounted = COUNT(*)FROM ' + @dbname + N'.dm.' + @sourceTable + '
                                                          WHERE (FMHCI_SYS_ETL_Timestamp BETWEEN DATEADD(ss, 1, ''' + CONVERT(NVARCHAR(30), @lastRuntime, 21) + N''')
                                                                                   AND CONVERT(NVARCHAR(30), DATEADD(day, 5, GETDATE()), 21));;
                              INSERT INTO ' + @tempRunDataTable + N'
                              VALUES (''' + @dbname + N''', @newRecordsCounted);'
                EXECUTE (@countAndTrackNewRecords)

                -- Calling our function to generate the insert statements to move the records to a temporary table.
                DECLARE @insert AS NVARCHAR(4000) = dw.FlexMemberHealthCheckItem_GenerateInsert(@tempTable, @dbname, @lastRuntime)
                EXECUTE (@insert)

            END TRY

            -- Printing any error messages that occur.
            BEGIN CATCH
                PRINT ERROR_MESSAGE()
            END CATCH

            -- Replacing our current @dbname value with the next database name in the cursor.
            FETCH NEXT FROM dbc INTO @dbname
        END

    CLOSE dbc
    DEALLOCATE dbc

    -- Discovers what records are updates (exist in temp and target) and deletes these from target.
    DECLARE @deleteUpdatedRecordsFromTarget AS NVARCHAR(4000) = N'DELETE ' + @targetTable + N' 
                                                                  FROM ' + @targetTable + N' a 
                                                                  INNER JOIN ' + @tempTable + N' b ON (a.C_FlexMemberHealthCheckItem_VID = b.C_FlexMemberHealthCheckItem_VID and a.FMHCI_SYS_SourceDB = b.FMHCI_SYS_SourceDB);'
    EXECUTE (@deleteUpdatedRecordsFromTarget)

    -- (For validation) Counting how many records are in the target before we make additions.
    DECLARE @targetCountBeforeAdditions AS BIGINT
    SELECT @targetCountBeforeAdditions = COUNT(*) FROM xAnalytics_DW.dm.TDMA_1Dim_FlexMemberHealthCheckItem;

    -- Inserts all records from temp to target.
    DECLARE @insertRecordsFromTempToTarget AS NVARCHAR(4000) = N'INSERT INTO ' + @targetTable + 
                                                               N' SELECT C_FlexMemberHealthCheckItem_VID
      ,C_FlexMemberHealthCheckItem_FromDate
      ,C_FlexMemberHealthCheckItem_ToDate
      ,C_FlexMemberHealthCheckItem_OID
      ,FMHCI_FlexHealthCheckGroupId
      ,FMHCI_HealthCheckItemIndex
      ,FST_FlexScoreTypeId
      ,FST_FlexScoreType
      ,FST_IsActive
      ,FST_SYS_SourceDB
      ,FST_SYS_ETL_Timestamp
      ,FS_FlexScoreId
      ,FS_FlexScoreValue
      ,FS_ActiveDate
      ,FS_ActivatedBySystemUserId
      ,FS_InactiveDate
      ,FS_InactivatedBySystemUserId
      ,FS_SYS_SourceDB
      ,FS_SYS_ETL_Timestamp
      ,FMHCI_DailyRotationTypeId
      ,FMHCI_FullRotation
      ,FMHCI_SnippetId
      ,FMHCI_EducationLevel
      ,FMHCI_IsActive
      ,FMHCI_IsRoot
      ,FMHCI_AnswerTypeVal
      ,FMHCI_SYS_SourceDB
      ,FMHCI_SYS_ETL_Timestamp
      ,FMS_FlexMessageSetId
      ,FMST_FlexMessageSetTypeId
      ,FMST_FlexMessageSetType
      ,FMST_FlexMessageSetTypeShort
      ,FMST_IsActive
      ,FMST_SYS_SourceDB
      ,FMST_SYS_ETL_Timestamp
      ,FMSC_FlexMessageSetCategoryId
      ,FMSC_FlexMessageSetCategoryName
      ,FMSC_FlexMessageSetCategoryDescription
      ,FMSC_IsActive
      ,FMSC_SYS_SourceDB
      ,FMSC_SYS_ETL_Timestamp
      ,FMS_FlexBiometricTypeId
      ,FMS_FlexMedicationID
      ,FMS_FlexMedicationSiteID
      ,FMS_MBRepeatQuestionID
      ,FMS_DateTimeCollectionTypeID
      ,FMS_IsSystem
      ,FMS_IsActive
      ,FMS_AnswerResponseText
      ,FMS_SYS_SourceDB
      ,FMS_SYS_ETL_Timestamp
      ,FMS_Header_FlexMessageId
      ,FMS_IndexItemId
      ,FM_Answer_FlexMessageId
      ,FM_Answer_IndexItemId
      ,FMT_Answer_FlexMessageTypeId
      ,FMT_Answer_FlexMessageType
      ,FMT_Answer_IsActive
      ,FMT_Answer_SYS_SourceDB
      ,FMT_Answer_SYS_ETL_Timestamp
      ,FM_Answer_DeviceMessageId
      ,FM_Answer_FlexMessageText
      ,FM_Answer_CompatibilityType
      ,FM_Answer_MediaVersion
      ,FM_Answer_IsSystem
      ,FM_Answer_IsActive
      ,FM_Answer_AnswerTextVal
      ,FM_Answer_SYS_SourceDB
      ,FM_Answer_SYS_ETL_Timestamp
      ,FM_Question_FlexMessageId
      ,FM_Question_IndexItemId
      ,FMT_Question_FlexMessageTypeId
      ,FMT_Question_FlexMessageType
      ,FMT_Question_IsActive
      ,FMT_Question_SYS_SourceDB
      ,FMT_Question_SYS_ETL_Timestamp
      ,FM_Question_DeviceMessageId
      ,FM_Question_FlexMessageText
      ,FM_Question_CompatibilityType
      ,FM_Question_MediaVersion
      ,FM_Question_IsSystem
      ,FM_Question_IsActive
      ,FM_Question_AnswerTextVal
      ,FM_Question_SYS_SourceDB
      ,FM_Question_SYS_ETL_Timestamp
      ,FMHCI_IndexItemId
      ,OBSOLETE__INDICATION
      ,C_FlexMemberHealthCheckItem_RUNNO_INSERT
      ,C_FlexMemberHealthCheckItem_RUNNO_UPDATE
      ,CONCAT(FMHCI_SYS_SourceDB,' + ' - ' + 'C_FlexMemberHealthCheckItem_VID)
       FROM ' + @tempTable + N';'
    EXECUTE (@insertRecordsFromTempToTarget)

    -- (For validation) Counting how many records are in the target after we make additions.
    DECLARE @targetCountAfterAdditions AS BIGINT
    SELECT @targetCountAfterAdditions = COUNT(*) FROM xAnalytics_DW.dm.TDMA_1Dim_FlexMemberHealthCheckItem;

    -- (For validation) Counting how many records are in the temporary RunData table which shows us how many records we should expect to be inserted into the target.
    DECLARE @newRecordCount AS BIGINT
    SELECT @newRecordCount = SUM(Records_Captured) FROM [xAnalytics_DW].[dw].[TEMP_RunData];

    -- Truncate the temp table for RunData since it doesn't track the specific table and will be irrelevant since we run stored procedures back to back for every table.
    DECLARE @truncateRunDataTempTable AS NVARCHAR(4000) = 'TRUNCATE TABLE ' + @tempRunDataTable + N';'
    EXECUTE (@truncateRunDataTempTable)

    -- (For validation) If the amount of added target records matches the expected amount, insert the record with a 'Y' for the 'Passed' column. Else, 'N'.
    IF (@targetCountAfterAdditions - @targetCountBeforeAdditions) = @newRecordCount
        INSERT INTO [xAnalytics_DW].[dw].[RunData]
        VALUES (@sourceTable
                ,@LastRuntime
                ,@newRecordCount
                ,@targetCountAfterAdditions - @targetCountBeforeAdditions
                ,'Y');
    ELSE
        INSERT INTO [xAnalytics_DW].[dw].[RunData]
        VALUES (@sourceTable
                ,@LastRuntime
                ,@newRecordCount
                ,@targetCountAfterAdditions - @targetCountBeforeAdditions
                ,'N');

GO

EXEC dw.sp_Populate_FlexMemberHealthCheckItem