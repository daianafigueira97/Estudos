-- Trabalhando com procedures no PostgreeSQL
CREATE OR REPLACE PROCEDURE cadastra_cliente(novo_id INT, novo_cliente VARCHAR(100), saldo_inicial DECIMAL)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO contas(id, nome, saldo)
VALUES
	(novo_id, novo_cliente, saldo_inicial);
	COMMIT;
END $$;

CALL cadastra_cliente(3, 'Caio', 300);