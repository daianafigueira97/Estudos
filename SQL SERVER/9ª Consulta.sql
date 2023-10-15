-- Funções condicionais
-- CASE, IFF e ISNULL
DECLARE
	@nota FLOAT = 7
SELECT
	CASE
		WHEN @nota >= 6 THEN 'Aprovado'
		ELSE 'Reprovado'
	END AS 'Situação'

DECLARE
	@datavenc DATETIME = '10/03/2023',
	@dataatual DATETIME = GETDATE()
SELECT
	CASE
		WHEN @dataatual <= @datavenc THEN 'Dentro da validade'
		ELSE 'Produto vencido'
	END AS 'Status de validade'

SELECT
	CustomerKey AS 'ID',
	FirstName AS 'Nome',
	Gender AS 'Gênero',
	CASE
	 WHEN Gender = 'F' THEN 'Feminino'
	 WHEN Gender = 'M' THEN 'Masculino'
	 ELSE 'Empresa'
	End AS 'Genero extensivo'
FROM
	DimCustomer

-- Case com mais de um teste lógico sempre vai verificar em relação a número do maior para o teste com valor menor
DECLARE
	@preco FLOAT = 5000
SELECT
	CASE
		WHEN @preco >= 4000 THEN 'Luxo'
		WHEN @preco >= 1000 THEN 'Econômico'
		ELSE 'Básico'
	END AS 'Categoria de produto'


-- Case com operadores lógicos AND e OR
SELECT
	ProductName AS 'Nome do produto',
	BrandName AS 'Marca do produto',
	ColorName AS 'Cor do produto',
	UnitPrice AS 'Preço do produto',
	CASE
		WHEN BrandName = 'Contoso' AND ColorName = 'Red' THEN 0.10
		ELSE 0
	END AS '% DO DESCONTO',
	CASE
		WHEN  BrandName = 'Contoso' AND ColorName = 'Red' THEN 
		 ROUND(UnitPrice * (1 - 0.1),2)
		ELSE ROUND(UnitPrice, 2)
	END AS 'Preço com desconto'
FROM
	DimProduct
DECLARE
	@porcent DECIMAL(5,2) = 0.10 * 100
PRINT @porcent
SELECT
	ProductName AS 'Nome do produto',
	BrandName AS 'Marca do produto',
	ColorName AS 'Cor do produto',
	UnitPrice AS 'Preço do produto',
	CONCAT(CASE
		WHEN BrandName = 'Contoso' OR ColorName = 'Red' THEN @porcent
		ELSE 0
	END, '%') AS '% DO DESCONTO',
	CASE
		WHEN  BrandName = 'Contoso' OR ColorName = 'Red' THEN 
		 ROUND(UnitPrice * (1 - 0.1),2)
		ELSE ROUND(UnitPrice, 2)
	END AS 'Bônus'
FROM
	DimProduct


-- Case dentro de Case
SELECT
	FirstName,
	Title,
	SalariedFlag,
	CASE
		WHEN Title = 'Sales Goup Manager' THEN 
	CASE
		WHEN SalariedFlag = 1 THEN 0.3
		ELSE 0.2
	END
		WHEN Title = 'Sales Region Manager' THEN 0.15
		WHEN Title = 'Sales State Manager' THEN 0.07
		ELSE 0.02
	END AS 'Desconto a ser aplicado'
FROM
	DimEmployee


-- CASE ADITIVO: Podendo realizar a soma de dois cases para trazer um resultado somado, subtraido, dividido ou multiplicado pelo outro


-- IIF ALTERNATIVA AO CASE
DECLARE
	@classificacao INT = 9
SELECT
	IIF(
		@classificacao >=5,
		'Risco Alto',
		'Risco Baixo')

SELECT
	CustomerKey,
	CustomerType,
	IIF(
		CustomerType = 'Person',
		FirstName,
		CompanyName) AS 'Cliente'
FROM
	DimCustomer


-- IFF composto (IIF dentro de IIF)
SELECT
	ProductKey,
	ProductName,
	StockTypeName,
	IIF(
		StockTypeName = 'High',
		'João',
	IIF(
		StockTypeName = 'Mid',
		'Maria',
		'Luis')
		) AS 'Responsável'
FROM
	DimProduct
	

-- ISNULL: Tratando valores nulos
SELECT
	GeographyKey,
	ContinentName,
	CityName,
	ISNULL(
		CityName, 'Local desconhecido') AS 'Cidades'
FROM
	DimGeography