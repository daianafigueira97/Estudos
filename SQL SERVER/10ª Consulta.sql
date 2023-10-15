-- Views com SQL (Exibição)
-- Criando View
-- Alternando View


CREATE VIEW VwClientes AS
SELECT
	FirstName AS 'Nome',
	EmailAddress AS 'E-mail',
	BirthDate AS 'Data de aniversário'
FROM
	DimCustomer


SELECT
	*
FROM
	VwClientes
GO


ALTER VIEW VwProdutos AS
SELECT
	ProductKey AS 'ID Produto',
	ProductName AS 'Nome do produto',
	ProductSubcategoryKey AS 'ID Subcategoria',
	BrandName AS 'Marca',
	UnitPrice AS 'Preço unitário'
FROM
	DimProduct
GO



SELECT
	*
FROM
	VwProdutos
GO

--Para utilizar outros bancos de dados em uma mesma estrutura, é só Colocar antes do bloco a palavra USE e o nome do banco de dos

-- Utilizando o DROP VIEW (Deletar view) é possível ir manualmente no banco e deletar pelo botão direito ou colocar DROP VIEW + Nome da VIEW


