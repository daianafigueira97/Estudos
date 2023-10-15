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

-- Este � um coment�rio dentro do ambiente SQL, composto por 2 tra�os para n�o considerar como c�digo em partes do c�digos ou em coment�rios em texto
-- Quando se coloca /* se comenta um bloco todo de informa��es e comandos, colando o fim em seu coment�rio ao adicionar */ ao final do trecho com a necessidade de coment�rio

SELECT TOP 10 
	* 
FROM 
	DimProduct
SELECT TOP 10 PERCENT 
	*
FROM 
	DimCustomer -- Tr�s uma porcentagem da tabela conforme determinada pelo comando


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