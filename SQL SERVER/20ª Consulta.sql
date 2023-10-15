--PROCEDURES em SQL SERVER: 
-- A PROCEDURE é um bloco de códigos que possui um nome e pode ser armazenado no banco de dados.
-- Procedures são utilizadas normalmente para realização de tarefas repetitivas que não são possíveis em queries ou que dariam batante trabalho
-- Existem procedures com parametros e sem parametros


-- CRIANDO PROCEDURES SEM PARAMETROS
USE Testes


CREATE PROCEDURE prOrdenaGerentes
AS
BEGIN

	SELECT
		id_gerente,
		nome_gerente,
		salario
	FROM
	dGerente
	ORDER BY salario DESC

END

EXECUTE prOrdenaGerentes


-- Criando PROCEDURE com parametros
CREATE OR ALTER PROCEDURE prListaClientes(@gen VARCHAR(MAX))
AS
BEGIN
	SELECT
		nome_cliente,
		genero,
		data_nascimento,
		cpf
	FROM
		dCliente
	WHERE genero = @gen
END

EXECUTE prListaClientes 'M'



-- Criando PROCEDURES com mais de um parãmetro

CREATE OR ALTER PROCEDURE prListaClientes(@gen VARCHAR(MAX), @ano INT)
AS
BEGIN
	SELECT
		nome_cliente,
		genero,
		data_nascimento,
		cpf
	FROM
		dCliente
	WHERE genero = @gen AND YEAR(data_nascimento) = @ano
END

EXECUTE prListaClientes 'M', 1989


-- Criando PROCEDURE COM PARAMETRO DEFOLT
CREATE OR ALTER PROCEDURE prListaClientes(@gen VARCHAR(MAX) = 'M', @ano INT)
AS
BEGIN
	SELECT
		nome_cliente,
		genero,
		data_nascimento,
		cpf
	FROM
		dCliente
	WHERE genero = @gen AND YEAR(data_nascimento) = @ano
END

EXECUTE prListaClientes @ano = 1989


-- Criando uma nova procedure exemplo e mais complexa para cadastro de contratos
CREATE OR ALTER PROCEDURE prRegistroContrato(@gerente VARCHAR(MAX), @cliente VARCHAR(MAX), @valor FLOAT)
AS
BEGIN
	DECLARE
		@vIdGerente INT,
		@vIdCliente INT
	SELECT
		@vIdGerente = id_gerente
	FROM
		dGerente
	WHERE
		nome_gerente = @gerente
	SELECT
		@vIdCliente = id_cliente
	FROM
		dCliente
	WHERE
		nome_cliente = @cliente

	INSERT INTO fContratos(data_assinatura, id_cliente, id_gerente, valor_contrato)
	VALUES
		(GETDATE(), @vIdCliente, @vIdGerente, @valor)
	PRINT 'Contrato registrado com sucesso!'
END

EXECUTE prRegistroContrato @gerente = 'Lucas Sampaio', @cliente = 'Gustavo Barbosa', @valor = 5000

SELECT
	*
FROM
	fContratos