--Creating a temporary Table for EOM Data 
DROP TABLE IF EXISTS #EOMDate
CREATE TABLE #EOMDate
(EOMDate date)

/*Create a EOM table*/

--variable field
DECLARE @StartDate AS DATE = '2018-01-01'
DECLARE @LatestAvailableDate AS DATE = GETDATE()
DECLARE @TotalNumberOfMonths AS int = DATEDIFF(MONTH, @StartDate, @LatestAvailableDate)
DECLARE @EOM AS DATE

--assigning each data to the temp table
DECLARE @counter AS int = 0
DECLARE @totalCount AS int = @TotalNumberOfMonths

WHILE @counter<@totalCount
BEGIN
	SET @EOM = EOMONTH(@StartDate, @counter)
	INSERT INTO #EOMDate
	VALUES(@EOM)
	SET @counter = @counter + 1
END 

SELECT * FROM #EOMDate