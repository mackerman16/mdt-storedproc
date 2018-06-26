
/*
 * Function used to generate the insert statement used when combining the FlexHealthCheckGroup table
 * from many clients into one target table. The generated insert statement must be run once for each client. 
 *
 * Parameters:
 *      @table NVARCHAR(250) - the name of the target table we wish to enter the data into
 *      @dbname NVARCHAR(50) - the name of the client database we wish to pull the data from
 *      @lastRuntimeForClient DATETIME - the last time we captured data (@dbname)
 *
 * Returns:
 *      @constructedInsert NVARCHAR(4000) - the insert statement used to capture the FlexHealthCheckGroup data from a specific client and insert it into a target table
 */
CREATE FUNCTION dw.FlexHealthCheckGroup_GenerateInsert (@table NVARCHAR(250), @dbname NVARCHAR(50), @lastRuntime DATETIME) RETURNS NVARCHAR(4000) AS
BEGIN

    -- The insert statement used to capture the FlexHealthCheckGroup data and insert it into a target table.
    -- Note on WHERE clause: We add 1 second to From Date to retrieve all records inserted or updated that have happened since our last runtime.
    --                       Both dates in WHERE clause are converted to varchar in order for compare to work with '21' being the format of varchar
    --                       we want as a result of the convert. We have the To Date set to the future to compensate for the differing server times
    --                       causing records in the data mart with SYS_ETL_Timestamps set in the future.
    DECLARE @constructedInsert AS NVARCHAR(4000) = N'INSERT INTO ' + @table + 
                                                   N' SELECT FlexHealthCheckGroup_VID
      ,FlexHealthCheckGroup_FromDate
      ,FlexHealthCheckGroup_ToDate
      ,FlexHealthCheckGroup_OID
      ,FHCG_FlexHealthCheckGroupId
      ,FHCG_FlexHealthCheckGroupHash
      ,FHCG_InsertDate
      ,FHCG_SYS_SourceDB
      ,FHCG_SYS_ETL_Timestamp
      ,FTHC_FlexTemplateHealthCheckId
      ,FC_FlexComorbidityId
      ,FC_FlexComorbidityName
      ,FC_FlexComorbidityAbbrev
      ,FC_SYS_SourceDB
      ,FC_SYS_ETL_Timestamp
      ,SMT_SnippetMessagingTypeId
      ,SMT_DisplayName
      ,SMT_Description
      ,SMT_SYS_SourceDB
      ,SMT_SYS_ETL_Timestamp
      ,FTHC_FlexTemplateHealthCheckName
      ,FTHC_FlexTemplateHealthCheckDescription
      ,FTHC_DaysInRotation
      ,FTHC_RestartRotationOnDay
      ,FTHC_IsSystem
      ,FTHC_FlexTemplateTypeId
      ,FTHC_InsertedDate
      ,FTHC_InsertedBySystemUserId
      ,FTHC_IsActive
      ,FTHC_IsSnippet
      ,FTHC_DiseaseProgramId
      ,FTHC_SnippetId
      ,FTHC_ObsoleteTemplateMediaVersion
      ,FTHC_DevicePeripheralId
      ,FTHC_EnableConfigureSchedule
      ,FTHC_SYS_SourceDB
      ,FTHC_SYS_ETL_Timestamp
      ,OBSOLETE__INDICATION
      ,FlexHealthCheckGroup_RUNNO_INSERT
      ,FlexHealthCheckGroup_RUNNO_UPDATE
      ,CONCAT(FHCG_SYS_SourceDB,' + ' - ' + 'FlexHealthCheckGroup_VID)
      FROM ' + @dbname + N'_DW.dm.TDMA_1Dim_FlexHealthCheckGroup
      WHERE (FHCG_SYS_ETL_Timestamp BETWEEN DATEADD(ss, 1, ''' + CONVERT(NVARCHAR(30), @lastRuntime, 21) + N''')
                               AND CONVERT(NVARCHAR(30), DATEADD(day, 5, GETDATE()), 21));'
    RETURN @constructedInsert
END

/*
 * Stored procedure that loops through all clients, captures the FlexHealthCheckGroup inserts and updates
 * (since the last time this procedure was ran), and enters the data into one combined target table.
 */ 
CREATE PROCEDURE dw.sp_Populate_FlexHealthCheckGroup AS

    -- (For validation) Captures script start DATETIME
    DECLARE @startRunTime AS DATETIME = GETDATE();

    -- The source table we wish to retrieve the inserts and updates from
    DECLARE @sourceTable AS NVARCHAR(100) = N'TDMA_1Dim_FlexHealthCheckGroup';

    -- Temporary table used during the process of moving data from client table to target table.
    DECLARE @tempTable AS NVARCHAR(100) = N'xAnalytics_DW.dw.TEMP_TDMA_1Dim_FlexHealthCheckGroup';

    -- Target table.
    DECLARE @targetTable AS NVARCHAR(100) = N'xAnalytics_DW.dm.TDMA_1Dim_FlexHealthCheckGroup';

    -- Temporary table used during data quality validation.
    DECLARE @tempRunDataTable AS NVARCHAR(100) = N'xAnalytics_DW.dw.TEMP_RunData';

    -- The variable we will momentarily store each client database name in as we loop through our cursor.
    DECLARE @dbname AS NVARCHAR(50)

    -- Checking the last time we captured data.
    DECLARE @lastRuntime AS DATETIME
    SELECT @lastRuntime = MASTER_LastRunTimestamp
                          FROM [xAnalytics_DW].[dw].[LastRunTimestamp]
                          WHERE ID = 1;

    -- Truncate the temp table for FlexHealthCheckGroup.
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
                -- Checks how many records we should be capturing from FlexHealthCheckGroup for each client and stores them in a temporary table.
                DECLARE @countAndTrackNewRecords AS NVARCHAR(4000) =
                            N'DECLARE @newRecordsCounted AS BIGINT;
                              SELECT @newRecordsCounted = COUNT(*)FROM ' + @dbname + N'_DW.dm.' + @sourceTable + '
                                                          WHERE (FHCG_SYS_ETL_Timestamp BETWEEN DATEADD(ss, 1, ''' + CONVERT(NVARCHAR(30), @lastRuntime, 21) + N''')
                                                                                   AND CONVERT(NVARCHAR(30), DATEADD(day, 5, GETDATE()), 21));;
                              INSERT INTO ' + @tempRunDataTable + N'
                              VALUES (''' + @dbname + N''', @newRecordsCounted);'
                EXECUTE (@countAndTrackNewRecords)

                -- Calling our function to generate the insert statements to move the records to a temporary table.
                DECLARE @insert AS NVARCHAR(4000) = dw.FlexHealthCheckGroup_GenerateInsert(@tempTable, @dbname, @lastRuntime)
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

    -- (For validation) Counting how many records are in the target before we make deletions.
    DECLARE @targetCountBeforeDeletes AS BIGINT
    SELECT @targetCountBeforeDeletes = COUNT(*) FROM xAnalytics_DW.dm.TDMA_1Dim_FlexHealthCheckGroup;

    -- (For validation) Counts how many records are updates
    DECLARE @totalsourceUpdateCount AS BIGINT
    SELECT @totalsourceUpdateCount = COUNT(*)
                               FROM [xAnalytics_DW].[dm].[TDMA_1Dim_FlexHealthCheckGroup] a 
                               INNER JOIN [xAnalytics_DW].[dw].[TEMP_TDMA_1Dim_FlexHealthCheckGroup] b ON (a.FlexHealthCheckGroup_VID = b.FlexHealthCheckGroup_VID and a.FHCG_SYS_SourceDB = b.FHCG_SYS_SourceDB);


    -- Delete the updates (exist in temp and target) from the target.
    DECLARE @deleteUpdatedRecordsFromTarget AS NVARCHAR(4000) = N'DELETE ' + @targetTable + N' 
                                                                  FROM ' + @targetTable + N' a 
                                                                  INNER JOIN ' + @tempTable + N' b ON (a.FlexHealthCheckGroup_VID = b.FlexHealthCheckGroup_VID and a.FHCG_SYS_SourceDB = b.FHCG_SYS_SourceDB);'
    EXECUTE (@deleteUpdatedRecordsFromTarget)

    -- (For validation) Counting how many records are in the target before we make additions.
    DECLARE @targetCountBeforeAdditions AS BIGINT
    SELECT @targetCountBeforeAdditions = COUNT(*) FROM xAnalytics_DW.dm.TDMA_1Dim_FlexHealthCheckGroup;


    -- Inserts all records from temp to target.
    DECLARE @insertRecordsFromTempToTarget AS NVARCHAR(4000) = N'INSERT INTO ' + @targetTable + 
                                                               N' SELECT FlexHealthCheckGroup_VID
      ,FlexHealthCheckGroup_FromDate
      ,FlexHealthCheckGroup_ToDate
      ,FlexHealthCheckGroup_OID
      ,FHCG_FlexHealthCheckGroupId
      ,FHCG_FlexHealthCheckGroupHash
      ,FHCG_InsertDate
      ,FHCG_SYS_SourceDB
      ,FHCG_SYS_ETL_Timestamp
      ,FTHC_FlexTemplateHealthCheckId
      ,FC_FlexComorbidityId
      ,FC_FlexComorbidityName
      ,FC_FlexComorbidityAbbrev
      ,FC_SYS_SourceDB
      ,FC_SYS_ETL_Timestamp
      ,SMT_SnippetMessagingTypeId
      ,SMT_DisplayName
      ,SMT_Description
      ,SMT_SYS_SourceDB
      ,SMT_SYS_ETL_Timestamp
      ,FTHC_FlexTemplateHealthCheckName
      ,FTHC_FlexTemplateHealthCheckDescription
      ,FTHC_DaysInRotation
      ,FTHC_RestartRotationOnDay
      ,FTHC_IsSystem
      ,FTHC_FlexTemplateTypeId
      ,FTHC_InsertedDate
      ,FTHC_InsertedBySystemUserId
      ,FTHC_IsActive
      ,FTHC_IsSnippet
      ,FTHC_DiseaseProgramId
      ,FTHC_SnippetId
      ,FTHC_ObsoleteTemplateMediaVersion
      ,FTHC_DevicePeripheralId
      ,FTHC_EnableConfigureSchedule
      ,FTHC_SYS_SourceDB
      ,FTHC_SYS_ETL_Timestamp
      ,OBSOLETE__INDICATION
      ,FlexHealthCheckGroup_RUNNO_INSERT
      ,FlexHealthCheckGroup_RUNNO_UPDATE
      ,FHCG_SYS_SourceDB_FlexHealthCheckGroup_VID
       FROM ' + @tempTable + N';'
    EXECUTE (@insertRecordsFromTempToTarget)

    -- (For validation) Counting how many records are in the target after we make additions.
    DECLARE @targetCountAfterAdditions AS BIGINT
    SELECT @targetCountAfterAdditions = COUNT(*) FROM xAnalytics_DW.dm.TDMA_1Dim_FlexHealthCheckGroup;

    -- (For validation) Counting how many records are in the temporary RunData table which shows us how many records we should expect to be inserted into the target.
    DECLARE @newRecordCount AS BIGINT
    SELECT @newRecordCount = SUM(Records_Captured) FROM [xAnalytics_DW].[dw].[TEMP_RunData];

    -- Truncate the temp table for RunData since it doesn't track the specific table and will be irrelevant since we run stored procedures back to back for every table.
    DECLARE @truncateRunDataTempTable AS NVARCHAR(4000) = 'TRUNCATE TABLE ' + @tempRunDataTable + N';'
    EXECUTE (@truncateRunDataTempTable)

    -- (For validation) Captures script end DATETIME
    DECLARE @endRunTime AS DATETIME = GETDATE();

    -- (For validation) Checking whether the expected record additions to the target actually occur and whether or not the amount of expected updates actually occur.
    -- The TotalRecordCountPassed and TotalUpdateCountPassed change depending on scenario.
    IF ((@targetCountAfterAdditions - @targetCountBeforeAdditions) = @newRecordCount)
        IF ((@targetCountBeforeDeletes - @targetCountBeforeAdditions) = @totalSourceUpdateCount)
            INSERT INTO [xAnalytics_DW].[dw].[RunData]
            VALUES (@sourceTable
                   ,@lastRuntime
                   ,@startRunTime
                   ,@endRunTime
                   ,@targetCountAfterAdditions - @targetCountBeforeAdditions
                   ,@newRecordCount
                   ,'Y'
                   ,@totalSourceUpdateCount
                   ,@targetCountBeforeDeletes - @targetCountBeforeAdditions
                   ,'Y');
        ELSE
            INSERT INTO [xAnalytics_DW].[dw].[RunData]
            VALUES (@sourceTable
                   ,@lastRuntime
                   ,@startRunTime
                   ,@endRunTime
                   ,@targetCountAfterAdditions - @targetCountBeforeAdditions
                   ,@newRecordCount
                   ,'Y'
                   ,@totalSourceUpdateCount
                   ,@targetCountBeforeDeletes - @targetCountBeforeAdditions
                   ,'N');
    ELSE
        IF ((@targetCountBeforeDeletes - @targetCountBeforeAdditions) = @totalSourceUpdateCount)
            INSERT INTO [xAnalytics_DW].[dw].[RunData]
            VALUES (@sourceTable
                   ,@lastRuntime
                   ,@startRunTime
                   ,@endRunTime
                   ,@targetCountAfterAdditions - @targetCountBeforeAdditions
                   ,@newRecordCount
                   ,'N'
                   ,@totalSourceUpdateCount
                   ,@targetCountBeforeDeletes - @targetCountBeforeAdditions
                   ,'Y');
        ELSE
            INSERT INTO [xAnalytics_DW].[dw].[RunData]
            VALUES (@sourceTable
                   ,@lastRuntime
                   ,@startRunTime
                   ,@endRunTime
                   ,@targetCountAfterAdditions - @targetCountBeforeAdditions
                   ,@newRecordCount
                   ,'N'
                   ,@totalSourceUpdateCount
                   ,@targetCountBeforeDeletes - @targetCountBeforeAdditions
                   ,'N');
GO

EXEC dw.sp_Populate_FlexHealthCheckGroup
