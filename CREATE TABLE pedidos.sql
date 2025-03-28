
USE PRJ_INTEGRATION
GO


-- tabela de pedidos
DROP TABLE IF EXISTS pedidos
GO

CREATE TABLE pedidos (

	id_pedido INT IDENTITY(1,1) PRIMARY KEY,  -- id do pedido, chave prim�ria
	id_cliente	INT, -- id do cliente que fez o pedido
	id_departamento INT, -- id do departamento
	data_pedido	DATE, -- data do pedido
	valor_pedido INT, -- valor do pedido

	-- chave secundária id_cliente
	CONSTRAINT FK_idCliente FOREIGN KEY (id_cliente)
	REFERENCES clientes(id_cliente),

	-- chave secundária id_departamento
	CONSTRAINT FK_idDepartamento FOREIGN KEY (id_departamento)
	REFERENCES departamento(id_departamento)

);



-- tabela departamento
DROP TABLE IF EXISTS departamento
GO

CREATE TABLE departamento (

		id_departamento INT PRIMARY KEY,
		nome_departaento VARCHAR(100)

);


-- tabela clientes
DROP TABLE IF EXISTS clientes
GO

CREATE TABLE clientes (

	id_cliente INT PRIMARY KEY,
	nome VARCHAR(50),
	sobrenome VARCHAR(50)

);
