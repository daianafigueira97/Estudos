-- Concatenações CONCAT / CONCAT_WS
SET @varNome = 'Marcus';
SET @varSobreNome = 'Cavalcanti';
SET @varNomeCompleto = CONCAT(@varNome, ' ', @varSobrenome);
SET @varNomeCompleto2 = CONCAT_WS(' ', @varNome, @varSobreNome);

SELECT @varNomeCompleto2;

-- Funções LCASE: Deixar a informação em minuscula / UCASE: Deixar as informações em minuscula
-- Função REPLACE: Substituir um texto por outro texto - esse tem também no SQL Server, sendo agora, só uma lembrança 
SELECT
	NOW(), -- Informação de data e hora de agora (no SQL Server seria o GET DATE()
    CURDATE(), -- Data de hoje
    CURTIME(); -- Hora de hoje 
    