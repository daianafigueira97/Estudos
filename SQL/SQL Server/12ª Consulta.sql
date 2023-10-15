--SUBQUERYS e CTEs
-- SUBQUERYS com WHERE
--Use ContosoRetailDW
SELECT
	AVG (UnitCost)
FROM
	DimProduct --147,6555

SELECT
	*	
FROM
	DimProduct
WHERE
	UnitCost >= (SELECT AVG (UnitCost) FROM DimProduct) --147,6555





SELECT
	*
FROM
	DimProduct
WHERE
	ProductSubcategoryKey = (SELECT ProductSubcategoryKey FROM DimProductSubcategory
							 WHERE ProductSubcategoryName = 'Televisions') --Trás todas as colunas da tabela DimProduct, desde que o ID da Subcategoria seja igual ao ID da subcategoria da tabela DimProductSubcategory, no qual o nome do produto seja igual a 'television'




SELECT
	StoreKey
FROM
	DimStore
WHERE
	EmployeeCount > = 100

SELECT
	*
FROM
	FactSales
WHERE
	StoreKey IN (SELECT StoreKey FROM DimStore
				 WHERE EmployeeCount >= 100)


-- ANY, SOME e ALL
CREATE TABLE Funcionarios(
Id_funcionario INT,
Nome VARCHAR(50),
Idade INT,
Sexo VARCHAR(50))

INSERT INTO Funcionarios(Id_funcionario, Nome, Idade, Sexo)
VALUES
(1, 'Julia', 20, 'F'),
(2, 'Daniel', 21, 'M'),
(3, 'Amanda', 22, 'F'),
(4, 'Pedro', 23, 'M'),
(5, 'André', 24, 'M'),
(6, 'Luiza', 25, 'F')

SELECT
	*
FROM
	Funcionarios

-- Selecionado os funcionários do sexto masculino (Mas, utilizando a coluna de IDADE pra isso)

SELECT
	*
FROM
	Funcionarios
WHERE
	Idade IN (21, 23, 24)

SELECT
	*
FROM
	Funcionarios
WHERE
	Idade IN (SELECT Idade FROM Funcionarios
			  WHERE Sexo = 'M')


SELECT
	*
FROM
	Funcionarios
WHERE
	Idade = ANY (SELECT Idade FROM Funcionarios
			  WHERE Sexo = 'M')
-- ANY e SOME: Traz qualquer resultado. o ANY é equivalente ao IN mas com a vantagem de operadores de = > < o que no IN não é possível
SELECT
	*
FROM
	Funcionarios
WHERE
	Idade > ANY (SELECT Idade FROM Funcionarios
			  WHERE Sexo = 'M')

-- ALL: Traz TODOS os resultados equivalentes ao que está buscando sendo o MAIOR de todos ou MENOR de todos, também podendo utilizar operadores lógicos
SELECT
	*
FROM
	Funcionarios
WHERE
	Idade > ALL(SELECT Idade FROM Funcionarios
			  WHERE Sexo = 'M') -- Neste exemplo ele vai trazer o MAIOR de TODOS. Em relação a idade.

-- Comando EXISTS: O EXISTS assim como IN, ANY, SOME e ALL, é uma combinação de filtro utilizada também com o WHERE
SELECT
	COUNT(*) --2517 PRODUTOS
FROM
	DimProduct

SELECT TOP 100
	*
FROM
	FactSales

SELECT
	Productkey,
	ProductName
FROM
	DimProduct
WHERE
	EXISTS(SELECT ProductKey fROM FactSales
		   WHERE DateKey = '01/01/2007' AND
		   FactSales.ProductKey = DimProduct.ProductKey) -- Para chegar a esse resultado, poderia utilizar subquery com EXISTS ou JOIN




--Utilizando o SELECT para SUBQUERY
SELECT
	ProductKey,
	ProductName,
	(SELECT COUNT(ProductKey) FROM FactSales 
	 WHERE FactSales.ProductKey = DimProduct.ProductKey) AS 'Qtd. Vendas'
FROM
	DimProduct


--Utilizando FROM para SUBQUERY
SELECT
	COUNT(*)
FROM
	DimProduct
WHERE BrandName = 'Contoso'

SELECT
	COUNT(*)
FROM
	(SELECT *
	 FROM
	DimProduct
	 WHERE BrandName = 'Contoso') AS Marca


--SubQuery Aninhada (Subquery dentro de SubQuery)
SELECT
	*
FROM
	DimCustomer
WHERE CustomerType = 'Person'
ORDER BY YearlyIncome DESC


SELECT
	DISTINCT TOP 2 YearlyIncome
FROM
	DimCustomer
WHERE CustomerType = 'Person'
ORDER BY YearlyIncome DESC

SELECT
	CustomerKey,
	FirstName,
	LastName,
	YearlyIncome
FROM
	DimCustomer
WHERE
	YearlyIncome = 160000

--Resultado em subquery dentro de subquery:
--Exemplo, descobrindo o primeiro maior salário, o segundo maior salário e o nome dos funcionários:

SELECT
	CustomerKey,
	FirstName,
	LastName,
	YearlyIncome
FROM
	DimCustomer
WHERE
	YearlyIncome = (SELECT MAX(YearlyIncome)
					FROM
						DimCustomer
					WHERE YearlyIncome < (SELECT MAX(YearlyIncome)
										  FROM
											DimCustomer
										  WHERE CustomerType = 'Person'
										  );
-- Com isso, dentro da primeira sub traz o maior valor, e na segunda sub traz o segundo maior valor


--TRABALHANDO COM CTE (Common Table Expression) - Tabala temporária que pode ser reaproveitada quando necessário
WITH cte AS(
SELECT
	ProductKey,
	ProductName,
	BrandName,
	ColorName,
	UnitPrice
FROM
	DimProduct
WHERE
	BrandName = 'Contoso')

SELECT
	*
FROM
	cte;


-- CTE Calculando agregações
WITH cte AS (
SELECT
	BrandName,
	COUNT(*) AS 'Total'
FROM
	DimProduct
GROUP BY BrandName
)
SELECT AVG(Total) FROM cte
;

--NOMEANDO CTEs
WITH cte (Marca, Total) AS (
SELECT
	BrandName,
	COUNT(*)
FROM
	DimProduct
GROUP BY BrandName
)
SELECT 
	Marca,
	Total
From cte
;

--Criando multiplas CTEs e conectando com INNER JOIN
WITH produtos_contoso AS (
SELECT
	ProductKey,
	ProductName,
	BrandName
FROM
	DimProduct
WHERE
	BrandName = 'Contoso'
),--Separando as CTEs apenas por virgulas é possível criar várias CTEs
vendas_top100 AS (
SELECT TOP (100)
	SalesKey,
	ProductKey,
	DateKey,
	SalesQuantity
FROM
	FactSales
ORDER BY DateKey DESC
)


SELECT 
	*
FROM
	vendas_top100
INNER JOIN produtos_contoso
	ON vendas_top100.ProductKey = produtos_contoso.ProductKey


