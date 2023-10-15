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

-- Rela��o de filtragem com comandos com Where (VALORES NUM�RICOS)
SELECT
	ProductName AS 'Produto',
	UnitPrice AS 'Pre�o'
FROM
	DimProduct
WHERE
	UnitPrice >= 1000


-- Rela��o de filtragem com comandos com Where (TEXTOS)
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


-- Rela��o de filtragem com comandos com Where (DATAS)
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
--Para combina��es de OR com AND, � necess�rio colocar o primeiro comando de OR em parentese para ser validado primeiro

-- Realiza��o de filtragem de WHERE combinado com IN (Necess�rio colocar os itens de IN dentro de Parenteses)
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


-- Realiza��o de filtragem de WHERE combinado com LIKE(Necess�rio colocar o sinal de % antes e ap�s o texto de LIKE para textos que CONTENHAM partes)
SELECT
	*
FROM
	DimProduct
WHERE ProductName LIKE '%MP3 Player%'

SELECT
	*
FROM
	DimProduct
WHERE ProductDescription LIKE 'Type%'  --Colocando o sinal de % no final ele entende que a frase COME�A com o LIKE, se colocado no �nicio, ele entende que TERMINA com o LIKE


-- Realiza��o de filtragem de WHERE combinado com BETWEEN - ENTRE (NOT BETWEEN SELECIONA OS DADOS ONDE AS INFORMA��ES N�O ESTEJAM ENTRE OS VALORES DETERMINADOS)
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



-- Realiza��o da filtragem com WHERE combinado de IS NULL (� NULO) OU NOT NULL(N�O NULO)
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