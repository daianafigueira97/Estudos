-- Funções de números CEILING (arredonda pra cima), FLOOR(arredonda pra baixo), ROUND(arredondamento matemático), TRUNC (cortar o valor - ela não arredonda)
SELECT 
	AVG(unit_price),
	CEILING(AVG(unit_price))
FROM products;

--SUBSTRING e STRPOS : para trazet uma determinada parte do texto
SELECT 
	'ABC-9999',
	SUBSTRING('ABC-9999', 1, 3),
	STRPOS('ABC-9999','-');

-- FUNÇÕES DE DATAS
-- CURRENT_DATE, AGE, DATE_PART
SELECT
	first_name,
	birth_date,
	CURRENT_DATE, --  Tras a data atual
	AGE(birth_date), -- trás o valor em anos de uma determinada informação
	DATE_PART('month', birth_date) -- trás o dia, mês, ano daquela determinada informação
FROM
	employees;
