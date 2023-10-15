--Loops no SQL (Estrutura de repeti��o)
-- WHILE / BREAK / CONTINUE
-- WHILE condi��o BEGIN comandos END (Estrutura WHILE)
DECLARE @contador INT = 1
WHILE
	@contador <= 10
BEGIN
	PRINT 'O valor do contato �: ' + CONVERT(VARCHAR, @contador)
	SET	@contador = @contador + 1
END
;

-- BREAK: encerrando um loop antes dele chegar ao final
DECLARE @contador INT = 1
WHILE
	@contador <= 100
BEGIN
	IF @contador = 15 
	BREAK
	PRINT 'O valor do contato �: ' + CONVERT(VARCHAR, @contador)
	SET	@contador = @contador + 1
	
END -- IF antes do BEGIN para um numero antes caso seja em n�mero

DECLARE @contador INT = 1
WHILE
	@contador <= 100
BEGIN
	PRINT 'O valor do contato �: ' + CONVERT(VARCHAR, @contador)
	IF @contador = 15 
	BREAK
	SET	@contador += 1
	
END -- IF depois do BEGIN para no numero indicado caso seja em n�mero


--Utilizando CONTINUE mais uma maneira de interromper o loop por�m continuar ap�s a interrup��o
DECLARE @contador INT = 0
WHILE
	@contador < 100
BEGIN
	SET	@contador += 1
	IF @contador = 3 OR @contador = 6
	CONTINUE
	PRINT 'O valor do contato �: ' + CONVERT(VARCHAR, @contador)	
END

