-- CRUD (criação, leitura, atualização e exclusão de dados e tabelas)
-- CREATE, READ, UPDATE, DELETE
USE Testes

GO
CREATE TABLE Produtos(
	Id_produto INT,
	Nome_produto VARCHAR(500),
	Data_validade DATETIME,
	Preco_produto FLOAT)


SELECT
	*
FROM
	Produtos

-- INSERT INTO + SELECT: Inserir dados na tabela, a partir de outras tabelas ou manualmente
INSERT INTO Produtos(Id_produto, Nome_produto, Data_validade, Preco_produto)
SELECT
	ProductKey,
	ProductName,
	AvailableForSaleDate,
	UnitPrice
FROM
	ContosoRetailDW.dbo.DimProduct

--INSERT INTO: Inserindo dados manualmente
CREATE TABLE Producao(
	Id_produto INT,
	Nome_produto VARCHAR(500),
	Data_validade DATETIME,
	Preco_produto FLOAT)

INSERT INTO Producao(Id_produto, Nome_produto, Data_validade, Preco_produto)
VALUES
	(1, 'Arroz', '31/12/2021', 22.50),
	(2, 'Feijão', '20/11/2021', 8.99)
UPDATE Producao
SET Nome_produto = 'Macarrão'
WHERE Id_produto = 2


SELECT
	*
FROM
	Producao

DELETE
FROM Producao
WHERE Id_produto = 2

--DROP TABLE deleta a tabela permanentemente / DELETE deleta partes de uma tabela
-- ALTER TABLE (Adiciona colunas, altera tipo de coluna e deleta coluna)
--Estrutura de adicinar coluna: ALTER TABLE + Nome da tabela depois em baixo ADD nome da coluna + tipo da coluna
-- UPDATE para adicionar as informãções novas nas colunas novas
--Para alternar o tipo da coluna seria ALTER TABLE + ALTER COLUM com nome da coluna e o tipo
-- Para deletar as colunas seria ALTER TABLE, nome da tabela, DROP COLUM + Nome das colunas


