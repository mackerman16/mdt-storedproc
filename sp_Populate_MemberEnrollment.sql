
/*
 * Function used to generate the insert statement used when combining the MemberEnrollment table
 * from many clients into one target table. The generated insert statement must be run once for each client. 
 *
 * Parameters:
 *      @table NVARCHAR(250) - the name of the target table we wish to enter the data into
 *      @dbname NVARCHAR(50) - the name of the client database we wish to pull the data from
 *      @lastRuntimeForClient DATETIME - the last time we captured data (@dbname)
 *
 * Returns:
 *      @constructedInsert NVARCHAR(4000) - the insert statement used to capture the MemberEnrollment data from a specific client and insert it into a target table
 */
CREATE FUNCTION dw.MemberEnrollment_GenerateInsert (@table NVARCHAR(250), @dbname NVARCHAR(50), @lastRuntime DATETIME) RETURNS NVARCHAR(4000) AS
BEGIN

    -- The insert statement used to capture the MemberEnrollment data and insert it into a target table.
    -- Note on WHERE clause: We add 1 second to From Date to retrieve all records inserted or updated that have happened since our last runtime.
    --                       Both dates in WHERE clause are converted to varchar in order for compare to work with '21' being the format of varchar
    --                       we want as a result of the convert. We have the To Date set to the future to compensate for the differing server times
    --                       causing records in the data mart with SYS_ETL_Timestamps set in the future.
    DECLARE @constructedInsert AS NVARCHAR(4000) = N'INSERT INTO ' + @table + 
                                                   N' SELECT TR_ID
                                                            ,Member_OID
                                                            ,Member_VID
                                                            ,ActionDate_Date_OID
                                                            ,EnrollmentID
                                                            ,ActionID
                                                            ,ActionDate
                                                            ,AddedBySystemUserId
                                                            ,AddedOn
                                                            ,GIGO_Flag
                                                            ,SYS_SourceDB
                                                            ,SYS_ETL_Timestamp
                                                            ,InactiveReasonId
                                                            ,InactiveReason
                                                            ,InaSYS_SourceDB
                                                            ,InaSYS_ETL_Timestamp
                                                            ,MemberId
                                                            ,MemberEnrollment_RUNNO_INSERT
                                                            ,CONCAT(SYS_SourceDB,' + ' - ' + 'Member_VID)
                                                   FROM ' + @dbname + N'.dm.TDMA_1Fct_MemberEnrollment
                                                   WHERE (SYS_ETL_Timestamp BETWEEN DATEADD(ss, 1, ''' + CONVERT(NVARCHAR(30), @lastRuntime, 21) + N''')
                                                          AND CONVERT(NVARCHAR(30), DATEADD(day, 5, GETDATE()), 21));'
    RETURN @constructedInsert
END

/*
 * Stored procedure that loops through all clients, captures the MemberEnrollment inserts and updates
 * (since the last time this procedure was ran), and enters the data into one combined target table.
 */ 
CREATE PROCEDURE dw.sp_Populate_MemberEnrollment AS

    -- The source table we wish to retrieve the inserts and updates from
    DECLARE @sourceTable AS NVARCHAR(100) = N'TDMA_1Fct_MemberEnrollment';

    -- Temporary table used during the process of moving data from client table to target table.
    DECLARE @tempTable AS NVARCHAR(100) = N'xAnalytics_DW.dw.TEMP_TDMA_1Fct_MemberEnrollment';

    -- Target table.
    DECLARE @targetTable AS NVARCHAR(100) = N'xAnalytics_DW.dm.TDMA_1Fct_MemberEnrollment';

    -- The variable we will momentarily store each client database name in as we loop through our cursor.
    DECLARE @dbname AS NVARCHAR(50)

    -- Truncate the temp table for MemberEnrollment.
    DECLARE @truncateTempTable AS NVARCHAR(4000) = 'TRUNCATE TABLE ' + @tempTable + N';'
    EXECUTE (@truncateTempTable)

    -- The cursor used to loop through our list of clients to capture their database name.
    DECLARE dbc CURSOR FOR
       SELECT SYS_SourceDB FROM xSTP_REPL.dbo.C_Client2

    -- Opening our declared cursor.
    OPEN dbc

        -- Looping through the cursor and storing each database name into the @dbname variable.
        FETCH FROM dbc INTO @dbname
        WHILE @@FETCH_STATUS = 0
        
        BEGIN
            BEGIN TRY

                -- Checking the last time we captured data.
                DECLARE @lastRuntime AS DATETIME
                SELECT @lastRuntime = MASTER_LastRunTimestamp
                                      FROM [xAnalytics_DW].[dw].[LastRunTimestamp]
                                      WHERE ID = 1;

                -- Calling our function to generate the insert statements to move the records to a temporary table.
                DECLARE @insert AS NVARCHAR(4000) = dw.MemberEnrollment_GenerateInsert(@tempTable, @dbname, @lastRuntime)
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
                                                                  INNER JOIN ' + @tempTable + N' b ON (a.TR_ID = b.TR_ID and a.SYS_SourceDB = b.SYS_SourceDB);'
    EXECUTE (@deleteUpdatedRecordsFromTarget)

    -- Inserts all records from temp to target.
    DECLARE @insertRecordsFromTempToTarget AS NVARCHAR(4000) = N'INSERT INTO ' + @targetTable + 
                                                               N' SELECT TR_ID
                                                                        ,Member_OID
                                                                        ,Member_VID
                                                                        ,ActionDate_Date_OID
                                                                        ,EnrollmentID
                                                                        ,ActionID
                                                                        ,ActionDate
                                                                        ,AddedBySystemUserId
                                                                        ,AddedOn
                                                                        ,GIGO_Flag
                                                                        ,SYS_SourceDB
                                                                        ,SYS_ETL_Timestamp
                                                                        ,InactiveReasonId
                                                                        ,InactiveReason
                                                                        ,InaSYS_SourceDB
                                                                        ,InaSYS_ETL_Timestamp
                                                                        ,MemberId
                                                                        ,MemberEnrollment_RUNNO_INSERT
                                                                        ,CONCAT(SYS_SourceDB,' + ' - ' + 'Member_VID)
                                                                 FROM ' + @tempTable + N';'
    EXECUTE (@insertRecordsFromTempToTarget)

GO

EXEC dw.sp_Populate_MemberEnrollment
