-- Dando inicio aos agrupamentos e agregações conjuntas
SELECT
	*
FROM
	DimProduct

SELECT
	BrandName AS 'Nome da marca',
	COUNT(*) AS 'Qtd. Total'
FROM
	DimProduct
GROUP BY
	BrandName
--Sempre colocar a virgula para separar as informações que serão trazidas quando forem mais de uma

SELECT
	*
FROM
	DimStore

SELECT
	StoreType AS 'Tipo de loja',
	SUM(EmployeeCount) AS 'Quantidade vendida'
FROM
	DimStore
GROUP BY
	StoreType

SELECT
	*
FROM
	DimProduct

SELECT
	BrandName,
	AVG(UnitCost)
FROM
	DimProduct
GROUP BY
	BrandName


SELECT
	*
FROM
	DimProduct

SELECT
	ClassName,
	MAX(UnitPrice) AS 'Preço Máximo'
FROM
	DimProduct
GROUP BY
	ClassName


-- GROUP BY com ORDER BY
SELECT
	*
FROM
	DimStore

SELECT TOP 10
	StoreType As 'Tipo Loja',
	COUNT(StoreType) AS 'Qtd. Por loja'
FROM
	DimStore
GROUP BY
	StoreType
Order BY
	[Qtd. Por loja] DESC


SELECT
	*
FROM
	DimStore

SELECT
	StoreType,
	Sum(EmployeeCount) AS 'Total de Funcionários'
FROM
	DimStore
GROUP BY
	StoreType
ORDER BY
	Sum(EmployeeCount) DESC


-- GROUP BY + WHERE
SELECT
	*
FROM
	DimProduct

SELECT
	ColorName AS 'Cor do Produto',
	COUNT(*) AS 'Total dos produtos'
FROM
	DimProduct
WHERE
	BrandName = 'Contoso'
GROUP BY
	ColorName

--GROUP BY + HAVING (HAVING permite realizar o agrupamento com alguns outros critérios)
SELECT
	*
FROM
	DimProduct

SELECT
	BrandName AS 'Marca',
	COUNT(BrandName) AS 'Total por Marca'
FROM
	DimProduct
GROUP BY 
	BrandName
HAVING
	COUNT(BrandName) >=200