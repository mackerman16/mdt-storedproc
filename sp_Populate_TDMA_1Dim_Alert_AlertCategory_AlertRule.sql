
/*
 * Function used to generate the insert statement used when combining the Alert_AlertCategory_AlertRule table
 * from many clients into one target table. The generated insert statement must be run once for each client. 
 *
 * Parameters:
 *      @table NVARCHAR(250) - the name of the target table we wish to enter the data into
 *      @dbname NVARCHAR(50) - the name of the client database we wish to pull the data from
 *      @lastRuntimeForClient DATETIME - the last time we captured data (@dbname)
 *
 * Returns:
 *      @constructedInsert NVARCHAR(4000) - the insert statement used to capture the Alert_AlertCategory_AlertRule data from a specific client and insert it into a target table
 */
CREATE FUNCTION dw.Alert_AlertCategory_AlertRule_GenerateInsert (@table NVARCHAR(250), @dbname NVARCHAR(50), @lastRuntime DATETIME) RETURNS NVARCHAR(4000) AS
BEGIN

    -- The insert statement used to capture the Alert_AlertCategory_AlertRule data and insert it into a target table.
    -- Note on WHERE clause: We add 1 second to From Date to retrieve all records inserted or updated that have happened since our last runtime.
    --                       Both dates in WHERE clause are converted to varchar in order for compare to work with '21' being the format of varchar
    --                       we want as a result of the convert. We have the To Date set to the future to compensate for the differing server times
    --                       causing records in the data mart with SYS_ETL_Timestamps set in the future.
    DECLARE @constructedInsert AS NVARCHAR(4000) = N'INSERT INTO ' + @table + 
                                                   N' SELECT [Alert_VID]
      ,[Alert_FromDate]
      ,[Alert_ToDate]
      ,[Alert_OID]
      ,[AlertId]
      ,[AlertCategoryId]
      ,[AlertCategory]
      ,[AlertCategory_LastUpdated]
      ,[AlertCategory_SystemUserId]
      ,[AlertCategory_SYS_SourceDB]
      ,[AlertCategory_SYS_ETL_Timestamp]
      ,[AlertName]
      ,[AlertDescription]
      ,[AlertImageFilename]
      ,[Alert_LastUpdated]
      ,[Alert_SystemUserId]
      ,[Alert_SYS_SourceDB]
      ,[Alert_SYS_ETL_Timestamp]
      ,[AlertRuleMappingId]
      ,[AlertRuleId]
      ,[AlertRule_RuleDescription]
      ,[AlertRule_RuleLogic]
      ,[AlertRule_LastUpdated]
      ,[AlertRule_SystemUserId]
      ,[AlertRule_SYS_SourceDB]
      ,[AlertRule_SYS_ETL_Timestamp]
      ,[AlertRuleMapping_LastUpdated]
      ,[AlertRuleMapping_SystemUserId]
      ,[AlertRuleMapping_SYS_SourceDB]
      ,[AlertRuleMapping_SYS_ETL_Timestamp]
      ,[OBSOLETE__INDICATION]
      ,[Alert_RUNNO_INSERT]
      ,[Alert_RUNNO_UPDATE]
      ,CONCAT(Alert_SYS_SourceDB,' + ' - ' + 'Alert_VID)
      FROM ' + @dbname + N'_DW.dm.TDMA_1Dim_Alert_AlertCategory_AlertRule
      WHERE (Alert_SYS_ETL_Timestamp BETWEEN DATEADD(ss, 1, ''' + CONVERT(NVARCHAR(30), @lastRuntime, 21) + N''')
                               AND CONVERT(NVARCHAR(30), DATEADD(day, 5, GETDATE()), 21));'
    RETURN @constructedInsert
END

/*
 * Stored procedure that loops through all clients, captures the Alert_AlertCategory_AlertRule inserts and updates
 * (since the last time this procedure was ran), and enters the data into one combined target table.
 */ 
CREATE PROCEDURE dw.sp_Populate_Alert_AlertCategory_AlertRule AS

    -- (For validation) Captures script start DATETIME
    DECLARE @startRunTime AS DATETIME = GETDATE();

    -- The source table we wish to retrieve the inserts and updates from
    DECLARE @sourceTable AS NVARCHAR(100) = N'TDMA_1Dim_Alert_AlertCategory_AlertRule';

    -- Temporary table used during the process of moving data from client table to target table.
    DECLARE @tempTable AS NVARCHAR(100) = N'Analytics_DW.dw.TEMP_TDMA_1Dim_Alert_AlertCategory_AlertRule';

    -- Target table.
    DECLARE @targetTable AS NVARCHAR(100) = N'Analytics_DW.dm.TDMA_1Dim_Alert_AlertCategory_AlertRule';

    -- Temporary table used during data quality validation.
    DECLARE @tempRunDataTable AS NVARCHAR(100) = N'Analytics_DW.dw.TEMP_RunData';

    -- The variable we will momentarily store each client database name in as we loop through our cursor.
    DECLARE @dbname AS NVARCHAR(50)

    -- Checking the last time we captured data.
    DECLARE @lastRuntime AS DATETIME
    SELECT @lastRuntime = MASTER_LastRunTimestamp
                          FROM [Analytics_DW].[dw].[LastRunTimestamp]
                          WHERE ID = 1;

    -- Truncate the temp table for Alert_AlertCategory_AlertRule.
    DECLARE @truncateTempTable AS NVARCHAR(4000) = 'TRUNCATE TABLE ' + @tempTable + N';'
    EXECUTE (@truncateTempTable)

    -- The cursor used to loop through our list of clients to capture their database name.
    DECLARE dbc CURSOR FOR
       SELECT SYS_SourceDB FROM Analytics_DW.dw.C_Client

    -- Opening our declared cursor.
    OPEN dbc

        -- Looping through the cursor and storing each database name into the @dbname variable.
        FETCH FROM dbc INTO @dbname
        WHILE @@FETCH_STATUS = 0
        
        BEGIN
            BEGIN TRY
                -- Checks how many records we should be capturing from Alert_AlertCategory_AlertRule for each client and stores them in a temporary table.
                DECLARE @countAndTrackNewRecords AS NVARCHAR(4000) =
                            N'DECLARE @newRecordsCounted AS BIGINT;
                              SELECT @newRecordsCounted = COUNT(*)FROM ' + @dbname + N'_DW.dm.' + @sourceTable + '
                                                          WHERE (Alert_SYS_ETL_Timestamp BETWEEN DATEADD(ss, 1, ''' + CONVERT(NVARCHAR(30), @lastRuntime, 21) + N''')
                                                                                   AND CONVERT(NVARCHAR(30), DATEADD(day, 5, GETDATE()), 21));;
                              INSERT INTO ' + @tempRunDataTable + N'
                              VALUES (''' + @dbname + N''', @newRecordsCounted);'
                EXECUTE (@countAndTrackNewRecords)

                -- Calling our function to generate the insert statements to move the records to a temporary table.
                DECLARE @insert AS NVARCHAR(4000) = dw.Alert_AlertCategory_AlertRule_GenerateInsert(@tempTable, @dbname, @lastRuntime)
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
    SELECT @targetCountBeforeDeletes = COUNT(*) FROM Analytics_DW.dm.TDMA_1Dim_Alert_AlertCategory_AlertRule;

    -- (For validation) Counts how many records are updates
    DECLARE @totalsourceUpdateCount AS BIGINT
    SELECT @totalsourceUpdateCount = COUNT(*)
                               FROM [Analytics_DW].[dm].[TDMA_1Dim_Alert_AlertCategory_AlertRule] a 
                               INNER JOIN [Analytics_DW].[dw].[TEMP_TDMA_1Dim_Alert_AlertCategory_AlertRule] b ON (a.Alert_VID = b.Alert_VID and a.Alert_SYS_SourceDB = b.Alert_SYS_SourceDB);


    -- Delete the updates (exist in temp and target) from the target.
    DECLARE @deleteUpdatedRecordsFromTarget AS NVARCHAR(4000) = N'DELETE ' + @targetTable + N' 
                                                                  FROM ' + @targetTable + N' a 
                                                                  INNER JOIN ' + @tempTable + N' b ON (a.Alert_VID = b.Alert_VID and a.Alert_SYS_SourceDB = b.Alert_SYS_SourceDB);'
    EXECUTE (@deleteUpdatedRecordsFromTarget)

    -- (For validation) Counting how many records are in the target before we make additions.
    DECLARE @targetCountBeforeAdditions AS BIGINT
    SELECT @targetCountBeforeAdditions = COUNT(*) FROM Analytics_DW.dm.TDMA_1Dim_Alert_AlertCategory_AlertRule;


    -- Inserts all records from temp to target.
    DECLARE @insertRecordsFromTempToTarget AS NVARCHAR(4000) = N'INSERT INTO ' + @targetTable + 
                                                               N' SELECT [Alert_VID]
      ,[Alert_FromDate]
      ,[Alert_ToDate]
      ,[Alert_OID]
      ,[AlertId]
      ,[AlertCategoryId]
      ,[AlertCategory]
      ,[AlertCategory_LastUpdated]
      ,[AlertCategory_SystemUserId]
      ,[AlertCategory_SYS_SourceDB]
      ,[AlertCategory_SYS_ETL_Timestamp]
      ,[AlertName]
      ,[AlertDescription]
      ,[AlertImageFilename]
      ,[Alert_LastUpdated]
      ,[Alert_SystemUserId]
      ,[Alert_SYS_SourceDB]
      ,[Alert_SYS_ETL_Timestamp]
      ,[AlertRuleMappingId]
      ,[AlertRuleId]
      ,[AlertRule_RuleDescription]
      ,[AlertRule_RuleLogic]
      ,[AlertRule_LastUpdated]
      ,[AlertRule_SystemUserId]
      ,[AlertRule_SYS_SourceDB]
      ,[AlertRule_SYS_ETL_Timestamp]
      ,[AlertRuleMapping_LastUpdated]
      ,[AlertRuleMapping_SystemUserId]
      ,[AlertRuleMapping_SYS_SourceDB]
      ,[AlertRuleMapping_SYS_ETL_Timestamp]
      ,[OBSOLETE__INDICATION]
      ,[Alert_RUNNO_INSERT]
      ,[Alert_RUNNO_UPDATE]
      ,[Alert_SYS_SourceDB_Alert_VID]
       FROM ' + @tempTable + N';'
    EXECUTE (@insertRecordsFromTempToTarget)

    -- (For validation) Counting how many records are in the target after we make additions.
    DECLARE @targetCountAfterAdditions AS BIGINT
    SELECT @targetCountAfterAdditions = COUNT(*) FROM Analytics_DW.dm.TDMA_1Dim_Alert_AlertCategory_AlertRule;

    -- (For validation) Counting how many records are in the temporary RunData table which shows us how many records we should expect to be inserted into the target.
    DECLARE @newRecordCount AS BIGINT
    SELECT @newRecordCount = SUM(Records_Captured) FROM [Analytics_DW].[dw].[TEMP_RunData];

    -- Truncate the temp table for RunData since it doesn't track the specific table and will be irrelevant since we run stored procedures back to back for every table.
    DECLARE @truncateRunDataTempTable AS NVARCHAR(4000) = 'TRUNCATE TABLE ' + @tempRunDataTable + N';'
    EXECUTE (@truncateRunDataTempTable)

    -- (For validation) Captures script end DATETIME
    DECLARE @endRunTime AS DATETIME = GETDATE();

    -- (For validation) Checking whether the expected record additions to the target actually occur and whether or not the amount of expected updates actually occur.
    -- The TotalRecordCountPassed and TotalUpdateCountPassed change depending on scenario.
    IF ((@targetCountAfterAdditions - @targetCountBeforeAdditions) = @newRecordCount)
        IF ((@targetCountBeforeDeletes - @targetCountBeforeAdditions) = @totalSourceUpdateCount)
            INSERT INTO [Analytics_DW].[dw].[RunData]
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
            INSERT INTO [Analytics_DW].[dw].[RunData]
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
            INSERT INTO [Analytics_DW].[dw].[RunData]
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
            INSERT INTO [Analytics_DW].[dw].[RunData]
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

EXEC dw.sp_Populate_Alert_AlertCategory_AlertRule
