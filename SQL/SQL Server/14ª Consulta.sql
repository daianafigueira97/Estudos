-- Window Function (Fun��es de janela)
CREATE DATABASE WF
USE WF

CREATE TABLE Lojas(
Id_Loja INT,
Nome_Loja VARCHAR(100),
Regiao VARCHAR(100),
Qtd_vendida FLOAT)

INSERT INTO Lojas(Id_Loja, Nome_Loja, Regiao, Qtd_vendida)
VALUES
	(1, 'Botafogo Praia&Mar', 'Sudeste', 1800),
	(2, 'Lojas Vitoria', 'Sudeste', 800),
	(3, 'Emp�rioi Mineirinho', 'Sudeste', 2300),
	(4, 'Central Paulista', 'Sudeste', 1800),
	(5, 'Rio 90 graus', 'Sudeste', 700),
	(6, 'Casa Flor & An�polis', 'Sul', 2100),
	(7, 'Pampas & Co', 'Sul', 990),
	(8, 'Paran� Pap�is', 'Sul', 2800),
	(9, 'Amazonas Prime', 'Norte', 4200),
	(10, 'Par� Bens', 'Norte', 3200),
	(11, 'Tintas Rio Branco', 'Norte', 1500),
	(12, 'Nordestemido Hall', 'Nordeste', 1910),
	(13, 'Cachoerinha Loft', 'Nordeste', 2380)



SELECT
	*
FROM
	Lojas

--Fun��es de agrega��o: SUM, COUNT, AVG, MIN, MAX
SELECT
	Id_Loja,
	Nome_Loja,
	Regiao,
	Qtd_vendida,
	SUM(Qtd_vendida) OVER(PARTITION BY Regiao) AS 'Total Vendido'
FROM
	Lojas
ORDER BY Id_Loja
--OVER( Calculo de todas as linhas, PARTITION BY seria PARTES DE e o nome da coluna que quer calcular por linhas em parte)

-- Calculo de participa��o % sobre todas as lojas em rela��o a vendas:

SELECT
	Id_Loja,
	Nome_Loja,
	Regiao,
	Qtd_vendida,
	SUM(Qtd_vendida) OVER() AS 'Total vendido',
	FORMAT(Qtd_vendida / SUM(Qtd_vendida) OVER(), '0.00%') AS '% do Total'
FROM
	Lojas
ORDER BY Id_Loja

;
-- Calculo de participa��o % sobre todas as lojas por REGI�O em rela��o a vendas:
SELECT
	Id_Loja,
	Nome_Loja,
	Regiao,
	Qtd_vendida,
	SUM(Qtd_vendida) OVER(PARTITION BY Regiao) AS 'Vendas por regi�o',
	FORMAT(Qtd_vendida / SUM(Qtd_vendida) OVER(PARTITION BY Regiao), '0.00%') AS '% das lojas por regi�o'
FROM
	Lojas
ORDER BY Id_Loja

-- ROW_NUMBER, RANK, DENSE_RANK, NTILE
SELECT
	Id_Loja,
	Nome_Loja,
	Regiao,
	Qtd_vendida,
	ROW_NUMBER() OVER(ORDER BY Qtd_vendida DESC) AS 'Rows Number', --Enumera as linhas conforme a coluna que escolhida em order escolhida
	RANK() OVER(ORDER BY Qtd_vendida DESC) AS 'Rank', --Rankeia em ordem escolhida a coluna escolhida, em caso de empate, repete o rank e depois pula a casa do n�mero
	DENSE_RANK() OVER(ORDER BY Qtd_vendida DESC) AS 'Dense rank', --Rankeia em ordem escolhida a coluna escolhida e em casao de empate repete o rank mas segue a sequencia sem pular numero
	NTILE(2) OVER(ORDER BY Qtd_vendida DESC) AS 'Ntile' --Enumera as linhas conforme a coluna escolhida em ordem escolhida, por�m, enumera em grupos conforme a quantidade solicitada de separa��o de grupos
FROM
	Lojas

--Fun��es de classifica��o + PARTITION BY
SELECT
	Id_Loja,
	Nome_Loja,
	Regiao,
	Qtd_vendida,
	ROW_NUMBER() OVER(PARTITION BY Regiao ORDER BY Qtd_vendida DESC) AS 'ROW NUMBER POR REGI�O'
FROM
	Lojas
ORDER BY Id_Loja


--RANK + GROUP BY
SELECT
	Regiao,
	SUM(Qtd_vendida) AS 'Total vendido',
	RANK() OVER(ORDER BY SUM(Qtd_vendida) DESC) AS 'Ranking'
FROM
	Lojas
GROUP BY Regiao


--C�lculo de soma m�vel e m�dia m�vel
CREATE TABLE Resultado(
Data_Fechamento DATETIME,
Faturamento_MM FLOAT)


INSERT INTO Resultado(Data_Fechamento, Faturamento_MM)
VALUES
	('01/01/2020', 8),
	('01/02/2020', 10),
	('01/03/2020', 6),
	('01/04/2020', 9),
	('01/05/2020', 5),
	('01/06/2020', 4),
	('01/07/2020', 7),
	('01/08/2020', 11),
	('01/09/2020', 9),
	('01/10/2020', 12),
	('01/11/2020', 11),
	('01/12/2020', 10)

SELECT * FROM Resultado


-- Soma m�vel

SELECT
	Data_Fechamento AS 'Data do Fechamento',
	Faturamento_MM AS 'Faturamento Total (em milh�es)',
	SUM(Faturamento_MM) OVER(ORDER BY Data_Fechamento ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS 'Fat. Acumulado (em milh�es)'
FROM Resultado
ORDER BY [Data do Fechamento]


-- M�dia m�vel

SELECT
	Data_Fechamento AS 'Data do Fechamento',
	Faturamento_MM AS 'Faturamento Total (em milh�es)',
	AVG(Faturamento_MM) OVER(ORDER BY Data_Fechamento ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS 'Fat. Acumulado (em milh�es)'
FROM Resultado
ORDER BY [Data do Fechamento]



-- C�lculo acumulado
SELECT
	Data_Fechamento,
	Faturamento_MM,
	SUM(Faturamento_MM) OVER(ORDER BY Data_Fechamento ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Fat. Acumulado'
	--ROWS BETWEEN - se inicia na linha ou entre as linhas (n�mero da linha ou posi��o) / PRECEDING AND CURRENT ROW - Procede ou percorre at� a linha atual
	--UNBOUNDED - Ilimitado, usado para calculos acumulados + PRECEDING AND CURRENT ROW - Procede at� a linha atual
	--Substituindo CURRENT ROW por (n�mero da linha) + FOLLOWING ele tras a linha seguinte a partir do n�mero de linhas, colocando 0 como n�mero ele tr�s o mesmo resultado que CURRENT ROW
FROM Resultado


--Fun��es OFFSET (Deslocamento): LAG e LEAD
SELECT
	Data_Fechamento,
	Faturamento_MM,
	LAG(Faturamento_MM, 1, 0) OVER(ORDER BY Data_Fechamento) AS 'LAG', --LAG: Passa os valores para as linhas de baixo (Para as pr�ximas linhas) da coluna informada, conforme a quantidade de linhas informada
	LEAD(Faturamento_MM, 1,0) OVER(ORDER BY Data_Fechamento) AS 'LEAD' --LEAD: Passa as linhas de baixo para cima (Para as linhas anteriores) da coluna informada, conforme a quantidade de linhas informada
	--Colocando zero depois da quantidade de linhas que deseja pular, ele retira os NULLs e substitui por ZERO
FROM Resultado

--C�lculo MoM: Varia��o entre meses, comparativos
SELECT
	Data_Fechamento,
	Faturamento_MM,
	ISNULL(FORMAT((Faturamento_MM / LAG(Faturamento_MM,1) OVER(ORDER BY Data_Fechamento)) - 1, '0.00%'), '0.00%') AS 'MoM'
FROM Resultado
--C�lculo de MoM de evolu��o mensal: (VALOR DO M�S ATUAL - VALOR DO M�S ANTERIOR)/(VALOR DO M�S ANTERIOR) -Adaptavel para qualquer periodo
-- Mesma coisa que: (VALOR DO M�S ATUAL / VALOR DO M�S ANTERIOR)-(VALOR DO M�S ANTERIOR)/(VALOR DO M�S ANTERIOR)
-- Mesma coisa que: (VALOR DO M�S ATUAL / VALOR DO M�S ANTERIOR) - 1 ------> MAIS CONHECIDO E MAIS USADO 


--Fun��es de Offset (Deslocamento) - FIRST_VALUE: Valor da primeira linha e LAST_VALUE: Valor da ultima linha
SELECT
	Data_Fechamento,
	Faturamento_MM,
	FIRST_VALUE(Faturamento_MM) OVER(ORDER BY Data_Fechamento) AS 'Primeiro valor',
	LAST_VALUE(Faturamento_MM) OVER(ORDER BY Data_Fechamento ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 'Ultimo valor'
	-- Para a fun��o LAST_VALUE � necess��ario a inclus�o das especifica��es de linha como ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
	-- ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING (Linhas entre anterior ilimitado e seguinte ilimitado)
FROM Resultado
ORDER BY Data_Fechamento


