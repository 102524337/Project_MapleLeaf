DECLARE @targetDate date
SET @targetDate = '2022-02-28'

SELECT *
FROM(
 SELECT *
,ISValid = CASE WHEN (expired_date>@targetDate OR expired_date IS NULL) AND effective_date<@targetDate Then 'Y' ELSE 'N' END 
FROM dbo.CanadianLawyers
) CurrentStatus
WHERE ISValid = 'Y'

