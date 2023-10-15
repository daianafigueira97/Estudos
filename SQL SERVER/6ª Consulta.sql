--Junção de GROPY BY com INNER JOIN
SELECT TOP 100
	*
FROM
	FactSales

SELECT
	*
FROM
	DimDate


SELECT
	CalendarYear AS 'Ano',
	SUM(SalesQuantity) AS 'Total Vendido'
FROM
	FactSales
		INNER JOIN DimDate
ON
	FactSales.DateKey = DimDate.Datekey
WHERE
	CalendarMonthLabel = 'January'
GROUP BY
	CalendarYear
HAVING
	SUM(SalesQuantity)>= 120000
ORDER BY
	[Total Vendido] DESC
	