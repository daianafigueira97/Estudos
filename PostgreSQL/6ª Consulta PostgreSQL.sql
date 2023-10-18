-- Blocos anônimos: blocos de códigos que vão realizar comandos que fazem ações
<<LABLE>> -- Demarcação de onde comeã e onde termina o bloco
DECLARE
	nome VARCHAR(100);
	salario DECIMAL;
	data_contratacao date;
BEGIN
	nome : = 'André';
	salario : = 3500;
	data_contatacao : = '25-10-2018'
	RAISE NOTICE 'O funcionário % foi contratado em % e recebe um salário de %.', nome, data_contratacao, salario;
END LABEL;


DO $$
DECLARE
	nome VARCHAR(100);
	salario DECIMAL;
	data_contratacao date;
BEGIN
	nome:= 'André';
	salario:= 3500;
	data_contratacao:= '25-10-2018'
	RAISE NOTICE 'O funcionário % foi contratado em % e recebe um salário de % .', nome, data_contratacao, salario;
END $$;