-- REGEX: Regular Expressions - Express�es regulares
-- COLLATE: Informar se quer que ele identifique maiusculas de minusculas ou nomes com acento ou sem
-- COLLATE Latin1_General_CI_AI: COLLAGE - Fun��o / Latin1_General_ - Linguagem / CI ou CS: CI Case Insentive CS Case Sensitive / AI ou AS: AI Accenct Insentive AS Accent Sensitive
-- Insensitive: N�o sensivel / Sensitive: Sensivel Tanto para palavras em maiuscula e minuscula quanto para acentos 

CREATE DATABASE BD_COLLATION
COLLATE Latin1_General_CI_AS

USE BD_COLLATION

CREATE TABLE Tabela(
					ID INT,
					Nome VARCHAR (100))

INSERT INTO Tabela(ID, Nome)
VALUES
	(1, 'Matheus'),
	(2, 'Marcela'),
	(3, 'Marcos'),
	(4, 'Mauricio'),
	(5, 'Marta'),
	(6, 'Miranda'),
	(7, 'Melissa'),
	(8, 'Marcelo'),
	(9, 'Manoel'),
	(10, 'Maria')

SELECT
	*
FROM
	Tabela


-- LIKE para case sensitive
SELECT
	*
FROM
	Tabela
WHERE
	Nome LIKE 'Mar%'


SELECT
	*
FROM
	Tabela
WHERE
	Nome LIKE '%Mar%'

SELECT
	*
FROM
	Tabela
WHERE
	Nome LIKE '[Mm] [Aa] [Rr]%' -- INICIA COM

SELECT
	*
FROM
	Tabela
WHERE
	Nome LIKE '[^Ll]%'  -- N�O INICIA COM (O sinal de ^ vem para colocar em nega��o o que queremos ou n�o levar como crit�rio para busca)

SELECT
	*
FROM
	Tabela
WHERE
	Nome LIKE '%[^a-z0-9]%' -- Desta forma buscamos caracteres especiais, a partir do momento que colocamos que seja qualquer coisa que n�o conhenha letras de A a Z ou n�meros de 0 a 9 limitamos o retorno a caracters espericiais

SELECT
	*
FROM
	Tabela
WHERE
	Nome LIKE '[0-9][0-9].[0][0]' -- Ao utilizar esse tipo de filtragem de n�mero, o LIKE entende que precisa trazer informa��es apenas que contenham dois digitos na partei inteira antes da virgula


-- O LIKE tem o poder de buscar partes de um texto, iniciais, caracteres, quantidade de letrar e n�meros de caracteres, misturas entre letras e n�meros sendo parte da sele��o desejada

-- Infinitas as formas de se filtrar partes de informa��es a partir de colunas e personalizar a cada necessidade