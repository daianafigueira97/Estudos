-- CONSTRAINTS: regras e restrições para uma coluna ou para uma tabela
/* OS 7 Tipos de CONSTRAINTS
1. NOTNULL; NÃO ACEITA VALORES NULOS
2. UNIQUE; NÃO ACEITA VALORES DUPLICADOS (MAS ACEITA VALORES NULOS)
3. CHECK; VERIFICA SE O VALOR ADICIONADO ATENDE A UMA DETERMINADA CONDIÇÃO
4. DEFAULT; RETORNA O VALOR DEFAULT CASO A COLUNA NÃO SEJA PREENCHIDA
5. IDENTITY; PERMITE QUE UMA COLUNA SIGA EM AUTO NUMERAÇÃO (USADA EM COLUNA DE ID)
6. PRIMARY KEY; IDENTIFICA SE A COLUNA DE CHAVE PRIMÁRIA REALMENTE SEGUE AS REGRAS DE NÃO REPETIR OU ESTAR NULO
7. FOREIGN KEY; É A CHAVE ESTRANGEIRA, COLUNA NA QUAL ESTARÁ CONECTADA DIRETAMENTE COM A PRIMARY KEY, CHAVE PRIMARIA DE OUTRA TABELA
*/

USE Testes

CREATE TABLE dCliente(
					  id_cliente INT IDENTITY(1, 1), --Começa em 1 e vai incrementando de 1 em 1
					  nome_cliente VARCHAR(100) NOT NULL,
					  genero VARCHAR(100) NOT NULL,
					  data_nascimento DATE NOT NULL,
					  cpf VARCHAR(100) NOT NULL,
					  CONSTRAINT dCliente_id_cliente_pk PRIMARY KEY (id_cliente),
					  CONSTRAINT dCliente_genero_ck CHECK(genero IN ('M', 'F', 'O', 'PND')),
					  CONSTRAINT dCliente_cpf_un UNIQUE(cpf)
					  )

INSERT INTO dCliente(Nome_Cliente, Genero, data_nascimento, CPF)
VALUES
	('André Martins',  'M',  '12/02/1989', '839.283.190-00'),
	('Bárbara Campos',  'F', '07/05/1992', '351.391.410-02'),
	('Carol Freitas',  'F',  '23/04/1985', '139.274.921-12'),
	('Diego Cardoso',   'M', '11/10/1994', '192.371.081-17'),
	('Eduardo Pereira', 'M', '09/11/1988', '193.174.192-82'),
	('Fabiana Silva',  'F',  '02/09/1989', '231.298.471-98'),
	('Gustavo Barbosa', 'M', '27/06/1993', '240.174.171-76'),
	('Helen Viana',    'F',  '11/02/1990', '193.129.183-01'),
	('Igor Castro',    'M',  '21/08/1989', '184.148.102-29'),
	('Juliana Pires',   'F', '13/01/1991', '416.209.192-47')

SELECT * FROM dCliente



CREATE TABLE dGerente(
	id_gerente INT IDENTITY(1, 1),
	nome_gerente VARCHAR(100) NOT NULL,
	data_contratacao VARCHAR(100) NOT NULL,
	salario FLOAT NOT NULL,
	CONSTRAINT dgerente_id_gerente_pk PRIMARY KEY(id_gerente),
	CONSTRAINT dgerente_salario_ck CHECK(salario > 0)
)



INSERT INTO dGerente(Nome_Gerente, Data_Contratacao, Salario)
VALUES
	('Lucas Sampaio',   '21/03/2015', 6700),
	('Mariana Padilha', '10/01/2011', 9900),
	('Nathália Santos', '03/10/2018', 7200),
	('Otávio Costa',    '18/04/2017', 11000)


SELECT * FROM dGerente



CREATE TABLE fContratos(
	id_contrato INT IDENTITY(1, 1),
	data_assinatura DATE DEFAULT GETDATE(),
	id_cliente INT,
	id_gerente INT,
	valor_contrato FLOAT,
	CONSTRAINT fcontratos_id_contrato_pk PRIMARY KEY(id_contrato),
	CONSTRAINT fcontratos_id_cliente_fk FOREIGN KEY(id_cliente) REFERENCES dCliente(id_cliente),
	CONSTRAINT fcontratos_id_gerente_fk FOREIGN KEY(id_gerente) REFERENCES dGerente(id_gerente),
	CONSTRAINT fcontratos_valor_contrato_ck CHECK(valor_contrato > 0)
)

INSERT INTO fContratos(Data_Assinatura, ID_Cliente, ID_Gerente, Valor_Contrato)
VALUES
	('12/01/2019', 8, 1, 23000),
	('10/02/2019', 3, 2, 15500),
	('07/03/2019', 7, 2, 6500),
	('15/03/2019', 1, 3, 33000),
	('21/03/2019', 5, 4, 11100),
	('23/03/2019', 4, 2, 5500),
	('28/03/2019', 9, 3, 55000),
	('04/04/2019', 2, 1, 31000),
	('05/04/2019', 10, 4, 3400),
	('05/04/2019', 6, 2, 9200)


SELECT * FROM fContratos

-- Para deletar CONSTRAINTS:
ALTER TABLE fContratos
DROP CONSTRAINT fcontratos_id_contrato_pk -- Exemplo de formato para deletar uma CONSTRAINT

-- Para adicionar CONSTRAINTS:
ALTER TABLE fContratos
ADD CONSTRAINT fcontratos_id_contrato_pk PRIMARY KEY(id_contrato) -- Excemplo de formato para adicionar uma nova CONSTRAINT


-- Para renomear, com o botão direito em cima da informação na lista de banco de dados, clicando na opção 'renomear' isso se faz possível