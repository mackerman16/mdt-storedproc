
/*
 * Function used to generate the insert statement used when combining the Member_MemberDetail table
 * from many clients into one target table. The generated insert statement must be run once for each client. 
 *
 * Parameters:
 *      @table NVARCHAR(250) - the name of the target table we wish to enter the data into
 *      @dbname NVARCHAR(50) - the name of the client database we wish to pull the data from
 *      @lastRuntimeForClient DATETIME - the last time we pulled data from the client (@dbname)
 *
 * Returns:
 *      @constructedInsert NVARCHAR(4000) - the insert statement used to capture the Member_MemberDetail data from a specific client and insert it into a target table
 */
CREATE FUNCTION dw.Member_MemberDetail_GenerateInsert (@table NVARCHAR(250), @dbname NVARCHAR(50), @lastRuntime DATETIME) RETURNS NVARCHAR(4000) AS
BEGIN

    -- The insert statement used to capture the Member_MemberDetail data and insert it into a target table.
    -- Note on WHERE clause: We add 1 second to From Date to retrieve all records inserted or updated that have happened since our last runtime.
    --                       Both dates in WHERE clause are converted to varchar in order for compare to work with '21' being the format of varchar
    --                       we want as a result of the convert. We have the To Date set to the future to compensate for the differing server times
    --                       causing records in the data mart with SYS_ETL_Timestamps set in the future.
    DECLARE @constructedInsert AS NVARCHAR(MAX) =
    N'INSERT INTO ' + @table + 
    N' SELECT Member_VID
      ,Member_FromDate
      ,Member_ToDate
      ,Member_OID
      ,ChartId
      ,Title
      ,FirstName
      ,MiddleName
      ,LastName
      ,Street
      ,Street2
      ,City
      ,State
      ,Zip
      ,Email
      ,DateOfBirth
      ,SSN
      ,Gender
      ,MaritalStatus
      ,RaceId
      ,LastUpdated
      ,SystemUserId
      ,LockRelationshipID
      ,LockTime
      ,RelatedSystemUserId
      ,BusinessUnit
      ,MailingSameAsHome
      ,MailingStreet
      ,MailingStreet2
      ,MailingCity
      ,MailingState
      ,MailingZip
      ,PassCode
      ,WebUserName
      ,ServiceRequestId
      ,SYS_SourceDB
      ,SYS_ETL_Timestamp
      ,MemberId
      ,Height
      ,FrameSize
      ,ManagedGroupId
      ,Occupation
      ,RiskArea
      ,CodeStatus
      ,AdDirectives
      ,DisabilityStatus
      ,InsPrimaryName
      ,InsPrimaryNumber
      ,InsPrimaryGroup
      ,InsPrimaryComment
      ,InsSecondaryName
      ,InsSecondaryNumber
      ,InsSecondaryGroup
      ,InsSecondaryComment
      ,ActiveDate
      ,InactiveDate
      ,InactiveReasonId
      ,TimeZoneId
      ,BestTimeToCall
      ,InsPrimaryEffectiveDate
      ,InsPrimaryTermDate
      ,InsSecondaryEffectiveDate
      ,InsSecondaryTermDate
      ,ProgramType
      ,BillDate
      ,GoalNote
      ,MemSYS_SourceDB
      ,MemSYS_ETL_Timestamp
      ,Primary_LanguageId
      ,Primary_LanguageText
      ,Primary_SYS_SourceDB
      ,Primary_SYS_ETL_Timestamp
      ,Secondary_LanguageId
      ,Secondary_LanguageText
      ,Secondary_SYS_SourceDB
      ,Secondary_SYS_ETL_Timestamp
      ,Program
      ,MonitoringPeriod
      ,MonitoringDays_SYS_SourceDB
      ,MonitoringDays_SYS_ETL_Timestamp
      ,OBSOLETE__INDICATION
      ,Member_RUNNO_INSERT
      ,Member_RUNNO_UPDATE
      ,CONCAT(SYS_SourceDB,' + ' - ' + 'Member_VID)
      FROM ' + @dbname + N'.dm.TDMA_1Dim_Member_MemberDetail
      WHERE (SYS_ETL_Timestamp BETWEEN DATEADD(ss, 1, ''' + CONVERT(NVARCHAR(30), @lastRuntime, 21) + N''')
             AND CONVERT(NVARCHAR(30), DATEADD(day, 5, GETDATE()), 21));'
    RETURN @constructedInsert
END

/*
 * Stored procedure that loops through all clients, captures the Member_MemberDetail inserts and updates
 * (since the last time this procedure was ran), and enters the data into one combined target table.
 */
CREATE PROCEDURE dw.sp_Populate_Member_MemberDetail AS

    -- The source table we wish to retrieve the inserts and updates from
    DECLARE @sourceTable AS NVARCHAR(100) = N'TDMA_1Dim_Member_MemberDetail';

    -- Temporary table used during the process of moving data from client table to target table.
    DECLARE @tempTable AS NVARCHAR(100) = N'xAnalytics_DW.dw.TEMP_TDMA_1Dim_Member_MemberDetail';

    -- Target table.
    DECLARE @targetTable AS NVARCHAR(100) = N'xAnalytics_DW.dm.TDMA_1Dim_Member_MemberDetail';

    -- Temporary table used during data quality validation.
    DECLARE @tempRunDataTable AS NVARCHAR(100) = N'xAnalytics_DW.dw.TEMP_RunData';

    -- The variable we will momentarily store each client database name in as we loop through our cursor.
    DECLARE @dbname AS NVARCHAR(50)

    -- Checking the last time we captured data.
    DECLARE @lastRuntime AS DATETIME
    SELECT @lastRuntime = MASTER_LastRunTimestamp
                          FROM [xAnalytics_DW].[dw].[LastRunTimestamp]
                          WHERE ID = 1;

    -- Truncate the temp table for Member_MemberDetail.
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
                -- Checks how many records we should be capturing from Member_MemberDetail for each client and stores them in a temporary table.
                DECLARE @countAndTrackNewRecords AS NVARCHAR(4000) =
                            N'DECLARE @newRecordsCounted AS BIGINT;
                              SELECT @newRecordsCounted = COUNT(*)FROM ' + @dbname + N'.dm.' + @sourceTable + '
                                                          WHERE (SYS_ETL_Timestamp BETWEEN DATEADD(ss, 1, ''' + CONVERT(NVARCHAR(30), @lastRuntime, 21) + N''')
                                                                                   AND CONVERT(NVARCHAR(30), DATEADD(day, 5, GETDATE()), 21));;
                              INSERT INTO ' + @tempRunDataTable + N'
                              VALUES (''' + @dbname + N''', @newRecordsCounted);'
                EXECUTE (@countAndTrackNewRecords)

                -- Calling our function to generate the insert statements to move the records to a temporary table.
                DECLARE @insert AS NVARCHAR(4000) = dw.Member_MemberDetail_GenerateInsert(@tempTable, @dbname, @lastRuntime)
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
                                                                  INNER JOIN ' + @tempTable + N' b ON (a.Member_VID = b.Member_VID and a.SYS_SourceDB = b.SYS_SourceDB);'
    EXECUTE (@deleteUpdatedRecordsFromTarget)

    -- (For validation) Counting how many records are in the target before we make additions.
    DECLARE @targetCountBeforeAdditions AS BIGINT
    SELECT @targetCountBeforeAdditions = COUNT(*) FROM xAnalytics_DW.dm.TDMA_1Dim_Member_MemberDetail;

    -- Inserts all records from temp to target.
    DECLARE @insertRecordsFromTempToTarget AS NVARCHAR(4000) =
    N'INSERT INTO ' + @targetTable + 
    N' SELECT Member_VID
      ,Member_FromDate
      ,Member_ToDate
      ,Member_OID
      ,ChartId
      ,Title
      ,FirstName
      ,MiddleName
      ,LastName
      ,Street
      ,Street2
      ,City
      ,State
      ,Zip
      ,Email
      ,DateOfBirth
      ,SSN
      ,Gender
      ,MaritalStatus
      ,RaceId
      ,LastUpdated
      ,SystemUserId
      ,LockRelationshipID
      ,LockTime
      ,RelatedSystemUserId
      ,BusinessUnit
      ,MailingSameAsHome
      ,MailingStreet
      ,MailingStreet2
      ,MailingCity
      ,MailingState
      ,MailingZip
      ,PassCode
      ,WebUserName
      ,ServiceRequestId
      ,SYS_SourceDB
      ,SYS_ETL_Timestamp
      ,MemberId
      ,Height
      ,FrameSize
      ,ManagedGroupId
      ,Occupation
      ,RiskArea
      ,CodeStatus
      ,AdDirectives
      ,DisabilityStatus
      ,InsPrimaryName
      ,InsPrimaryNumber
      ,InsPrimaryGroup
      ,InsPrimaryComment
      ,InsSecondaryName
      ,InsSecondaryNumber
      ,InsSecondaryGroup
      ,InsSecondaryComment
      ,ActiveDate
      ,InactiveDate
      ,InactiveReasonId
      ,TimeZoneId
      ,BestTimeToCall
      ,InsPrimaryEffectiveDate
      ,InsPrimaryTermDate
      ,InsSecondaryEffectiveDate
      ,InsSecondaryTermDate
      ,ProgramType
      ,BillDate
      ,GoalNote
      ,MemSYS_SourceDB
      ,MemSYS_ETL_Timestamp
      ,Primary_LanguageId
      ,Primary_LanguageText
      ,Primary_SYS_SourceDB
      ,Primary_SYS_ETL_Timestamp
      ,Secondary_LanguageId
      ,Secondary_LanguageText
      ,Secondary_SYS_SourceDB
      ,Secondary_SYS_ETL_Timestamp
      ,Program
      ,MonitoringPeriod
      ,MonitoringDays_SYS_SourceDB
      ,MonitoringDays_SYS_ETL_Timestamp
      ,OBSOLETE__INDICATION
      ,Member_RUNNO_INSERT
      ,Member_RUNNO_UPDATE
      ,CONCAT(SYS_SourceDB,' + ' - ' + 'Member_VID)
      FROM ' + @tempTable + N';'

    EXECUTE (@insertRecordsFromTempToTarget)

    -- (For validation) Counting how many records are in the target after we make additions.
    DECLARE @targetCountAfterAdditions AS BIGINT
    SELECT @targetCountAfterAdditions = COUNT(*) FROM xAnalytics_DW.dm.TDMA_1Dim_Member_MemberDetail;

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

EXEC dw.sp_Populate_Member_MemberDetail