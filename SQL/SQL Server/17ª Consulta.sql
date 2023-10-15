-- SEQUENCES: É um objeto utilizado para criar números sequenciais automáticos, são usados especialmente para gerar valores unicos em chaves primárias de tabelas
CREATE SEQUENCE clientes_seq
AS INT
START WITH	1 -- Começa com o número:
INCREMENT BY 1 -- Será incrementada de 1 em 1
NO MAXVALUE -- Não terá valor máximo
NO CYCLE -- Quando encerrar o valor da sequência, irá começar do zero, quando YES ele inicia do zero quando NO ele da erro ao encerrar o máximo de valores


SELECT NEXT VALUE FOR clientes_seq -- Próximo valor da sequência

DROP SEQUENCE clientes_seq -- Excluir sequência


--Utilização da SEQUENCE na prática em tabelas
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
		(NEXT VALUE FOR projetos_seq, 'Planejamento Estratégico'),
		(NEXT VALUE FOR projetos_seq, 'Desenvolvimento de APP'),
		(NEXT VALUE FOR projetos_seq, 'Plano de negócios'),
		(NEXT VALUE FOR projetos_seq, 'Visualização 3D')

SELECT
	*
FROM
	dProjeto

