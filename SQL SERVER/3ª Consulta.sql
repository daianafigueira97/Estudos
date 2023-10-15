-- Iniciando funções de contagens e somas
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

--O COUNT de contagem ÑÃO CONSIDERA valores nulos


SELECT
	*
FROM
	DimProduct

SELECT
	COUNT(DISTINCT BrandName)
FROM
	DimProduct

-- A união do COUNT + DISTINCT 

SELECT
	*
FROM
	DimProduct

SELECT
	MAX(UnitPrice) AS 'Preço Máximo',
	MIN(UnitPrice) AS 'Preço Minimo'
FROM
	DimProduct


SELECT
	*
FROM
	DimCustomer

SELECT
	AVG(YearlyIncome) AS 'Média Anual de Salário' --AVG tira a média de um determinado período escolhido
FROM
	DimCustomer


