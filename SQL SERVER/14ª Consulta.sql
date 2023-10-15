-- Window Function (Funções de janela)
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
	(3, 'Empórioi Mineirinho', 'Sudeste', 2300),
	(4, 'Central Paulista', 'Sudeste', 1800),
	(5, 'Rio 90 graus', 'Sudeste', 700),
	(6, 'Casa Flor & Anópolis', 'Sul', 2100),
	(7, 'Pampas & Co', 'Sul', 990),
	(8, 'Paraná Papéis', 'Sul', 2800),
	(9, 'Amazonas Prime', 'Norte', 4200),
	(10, 'Pará Bens', 'Norte', 3200),
	(11, 'Tintas Rio Branco', 'Norte', 1500),
	(12, 'Nordestemido Hall', 'Nordeste', 1910),
	(13, 'Cachoerinha Loft', 'Nordeste', 2380)



SELECT
	*
FROM
	Lojas

--Funções de agregação: SUM, COUNT, AVG, MIN, MAX
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

-- Calculo de participação % sobre todas as lojas em relação a vendas:

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
-- Calculo de participação % sobre todas as lojas por REGIÃO em relação a vendas:
SELECT
	Id_Loja,
	Nome_Loja,
	Regiao,
	Qtd_vendida,
	SUM(Qtd_vendida) OVER(PARTITION BY Regiao) AS 'Vendas por região',
	FORMAT(Qtd_vendida / SUM(Qtd_vendida) OVER(PARTITION BY Regiao), '0.00%') AS '% das lojas por região'
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
	RANK() OVER(ORDER BY Qtd_vendida DESC) AS 'Rank', --Rankeia em ordem escolhida a coluna escolhida, em caso de empate, repete o rank e depois pula a casa do número
	DENSE_RANK() OVER(ORDER BY Qtd_vendida DESC) AS 'Dense rank', --Rankeia em ordem escolhida a coluna escolhida e em casao de empate repete o rank mas segue a sequencia sem pular numero
	NTILE(2) OVER(ORDER BY Qtd_vendida DESC) AS 'Ntile' --Enumera as linhas conforme a coluna escolhida em ordem escolhida, porém, enumera em grupos conforme a quantidade solicitada de separação de grupos
FROM
	Lojas

--Funções de classificação + PARTITION BY
SELECT
	Id_Loja,
	Nome_Loja,
	Regiao,
	Qtd_vendida,
	ROW_NUMBER() OVER(PARTITION BY Regiao ORDER BY Qtd_vendida DESC) AS 'ROW NUMBER POR REGIÃO'
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


--Cálculo de soma móvel e média móvel
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


-- Soma móvel

SELECT
	Data_Fechamento AS 'Data do Fechamento',
	Faturamento_MM AS 'Faturamento Total (em milhões)',
	SUM(Faturamento_MM) OVER(ORDER BY Data_Fechamento ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS 'Fat. Acumulado (em milhões)'
FROM Resultado
ORDER BY [Data do Fechamento]


-- Média móvel

SELECT
	Data_Fechamento AS 'Data do Fechamento',
	Faturamento_MM AS 'Faturamento Total (em milhões)',
	AVG(Faturamento_MM) OVER(ORDER BY Data_Fechamento ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS 'Fat. Acumulado (em milhões)'
FROM Resultado
ORDER BY [Data do Fechamento]



-- Cálculo acumulado
SELECT
	Data_Fechamento,
	Faturamento_MM,
	SUM(Faturamento_MM) OVER(ORDER BY Data_Fechamento ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Fat. Acumulado'
	--ROWS BETWEEN - se inicia na linha ou entre as linhas (número da linha ou posição) / PRECEDING AND CURRENT ROW - Procede ou percorre até a linha atual
	--UNBOUNDED - Ilimitado, usado para calculos acumulados + PRECEDING AND CURRENT ROW - Procede até a linha atual
	--Substituindo CURRENT ROW por (número da linha) + FOLLOWING ele tras a linha seguinte a partir do número de linhas, colocando 0 como número ele trás o mesmo resultado que CURRENT ROW
FROM Resultado


--Funções OFFSET (Deslocamento): LAG e LEAD
SELECT
	Data_Fechamento,
	Faturamento_MM,
	LAG(Faturamento_MM, 1, 0) OVER(ORDER BY Data_Fechamento) AS 'LAG', --LAG: Passa os valores para as linhas de baixo (Para as próximas linhas) da coluna informada, conforme a quantidade de linhas informada
	LEAD(Faturamento_MM, 1,0) OVER(ORDER BY Data_Fechamento) AS 'LEAD' --LEAD: Passa as linhas de baixo para cima (Para as linhas anteriores) da coluna informada, conforme a quantidade de linhas informada
	--Colocando zero depois da quantidade de linhas que deseja pular, ele retira os NULLs e substitui por ZERO
FROM Resultado

--Cálculo MoM: Variação entre meses, comparativos
SELECT
	Data_Fechamento,
	Faturamento_MM,
	ISNULL(FORMAT((Faturamento_MM / LAG(Faturamento_MM,1) OVER(ORDER BY Data_Fechamento)) - 1, '0.00%'), '0.00%') AS 'MoM'
FROM Resultado
--Cálculo de MoM de evolução mensal: (VALOR DO MÊS ATUAL - VALOR DO MÊS ANTERIOR)/(VALOR DO MÊS ANTERIOR) -Adaptavel para qualquer periodo
-- Mesma coisa que: (VALOR DO MÊS ATUAL / VALOR DO MÊS ANTERIOR)-(VALOR DO MÊS ANTERIOR)/(VALOR DO MÊS ANTERIOR)
-- Mesma coisa que: (VALOR DO MÊS ATUAL / VALOR DO MÊS ANTERIOR) - 1 ------> MAIS CONHECIDO E MAIS USADO 


--Funções de Offset (Deslocamento) - FIRST_VALUE: Valor da primeira linha e LAST_VALUE: Valor da ultima linha
SELECT
	Data_Fechamento,
	Faturamento_MM,
	FIRST_VALUE(Faturamento_MM) OVER(ORDER BY Data_Fechamento) AS 'Primeiro valor',
	LAST_VALUE(Faturamento_MM) OVER(ORDER BY Data_Fechamento ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 'Ultimo valor'
	-- Para a função LAST_VALUE é necess´´ario a inclusão das especificações de linha como ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
	-- ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING (Linhas entre anterior ilimitado e seguinte ilimitado)
FROM Resultado
ORDER BY Data_Fechamento


