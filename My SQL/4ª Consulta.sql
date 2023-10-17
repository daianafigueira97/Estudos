USE BASE;
-- Criando Functions

DELIMITER $$ -- essa função aplica um delimitador escolhido, nesse caso o sifrão para informar onde começa a estratura e até onde ela deve ser executada
CREATE FUNCTION fn_BoasVindas(Nome VARCHAR(100))
RETURNS VARCHAR(100) DETERMINISTIC -- O DETERMINISTIC é uma operação obrigatória do My SQL para determinas que os dados não serão alterados a partir de functions
BEGIN
	RETURN CONCAT('Olá ', nome, 'tudo bem?');
END $$

DELIMITER ;
SELECT fn_BoasVindas('Daiana');


-- Para alterar Functions e Procedures, é necessário ir com o botão direito em cima do nome da procedure ou function e depois selecionar a opção de "alter function" ou "Alter store procedure"
-- Desta forma será aberto um novo ambriente de alteração para realizar as altesrações necessárias e aplica-las ao final]


