-- Iniciando fun��es de contagens e somas
Select
TOP(100)
	*
FROM
	FactSales

SELECT
	SUM(SalesQuantity) AS 'Total Vendido',
	SUM(ReturnQuantity) AS 'Total Devolvido'
FROM
	FactSales
-- Ao colocar mais de uma soma em SUM de colunas, precisa-se separar cada SUM com uma virgula


SELECT
	*
FROM
	DimProduct

SELECT
	COUNT(*) AS 'Total de Produtos'

FROM
	DimProduct

SELECT
	COUNT(ProductName) AS 'Qtd. Produtos'
FROM
	DimProduct

--O COUNT de contagem ��O CONSIDERA valores nulos


SELECT
	*
FROM
	DimProduct

SELECT
	COUNT(DISTINCT BrandName)
FROM
	DimProduct

-- A uni�o do COUNT + DISTINCT 

SELECT
	*
FROM
	DimProduct

SELECT
	MAX(UnitPrice) AS 'Pre�o M�ximo',
	MIN(UnitPrice) AS 'Pre�o Minimo'
FROM
	DimProduct


SELECT
	*
FROM
	DimCustomer

SELECT
	AVG(YearlyIncome) AS 'M�dia Anual de Sal�rio' --AVG tira a m�dia de um determinado per�odo escolhido
FROM
	DimCustomer


