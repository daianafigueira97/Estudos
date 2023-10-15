-- Views com SQL (Exibi��o)
-- Criando View
-- Alternando View


CREATE VIEW VwClientes AS
SELECT
	FirstName AS 'Nome',
	EmailAddress AS 'E-mail',
	BirthDate AS 'Data de anivers�rio'
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
	UnitPrice AS 'Pre�o unit�rio'
FROM
	DimProduct
GO



SELECT
	*
FROM
	VwProdutos
GO

--Para utilizar outros bancos de dados em uma mesma estrutura, � s� Colocar antes do bloco a palavra USE e o nome do banco de dos

-- Utilizando o DROP VIEW (Deletar view) � poss�vel ir manualmente no banco e deletar pelo bot�o direito ou colocar DROP VIEW + Nome da VIEW


