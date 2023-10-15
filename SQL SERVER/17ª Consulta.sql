-- SEQUENCES: � um objeto utilizado para criar n�meros sequenciais autom�ticos, s�o usados especialmente para gerar valores unicos em chaves prim�rias de tabelas
CREATE SEQUENCE clientes_seq
AS INT
START WITH	1 -- Come�a com o n�mero:
INCREMENT BY 1 -- Ser� incrementada de 1 em 1
NO MAXVALUE -- N�o ter� valor m�ximo
NO CYCLE -- Quando encerrar o valor da sequ�ncia, ir� come�ar do zero, quando YES ele inicia do zero quando NO ele da erro ao encerrar o m�ximo de valores


SELECT NEXT VALUE FOR clientes_seq -- Pr�ximo valor da sequ�ncia

DROP SEQUENCE clientes_seq -- Excluir sequ�ncia


--Utiliza��o da SEQUENCE na pr�tica em tabelas
USE Testes
 
CREATE SEQUENCE projetos_seq
AS INT
START WITH 1
INCREMENT BY 1
NO MAXVALUE
NO CYCLE

CREATE TABLE dProjeto(
					 id_projeto INT,
					 nome_projeto VARCHAR(100) NOT NULL,
					 CONSTRAINT dProjeto_id_projeto_pk PRIMARY KEY (id_projeto)
					 )
INSERT INTO dProjeto(id_projeto, nome_projeto)
VALUES
		(NEXT VALUE FOR projetos_seq, 'Planejamento Estrat�gico'),
		(NEXT VALUE FOR projetos_seq, 'Desenvolvimento de APP'),
		(NEXT VALUE FOR projetos_seq, 'Plano de neg�cios'),
		(NEXT VALUE FOR projetos_seq, 'Visualiza��o 3D')

SELECT
	*
FROM
	dProjeto

