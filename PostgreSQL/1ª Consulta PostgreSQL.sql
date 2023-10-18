SELECT * FROM categories;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT first_name FROM employees;
SELECT 
	product_id, 
	product_name, 
	unit_price 
FROM products;

-- Renomeando colunas
SELECT 
	product_id AS "Id_Produto", 
	product_name AS "Nome_Produto", 
	unit_price AS "Preco_unico"
FROM products;


-- Limitando a quantidade de linhas de uma query com LIMIT

SELECT
	*
FROM
	orders
LIMIT 100;


-- Selecionando valores distintos de uma coluna
SELECT DISTINCT contact_title FROM customers;