SELECT 
	* FROM 
	DimCustomer


SELECT 
	* 
FROM 
	DimStore


SELECT 
	StoreKey, 
	StoreName, 
	StorePhone 
FROM 
	DimStore


SELECT 
	* 
FROM 
	DimProduct


SELECT 
	ProductName, 
	BrandName 
FROM 
	DimProduct

-- Este é um comentário dentro do ambiente SQL, composto por 2 traços para não considerar como código em partes do códigos ou em comentários em texto
-- Quando se coloca /* se comenta um bloco todo de informações e comandos, colando o fim em seu comentário ao adicionar */ ao final do trecho com a necessidade de comentário

SELECT TOP 10 
	* 
FROM 
	DimProduct
SELECT TOP 10 PERCENT 
	*
FROM 
	DimCustomer -- Trás uma porcentagem da tabela conforme determinada pelo comando


-- Comando DISTINCT: Retorna os valores distintos de uma tabela

SELECT DISTINCT	
	ColorName 
FROM 
	DimProduct


SELECT
	DISTINCT DepartmentName
FROM
	DimEmployee


-- Comando AS: Renomeando colunas (aliasing)

SELECT
	ProductName AS 'Produto',
	BrandName AS 'Marca',
	ColorName AS 'Cor'
FROM
	DimProduct