-- Utilizando o ORDER BY para ordenar do menor para o maior
SELECT TOP 100
	*
FROM
	DimStore
ORDER BY
	EmployeeCount
DESC -- Do maior para o menor
--ASC do menor para o maior


SELECT
	TOP 10
	ProductName,
	UnitCost,
	Weight
FROM
	DimProduct
ORDER BY
	UnitCost DESC, 
	Weight DESC

-- Relação de filtragem com comandos com Where (VALORES NUMÉRICOS)
SELECT
	ProductName AS 'Produto',
	UnitPrice AS 'Preço'
FROM
	DimProduct
WHERE
	UnitPrice >= 1000


-- Relação de filtragem com comandos com Where (TEXTOS)
SELECT DISTINCT
	*
FROM
	DimProduct
WHERE
	BrandName = 'Fabrikam'


SELECT
	*
FROM
	DimProduct
WHERE
	ColorName = 'Black'


-- Relação de filtragem com comandos com Where (DATAS)
SELECT
	*
FROM
	DimCustomer
WHERE
	BirthDate >= '1970-12-31'
ORDER BY
	BirthDate DESC


-- Operadores Logicos END, OR, NOT (END = E, OR = OU, NOT = OPOSTO, DIFERENTE)
SELECT
	*
FROM
	DimProduct
WHERE
	BrandName =	'Fabrikam' AND ColorName = 'Black'
	-------
SELECT
	*
FROM
	DimProduct
WHERE
	BrandName = 'Contoso' OR ColorName = 'White'
	------
SELECT
	*
FROM
	DimProduct
WHERE
	BrandName = 'Contoso' OR BrandName = 'Fabrikam'
	-------
SELECT
	*
FROM
	DimEmployee
WHERE NOT DepartmentName = 'Marketing'
	------
--Para combinações de OR com AND, é necessário colocar o primeiro comando de OR em parentese para ser validado primeiro

-- Realização de filtragem de WHERE combinado com IN (Necessário colocar os itens de IN dentro de Parenteses)
SELECT
	*
FROM
	DimProduct
WHERE
	ColorName IN ('Silver', 'Blue', 'White', 'Red', 'Black')

SELECT
	*
FROM
	DimEmployee
WHERE DepartmentName IN ('Production', 'Marketing', 'Enginnering')


-- Realização de filtragem de WHERE combinado com LIKE(Necessário colocar o sinal de % antes e após o texto de LIKE para textos que CONTENHAM partes)
SELECT
	*
FROM
	DimProduct
WHERE ProductName LIKE '%MP3 Player%'

SELECT
	*
FROM
	DimProduct
WHERE ProductDescription LIKE 'Type%'  --Colocando o sinal de % no final ele entende que a frase COMEÇA com o LIKE, se colocado no ínicio, ele entende que TERMINA com o LIKE


-- Realização de filtragem de WHERE combinado com BETWEEN - ENTRE (NOT BETWEEN SELECIONA OS DADOS ONDE AS INFORMAÇÕES NÃO ESTEJAM ENTRE OS VALORES DETERMINADOS)
SELECT
	*
FROM
	DimProduct
WHERE UnitPrice BETWEEN 50 AND 100

SELECT
	*
FROM
	DimEmployee
WHERE HireDate BETWEEN '2000-01-01' AND '2000-12-31'



-- Realização da filtragem com WHERE combinado de IS NULL (É NULO) OU NOT NULL(NÃO NULO)
SELECT
	*
FROM
	DimCustomer
WHERE CompanyName IS NOT NULL

SELECT
	*
FROM
	DimCustomer
WHERE CompanyName IS NULL