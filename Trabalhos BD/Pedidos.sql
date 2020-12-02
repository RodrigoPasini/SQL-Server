Create DATABASE Pedidos
GO

use Pedidos
GO
CREATE TABLE Cliente (
	id int primary key identity,
	PrimeiroNome varchar(50),
	SegundoNome varchar (50),
	UltimoNome varchar(50),
	DataNasc datetime,
	CPF varchar (11),
	RG varchar(20)
	)
GO
CREATE TABLE Endereco (
	id int primary key identity,
	idCliente int not null,
	Rua varchar(50) not null,
	Cidade varchar (40),
	UF char (2) check (UF IN ('PR','SC','SP'))
	)
GO

ALTER TABLE Endereco ADD CONSTRAINT FK_Cliente_Endereco FOREIGN KEY (idCliente) REFERENCES Cliente(id)
GO

CREATE TABLE Pedido (
	id int primary key identity,
	idCliente int not null,
	data DATE,
	Preco decimal(12,2) not null
	)
GO

ALTER TABLE Pedido ADD CONSTRAINT FK_Cliente_Pedido FOREIGN KEY (idCliente) REFERENCES Cliente(id)

GO

CREATE TABLE Produto (
	id int primary key identity,
	Descrição varchar(50) not null,
	PrecoUnitario decimal (10,2) NOT NULL check (PrecoUnitario > 0)
	)
GO

CREATE TABLE PedidoItem (
	idPedidoItem int primary key identity,
	idProduto int not null,
	idPedido int not null,
	Quantidade int not null,
	PercDesconto Float,
	Preco Decimal (10,2) not null check (Preco > 0)
	)
GO

ALTER TABLE Pedidoitem ADD CONSTRAINT FK_Pedido_PedidoItem FOREIGN KEY (IdPedido) REFERENCES Pedido(id)

GO

ALTER TABLE Pedidoitem ADD CONSTRAINT FK_Pedido_Produto FOREIGN KEY (IdProduto) REFERENCES Produto(id)

SELECT * FROM Cliente
SELECT * FROM Endereco
SELECT * FROM Pedido
SELECT * FROM Produto
SELECT * FROM PedidoItem

INSERT INTO Cliente (PrimeiroNome, SegundoNome, UltimoNome, DataNasc, CPF, RG)
values
('Claudio', '', 'Barros', '19500101', '435234567', '54312345'),
('Mario', 'Rodrigues', 'Pereira','19520202', '234543765', '987123654')

INSERT INTO Endereco (IdCliente, Rua, Cidade, UF)
values
(1, 'Rua das Flores', 'Curitiba', 'PR'),
(1, 'Alameda dos Anjos', 'Curitiba', 'PR')

INSERT INTO Produto (Descrição, PrecoUnitario)
values
('Mesa de Vidro', 1050.98),
('Mesa de Ferro', 500.40)


-- --------------------------
-- CONSULTANO NAS VIEWS --
CREATE VIEW vw_PedidosClientes1
AS

-- SELECIONE OS PEDIDOS COM OS ITENS DOS CLIENTES - TRAGA TAMBÉM OS CLIENTES

SELECT P.Id IdPedido, P.Data DataPedido, P.Preco PrecoTotal,
PR.Id IdProduto, PR.Descrição Produto,
PI.PercDesconto Desconto, PI.Preco PrecoItem, PI.Quantidade,
C.Id IdCliente, C.PrimeiroNome, C.SegundoNome, C.UltimoNome, C.DataNasc, C.CPF, C.RG
FROM Pedido P
INNER JOIN PedidoItem PI
ON P.Id = PI.IdPedido
INNER JOIN Produto PR
ON PR.Id = PI.IdProduto
INNER JOIN Cliente C
ON C.Id = P.IdCliente

SELECT * FROM vw_PedidosClientes

UNION

-- RESTRIÇÃO: mesma quantidade de dados trazidos nos dois selects
SELECT P.Id IdPedido, P.Data DataPedido, P.Preco PrecoTotal,
0 IdProduto, '' Produto, 0 Desconto, 0 PrecoItem, 0 Quantidade,
C.Id Id.Cliente, C.PrimeiroNome, C.SegudoNome, C.UltimoNome, C.DataNasc, C.CPF, C.RG
--dbo.RetornaNomeCOmpleto(C.Id) NomeCompleto
FROM Pedido P
INNER JOIN
Cliente C
ON P.IdCliente = C.Id
WHERE NOT EXISTS (SELECT Id FROM PedidoItem PI WHERE PI.idPedido = P.id)

--RESTRIÇÃO: mesma quantidade de dados trazidos nos dois selects
-- selecione os pedidos sem itens

--pedidos, cliente verificação na tabela de PedidoItem, subconsulta NOT EXISTS/NOT IN

Pedido -- Produto -- PedidoItem - Cliente

