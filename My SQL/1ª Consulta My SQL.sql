# Este é um comentário
-- Este é outro comentário
/* Este é um outro comentário em bloco */
SELECT * FROM produtos;
SELECT * FROM pedidos;
-- Quando o banco de dados não é definido como padrão é necessário colocar o nome do banco.tabela 
SELECT * FROM sakila.film;
-- Formas de executar códigos: Clicando no raio (executa todos os códigos), selecionar o trecho de código e apertar o raio para executar apenas o que quiser,
-- Na linha do trecho que quer executar, pode clicar no segundo raio sem precisar selecionar
-- Por atalhos como CTRL + SHIFT + ENTER / CTRL + ENTER

-- Cuidados com pontos e virgula (;): Quando não se coloca o ponto e virgula no final dos códigos ele passará a trazer erros por conta da falta de ;
SELECT
	ID_Produto,
	Nome_Produto,
    Preco_Unit
FROM produtos;

