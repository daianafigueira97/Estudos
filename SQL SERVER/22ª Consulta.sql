-- TRIGGERs DDL (CREATE, ALTER DROP) - BANCO DE DADOS / TRIGGER DML (INSERT, UPDATE, DELETE) - TABELAS:
USE Testes

CREATE OR ALTER TRIGGER tgRecusarTabelas
ON DATABASE -- NESTE BANCO DE DADOS
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	PRINT 'Não é permitido criação, alteração ou exclusão de tabelas'
	ROLLBACK -- Desfazer alterações realizadas
END

CREATE TABLE teste(ID INT)

--HABILITANDO, DESABILITANDO E EXCLUINDO TRIGGERS DDL
DISABLE TRIGGER tgRecusarTabelas ON DATABASE -- Desalabilitar trigger no banco de dados
ENABLE TRIGGER tgRecusarTabelas ON DATABASE -- Habilitar trigger no banco de dados
DISABLE TRIGGER ALL ON DATABASE -- Desabilitar todas as triggers no banco de dados
ENABLE TRIGGER ALL ON DATABASE -- Habilitar todas as triggers no banco de dados
DROP TRIGGER tgRecusarTabelas ON DATABASE -- Exlui trigger do banco de dados 
