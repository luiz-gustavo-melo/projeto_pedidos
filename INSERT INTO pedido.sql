

-- tabela departamento
INSERT INTO departamento (id_departamento, nome_departaento) VALUES (1, 'Eletrônicos');
INSERT INTO departamento (id_departamento, nome_departaento) VALUES (2, 'Vestuário');
INSERT INTO departamento (id_departamento, nome_departaento) VALUES (3, 'Alimentos');
INSERT INTO departamento (id_departamento, nome_departaento) VALUES (4, 'Livros');
INSERT INTO departamento (id_departamento, nome_departaento) VALUES (5, 'Esportes');



-- tabela clientes 
INSERT INTO clientes (id_cliente, nome, sobrenome) VALUES (1, 'Amanda', 'Azevedo');
INSERT INTO clientes (id_cliente, nome, sobrenome) VALUES (2, 'Calebe', 'Moraes');
INSERT INTO clientes (id_cliente, nome, sobrenome) VALUES (3, 'Yuri', 'Mendes');
INSERT INTO clientes (id_cliente, nome, sobrenome) VALUES (4, 'Lara', 'Lima');
INSERT INTO clientes (id_cliente, nome, sobrenome) VALUES (5, 'Nicolas', 'Lima');


-- tabela pedidos
DECLARE @ID INT;
SET @ID = (SELECT ISNULL(MAX(id_pedido), 1) FROM dbo.pedidos);

WHILE @ID <= 1000
BEGIN
    DECLARE @Ano INT = FLOOR(RAND() * (2025 - 2020 + 1)) + 2020;
    DECLARE @Mes INT = FLOOR(RAND() * 12) + 1;
    DECLARE @DiaMax INT;

    -- Definir o n�mero m�ximo de dias do m�s
    SET @DiaMax = CASE 
                    WHEN @Mes IN (1, 3, 5, 7, 8, 10, 12) THEN 31
                    WHEN @Mes IN (4, 6, 9, 11) THEN 30
                    WHEN @Mes = 2 THEN CASE 
                                          WHEN (@Ano % 4 = 0 AND @Ano % 100 != 0) OR (@Ano % 400 = 0) THEN 29
                                          ELSE 28
                                       END
                 END;

    DECLARE @Dia INT = FLOOR(RAND() * @DiaMax) + 1;
    DECLARE @DataPedido DATE = DATEFROMPARTS(@Ano, @Mes, @Dia);

    INSERT INTO pedidos (id_cliente, id_departamento, data_pedido, valor_pedido)
    VALUES (
        FLOOR(RAND(CHECKSUM(NEWID())) * 5) + 1,
        FLOOR(RAND(CHECKSUM(NEWID())) * 5) + 1,
        @DataPedido,
        FLOOR(RAND(CHECKSUM(NEWID())) * 5000) + 1
    );

    SET @ID = @ID + 1;
END

