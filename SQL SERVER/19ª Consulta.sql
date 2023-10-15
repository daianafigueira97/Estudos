-- Functions: Uma function é um conjunto de compandos que executam ações e retorna um valor escalar
-- ótimo para reaproveitar calculos complexos com frequência

USE Testes
SELECT
	*
FROM
	dCliente

;

SELECT
	nome_cliente,
	data_nascimento,
	DATENAME(Dw, data_nascimento) + ', ' +
	DATENAME(D, data_nascimento) + ' de ' +
	DATENAME(M, data_nascimento) + ' de ' +
	DATENAME(YY, data_nascimento)
FROM
	dCliente

;

-- Criando uma função:
CREATE FUNCTION fnDataCompleta(@data AS DATE)
RETURNS VARCHAR (MAX)
AS
BEGIN
	RETURN
		DATENAME(DW, @data) +', ' +
		DATENAME(D, @data) + ' de ' +
		DATENAME(M, @data) + ' de ' +
		DATENAME(YY, @data)
END


SELECT
	nome_cliente,
	data_nascimento,
	dbo.fnDataCompleta (data_nascimento)
FROM
	dCliente


-- Estrutura condicional + FUNCTION
CREATE OR ALTER FUNCTION fnDataCompleta(@data AS DATE)
RETURNS VARCHAR (MAX)
AS
BEGIN
	RETURN
		DATENAME(DW, @data) +', ' +
		DATENAME(D, @data) + ' de ' +
		DATENAME(M, @data) + ' de ' +
		DATENAME(YY, @data) + ' - ' +
		CASE
			WHEN MONTH(@data) <= 6 THEN
				'(1º Semestre)'
			ELSE
				'(2º Semestre)'
		END
END


-- Criando FUNCTIONS complexas
SELECT
	*
FROM
	dGerente

SELECT
	nome_gerente,
	LEFT(nome_gerente, CHARINDEX(' ', nome_gerente) - 1 AS 'Primeiro nome'

FROM
	dGerente


CREATE OR ALTER FUNCTION fnPrimeiroNome (@nomecompleto AS VARCHAR(MAX))
RETURNS VARCHAR (MAX)
AS
BEGIN
	DECLARE @posicao AS INT
	DECLARE @resposta AS VARCHAR(MAX)

		SET @posicao = CHARINDEX(' ', @nomecompleto)
		IF @posicao = 0 
			SET @resposta = @nomecompleto
		ELSE
			SET @resposta = LEFT(@nomecompleto, @posicao -1)
	RETURN @resposta
END

SELECT
	nome_gerente,
	[dbo].[fnPrimeiroNome] (nome_gerente) AS 'Primeiro nome'

FROM
	dGerente