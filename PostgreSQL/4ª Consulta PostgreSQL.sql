-- Tipos de dados
/*
INT - Número inteiro
NUMERIC(M, D) - Decimal onde M é o numero total de digitos e D é a quantidade de casas decimais permitidas
VARCHAR(N) - Textos
DATE - Datas
TIMESTAMP - Data e hora
*/

CREATE TABLE alunos(
			 id_curso INT,
			 nome_aluno VARCHAR(100),
			 email VARCHAR(100)
					);
SELECT * FROM alunos;					