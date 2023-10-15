-- Triggers DML: É um gatilho que será disparado automáticamente quando acontece um evento
-- Criando uma TRIGGER DML com AFTER
USE Testes
;

CREATE OR ALTER TRIGGER tgClienteAlterado
ON dCliente
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	PRINT 'Os dados da tabela dCLiente foram alterados!'
END

INSERT INTO dCliente(nome_cliente, genero, data_nascimento, cpf)
VALUES
	('Zacarias neto', 'M', '13/10/1980', '125.785.563-54')

UPDATE dCliente
SET cpf = '130.451.892-10'
WHERE id_cliente = 11


-- Tabelas INSERTED e DELETED
CREATE OR ALTER TRIGGER tgClienteAlterado
ON dCliente
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	SELECT * FROM INSERTED -- DELETED quando colocado essa opção ela retorna a linha toda da tabela com as informações inseridas ou deletadas
	--PRINT 'Os dados da tabela dCLiente foram alterados!'
END
INSERT INTO dCliente(nome_cliente, genero, data_nascimento, cpf)
VALUES
	('Zacarias neto', 'M', '13/10/1980', '125.785.563-54')

-- Identificando na TRIGGER o evento DML relacionado
CREATE OR ALTER TRIGGER tgClienteAlterado
ON dCliente
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	IF EXISTS (SELECT * FROM INSERTED) AND EXISTS (SELECT * FROM DELETED)
		PRINT 'Dados foram atualizados na tabela!'
	ELSE IF EXISTS (SELECT * FROM INSERTED)
		PRINT 'Dados foram inseridos na tabela!'
	ELSE IF EXISTS (SELECT * FROM DELETED)
		PRINT 'Dados foram deletados na tabela!'
END


-- TRIGGER com INSTEAD OF (Exemplo de controle de permissão de cadastro)
SELECT FORMAT(GETDATE(), 'dddd')

CREATE OR ALTER TRIGGER tgControleRegistros
ON dCliente
INSTEAD OF INSERT
AS
BEGIN

	IF FORMAT(GETDATE(), 'dddd') IN ('sábado', 'domingo')
	BEGIN
		RAISERROR('O cadastro de clientes só pode ser feito de Segunda à Sezta', 1, 1) --Mensagem de erro
		ROLLBACK -- Para desfazer a alteração feita
	END
	ELSE
	BEGIN
		INSERT INTO dCliente(nome_cliente, genero, data_nascimento, cpf)
		SELECT i.nome_cliente, i.genero, i.data_nascimento, i.cpf FROM INSERTED I --Esta fase serve para poder incluir dados caso não seja as datas informadas e limitadas
	END

END

--HABILITANTO, DESABILIDANDO OU EXCLUINDO TRIGGER

ENABLE TRIGGER tgControleRegistros ON dCliente -- Habilita trigger
DISABLE TRIGGER tgControleRegistros ON dCliente -- Desabilita trigger
ENABLE TRIGGER ALL ON dCliente -- Habilita todas as trigger da tabela
DISABLE TRIGGER ALL ON dCliente -- Desabilita todas as trigger da tabela
DROP TRIGGER thControleRegistros; -- Apaga a trigger
