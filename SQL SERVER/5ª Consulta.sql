--Join , chaves estrangeiras e chaves primárias , Tabela Fato e tabela Dimensão
-- LEFT (OUTER) JOIN - MUITO USADO
-- RIGHT (OUTER) JOIN
-- INNER JOIN - MUITO USADO
-- FULL (OUTER) JOIN
-- LEFT (ANTI) JOIN (LEFT JOIN + ON CHAVE = CHAVE + WHERE (IS NULL)
-- RIGHT(ANTI) JOIN (RIGHT JOIN + ON CHAVE = CHAVE + WHERE (IS NULL)
-- FULL (ANTI) JOIN (FULL JOIN + ON CHAVE - CHAVE + WHERE (IS NULL) OR OUTRA TABELA (IS NULL))
--Quando se tem colunas com o mesmo nome das duas tabelas é necessário colocar (NOME TABELA.NOME COLUNA

SELECT
	ProductKey,
	ProductName,
	ProductSubcategoryKey
FROM
	DimProduct

SELECT
	ProductSubcategoryKey,
	ProductSubcategoryName
FROM
	DimProductSubcategory


SELECT
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
FROM
	DimProduct
		INNER JOIN DimProductSubcategory
ON
	DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductCategoryKey

SELECT
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
FROM
	DimProduct
		LEFT JOIN DimProductSubcategory
ON
	DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductCategoryKey

SELECT
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
FROM
	DimProduct
		RIGHT JOIN DimProductSubcategory
ON
	DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductCategoryKey


-- CROSS JOIN Produto cartesiano (ele passa para a tabela principal uma caracteristica para cada informação da segunda tabela para a primeira

-- Multiplos JOINs

SELECT
	ProductKey,
	ProductName,
	ProductSubcategoryKey
FROM
	DimProduct

SELECT
	ProductSubcategoryKey,
	ProductSubCategoryName,
	ProductCategoryKey
FROM
	DimProductSubcategory

SELECT
	ProductCategoryKey,
	ProductCategoryName
FROM
	DimProductCategory

SELECT
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductCategoryName
FROM
	DimProduct
		INNER JOIN DimProductSubcategory
ON
	DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		INNER JOIN DimProductCategory
ON
	DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey


-- UNION E UNION ALL (utilizado quando existem duas ou mais tabelas com as mesmas colunas e quantidades)
-- UNION - Une duas ou mais tabelas de forma simplificada excluindo todas as linhas duplicadas
-- UNION ALL - Une duas ou mais tabelas de forma simplificada, mantendo até as linhas duplicadas

