--Vari�veis em linguagem SQL
-- Inteiros: INT
-- Decimal: FLOAT / Decimal(N, M) (N: Definir a quantidade permitida de n�meros incluindo as casas decimais. M: Definir a casa decimal m�xima
-- Texto / String: VARCHAR(N) (N sendo o n�mero de caracteres que aquele texto / String pode ter
-- Data: DATETIME

--Opera��es b�sicas:
SELECT
	10 AS 'N�MERO'
SELECT
	'DAIANA' AS 'NOME'
SELECT
	'10/10/2023' AS 'DATA'
-- Opera��es com n�meros:
 SELECT
	10+20 AS 'SOMA'
SELECT
	20-5 AS 'SUBTRA��O'
SELECT
	30*40 AS 'MULTIPLICA��O'
SELECT	
	431.0/23 AS 'DIVIS�O'
-- Opera~��es com textos:
SELECT
	'DAIANA' + ' ' + 'FIGUEIRA'
-- Opera��es com data:
/*SELECT
	'10/10/2023' + */

SELECT
	10 AS 'N�MERO'
SELECT
	49.50 AS 'DECIMAL'
SELECT
	'DAIANA' AS 'NOME'
SELECT
	'10/10/2023' AS 'DATA'
-- SQL_VARIANTE_PROPERTY - Usado para identificar o tipo de dado e informa��o
SELECT SQL_VARIANT_PROPERTY(10,'BaseType')
SELECT SQL_VARIANT_PROPERTY(40.50,'BaseType')
SELECT SQL_VARIANT_PROPERTY('DAIANA','BaseType')
SELECT SQL_VARIANT_PROPERTY('10/10/2023','BaseType')

-- CAST: Fun��o para especificar o tipo dos dados
SELECT CAST(21.45 AS INT)
SELECT CAST(21.45 AS FLOAT)
SELECT CAST(18.7 AS FLOAT)
SELECT CAST('15.6' AS FLOAT)
SELECT CAST('10/10/2023' AS DATETIME)

SELECT SQL_VARIANT_PROPERTY(CAST('10/10/2023' AS DATETIME),'BaseType')

SELECT
	'O pre�o do pastel �: ' + cast(30.99 AS VARCHAR(50))

SELECT
	CAST('10/10/2023' AS DATETIME) + 1

-- Fun��o FORMAT para formata��o de valores, utilizado em TEXTOS
SELECT FORMAT(1000, 'N')
SELECT FORMAT(1000, 'G')
SELECT FORMAT(123456789, '###-##-###')
SELECT FORMAT(CAST('10/10/2023' AS DATETIME),'dd/MMM/yyyy')
SELECT FORMAT(CAST('10/10/2023' AS DATETIME),'MMM')

SELECT
	'A data de validade do produto �: ' + FORMAT(CAST('20/10/2023' AS DATETIME),'dd/MMM/yyyy')

-- Fun��es de arredondamento: ROUND, FLOOR e CEILING / ROUND (TRUNCAR)
 SELECT
	10+20 AS 'SOMA'
SELECT
	20-5 AS 'SUBTRA��O'
SELECT
	30*40 AS 'MULTIPLICA��O'
SELECT	
	431.0/23 AS 'DIVIS�O'

SELECT ROUND(18.739130, 2)
SELECT ROUND(18.739130, 2, 1) -- Trunca a quantidade de casas decimais ap�s a virgula
SELECT FLOOR(18.739130) -- Arredonda para baixo
SELECT CEILING(18.739130) -- Arredonda para cima

-- DECLARANDO VARI�VEIS:
-- Para toda declara��o de v�riavel, necessita ter o simbolo de @

DECLARE @idade INT
SET @idade = 30
SELECT @idade

DECLARE @preco FLOAT
SET @preco = 10.89
SELECT @PRECO AS 'VALOR'

DECLARE @nome VARCHAR(30)
SET @nome = 'Daiana'
SELECT @nome AS 'NOME'

DECLARE @data DATETIME
SET @data = '10/10/2023'
SELECT @data AS 'Data de hoje'

-- Declarando mais de uma vari�vel
-- OP��O 1:
DECLARE @var1 INT
DECLARE @var2 INT
DECLARE @texto VARCHAR(30)
DECLARE @data DATETIME

SET @var1 = 10
SET @var2 = 20
SET @texto = 'Um texto qualquer..'
SET @data = '10/10/2023'

SELECT @var1, @var2, @texto, @data


-- OP��O 2:
DECLARE
	@var1 INT,
	@var2 INT,
	@texto VARCHAR(30),
	@data DATETIME

SET @var1 = 10
SET @var2 = 20
SET @texto = 'Um texto qualquer..'
SET @data = '10/10/2023'
SELECT @var1, @var2, @texto, @data


-- OP��O 3:
DECLARE
	@var1 INT = 10,
	@var2 INT = 20,
	@texto VARCHAR(30) = 'Um texto qualquer..',
	@data DATETIME = '10/10/2023'
SELECT @var1, @var2, @texto, @data



SELECT
	100*89.99 AS 'Faturamento'

DECLARE 
	@quantidade INT = 100, 
	@valor FLOAT = 89.99
SELECT @quantidade * @valor AS 'Faturamento'

--Aplicar Vari�vel em consulta
/*Anota��o de exemplo:
Pre�o = 100
Desconto = 10% = 10/100 = 0.10
Valor_do_desconto = 100 * 0.10 = 10
Pre�o_com_desconto = 100-10 = 90 
Preco_com_desconto = 100 * (1-0.10) = 90*/


DECLARE
	@varDesconto FLOAT = 0.1
SELECT
	ProductKey AS 'ID',
	ProductName AS 'Nome do Produto',
	UnitPrice AS 'Pre�o Unit�rio',
	UnitPrice * (1- @varDesconto) AS 'Pre�o com desconto'
FROM
	DimProduct


-- Como armazenar o valor do resultado de um SELECT

DECLARE @varFuncionario INT = 
(SELECT 
	COUNT(*)
FROM
	DimEmployee)
SELECT @varFuncionario 



DECLARE @varLojaOff INT = 
(SELECT
	COUNT(*)
FROM
	DimStore
WHERE
	Status = 'Off')
SELECT @varLojaOff



-- Utilizando PRINT para visualizar 
SET NOCOUNT ON -- N�o realizar nenhuma contagem quando realizar o comando
DECLARE 
	@varLojaOn INT,
	@varLojaOf INT
SET @varLojaOn = (
SELECT
	COUNT(*)
FROM
	DimStore
WHERE
	Status = 'On')

SET @varLojaOf = (
SELECT
	COUNT(*)
FROM
	DimStore
WHERE
	Status = 'Off')
SELECT @varLojaOn AS 'Lojas abertas', @varLojaOf AS 'Lojas fechadas'

PRINT 'O total de lojas abertas � de: ' + CAST(@varlojaOn AS VARCHAR(30))
PRINT 'O total de lojas fechada � de: ' + CAST(@varlojaOf AS VARCHAR(30))


-- Armazenando o valor de uma tabela dentro de uma vari�vel
SELECT TOP 100
	*
FROM
	FactSales


DECLARE
	@produtomaisvendido INT,
	@totalmaisvendido INT

SELECT TOP 1
	@produtomaisvendido = ProductKey,
	@totalmaisvendido = SalesQuantity
FROM
	FactSales
ORDER BY SalesQuantity DESC
PRINT @produtomaisvendido
PRINT @totalmaisvendido



-- Acumulando valores dentro de uma vari�vel

SELECT
	FirstName,
	DepartmentName
FROM
	DimEmployee
WHERE
	DepartmentName = 'Marketing' AND Gender = 'F'


-- Realizando o PRINT
DECLARE
	@ListaNomes VARCHAR (50) = '' 
SELECT
	@ListaNomes = @ListaNomes + FirstName + ',' + CHAR(10) --Pular linha usando CHAR
FROM
	DimEmployee
WHERE
	DepartmentName = 'Marketing' AND Gender = 'F'
PRINT
	LEFT(@ListaNomes, DATALENGTH(@ListaNomes) -2)


-- Vari�veis globais com o uso de dois @@
SELECT @@VERSION
