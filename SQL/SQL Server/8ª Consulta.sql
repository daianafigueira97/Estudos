-- Manipulando Textos e datas (Strings e Datas)
-- LEN E DATALENGTH PARA CONTAR A QUANTIDADE DE CARACTERES INCLUINDO O ESPA�O
SELECT
	LEN('DAIANA FIGUEIRA') AS 'LEN',
	DATALENGTH('DAIANA FIGUEIRA') AS 'DATALENGTH' -- O DATALENGTH DESCONSIDERA ESPA�OS ADICIONAIS NO FINAL DE UMA FRASE OU PALAVRA

-- CONCAT PARA CONCATENAR E JUNTAR DUAS OU MAIS PALAVRAS E FRASES
SELECT
	*
FROM
	DimCustomer

SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	CONCAT(FirstName, ' ', LastName) AS 'Nome completo',
	EmailAddress AS 'E-mail'
FROM
	DimCustomer

-- LEFT -> Extrai uma determinada quantidade de caracteres da esquerda para direita
-- RIGHT -> Extrai uma determinada quantidade de caracteres da direita para esquerda
SELECT
	*
FROM
	DimProduct


SELECT
	ProductName AS 'Produto',
	UnitPrice AS 'Pre�o',
	LEFT(StyleName, 7) AS 'Cod 1',
	RIGHT(StyleName, 7) AS 'Cod 2'
FROM
	DimProduct

-- REPLACE: Substituir um texto por outro
SELECT
	REPLACE('Excel � o melhor', 'Excel', 'SQL')

SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	Gender AS 'Sexo (Abrev.)',
	REPLACE(REPLACE(Gender, 'M', 'Masculino'), 'F', 'Feminino' ) AS 'Sexo' -- Ao substituir uma palavra ou parte por outra�, � importante se atentar se a segunda substui��o pode afetar a priemira
FROM
	DimCustomer


-- TRANSLATE e STUFF: Fun��es de substui��o
-- TRANSLATE: SUBSTITUI CADA CARACTERE NA ORDEM DE ENTRADA NO TEXTO (N�o funciona 2 em um mesmo SELECT)
--STUFF: Substitui qualquer texto com um auantidade de caracteres limitados, por um outro texto
SELECT 
	TRANSLATE('10.241/444.124K23/1', './K', 'ABC')
SELECT 
	TRANSLATE('EFGH-490123', 'EFGH', 'WXYZ')

SELECT
	STUFF('VBA Visual Basic Application', 1, 3, 'Excel') -- Nesse exemplo ele se inicia no caracter 1 e vai at� o 3


-- UPPER: Transforma um texto em mai�scula
-- LOWER: Transforma o texto em minuscula
SELECT
	FirstName AS 'Nome',
	UPPER(FirstName) AS 'NOME',
	LOWER(FirstName) AS 'nome',
	EmailAddress AS 'E-mail'
FROM
	DimCustomer


-- Format: Formata um valor de acordo com uma determinada formata��o
SELECT
	FORMAT(5123, 'G') -- FORMATA��O GERAL
SELECT
	FORMAT(5123,'N') -- FORMATA��O DE NUMERO
SELECT
	FORMAT(5123, 'C') -- FORMATA��O DE MOEDA
SELECT
	FORMAT(CAST('23/04/2020' AS DATETIME), 'dd/MM/yyyy', 'pt-BR')
SELECT
	FORMAT(CAST('23/04/2020' AS DATETIME), 'dd')
SELECT
	FORMAT(CAST('23/04/2020' AS DATETIME), 'MM')
SELECT
	FORMAT(CAST('23/04/2020' AS DATETIME), 'yy')

-- Formata��o personalizada
SELECT
	FORMAT(1234567, '##-##-###')


-- CHARINDEX: Descobre a posi��o de um determinado caractere dentro de um texto
-- SUBSTRING: Extrai alguns caracteres de dentro de um texto
SELECT
	'RAQUEL MORENO' AS 'Nome'
SELECT
	CHARINDEX('Moreno', 'Raquel Moreno') -- Informa em qual posi��o o caracter se INICIA dentro da palavra ou letra
SELECT
	SUBSTRING('Raquel Moreno', 8, 6) AS 'Sobrenome' -- O n�mero 8 corresponde a posi��o que o caracter inicial da palavra est�, o n�mero 6 corresponde a quantidade de caracteres a partir da posi��o 8 queremos extrair
/*SELECT 
	CHARINDEX(' ', 'Bernardo Cavalcante') AS 'Posi��o'*/
SELECT
	SUBSTRING('BERNARDO CAVALCANTE', CHARINDEX(' ', 'BERNARDO CAVALCANTE') + 1, 100) AS 'Sobrenome'

DECLARE @Nome VARCHAR(100) = 'BERNARDO CAVALCANTE'
SELECT
	SUBSTRING(@Nome, CHARINDEX(' ', @Nome) + 1, 100) AS 'Sobrenome'


---TRIM, LTRIM, RTRIM
-- TRIM: Retira espa�os adicionais � direita e a esquerda do texto
-- LTRIM: Retira espa�os adicionais � esquerda do texto
-- RTRIM: Retira espa�os adicionais � direita do texto

DECLARE
	@codigo VARCHAR(50) = '   ABC123    '
SELECT
	TRIM(@codigo) AS 'TRIM',
	LTRIM(@codigo) AS 'LTRIM',
	RTRIM(@Codigo) AS 'RTRIM'


--- FUN��ES DAY, MONTH E YEAR
DECLARE 
	@data DATETIME = '05/12/2022'
SELECT
	DAY(@data) AS 'DIA',
	MONTH(@data) AS 'M�S',
	YEAR(@data) AS 'ANO'

-- DATEFROMPARTS para obter uma data completa a partir das informa��es de dia, m�s e ano
DECLARE
	@dia INT = 15,
	@mes INT = 10,
	@ano INT = 2019

SELECT
	DATEFROMPARTS(@ano, @mes, @dia) AS 'Data'



-- GETDATE, SYSDATETIME, DATENAME e DATEPART
-- GETDATE: Retorna a data e hora atual do sistema
-- SYSDATETIME: Retorna a data e a hora atual do sistema de uma forma mais precisa que o GETDATE
-- DATENAME E DATEPART: Retorna informa��es como (dia, m�s, ano, semana, etc) de uma determinada data

SELECT
	GETDATE()
SELECT
	SYSDATETIME()

-- DATENAME: Retorna a data em formato de texto
DECLARE 
	@date DATETIME = GETDATE()
SELECT
	DATENAME(DAY, @date) AS 'DIA',
	DATENAME(MONTH, @date) AS 'M�S',
	DATENAME(YEAR, @date) AS 'ANO'
-- DATEPART: Retorna a data em formato de n�mero
SELECT
	DATEPART(DAY, @date) AS 'DIA',
	DATEPART(MONTH, @date) AS 'M�S',
	DATEPART(YEAR, @date) AS 'ANO'


-- DATEADD e DATEIFF
-- DATEADD: Adiciona ou subtrai uma determina quantidade de dias, meses ou anos de uma data
-- DATEDIFF: Calcula a diferen�a entre duas datas
DECLARE
	@data1 DATETIME = '10/07/2020',
	@data2 DATETIME = '05/03/2020',
	@data3 DATETIME = '14/11/2021'

-- DATEADD
SELECT
	DATEADD(DAY, 30, @data1)

-- DATEDIFF
SELECT
	DATEDIFF(DAY, @data2, @data3)