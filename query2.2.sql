DROP TABLE IF EXISTS ##EntireData 

SELECT * 
INTO ##EntireData 
FROM ##EOMDate
CROSS JOIN ##CurrentStatus

