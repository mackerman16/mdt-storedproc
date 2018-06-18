
/*
 * Stored procedure that sets LastRunTimestamp to today at midnight.
 */ 
CREATE PROCEDURE dw.sp_LastRunTimestamp_Generator AS

    -- Inserting the new run timestamps for the clients we just ran the procedure on.
    DECLARE @updateLastRunTimestamp AS NVARCHAR(2000) = N'UPDATE [xAnalytics_DW].[dw].[LastRunTimestamp]
                                                          SET MASTER_LastRunTimestamp = ' + Convert(NVARCHAR, DATEDIFF(DAY, 0, GETDATE())) + 
                                                        N' WHERE ID = 1;'
    EXECUTE(@updateLastRunTimestamp)

GO

EXEC dw.sp_LastRunTimestamp_Generator