-- Realizando os WHERE no postgre (usa case-sensitive) - Ou seja o Where em postgre considera que a informação selecionada esteja EXATAMENTE igual ao que está na tabela, com maíusculas, minusculas e acentos caso tenha

SELECT * FROM customers
WHERE contact_title = 'Owner';

SELECT * FROM orders
WHERE order_date >= '1998-01-01'; -- Necessário colocar na mesma ordem que a data é representada em tabela, nesse caso sendo DDDD-MM-AA
