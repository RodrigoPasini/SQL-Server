-- Criando o Banco de Dados "Estoque"
create database Estoque

--Selecionando a chave "Estoque"

use Estoque

--Criando a tabela "Cliente"

create table Cliente(
	Codigo int primary key identity,
	Nome varchar(50),
	DataNascimento date,
	Sexo varchar(20)
)

--Criando a Tabela "TipoEndereco"

create table TipoEndereco(
	Codigo int primary key identity,
	Descricao varchar(50)
)

-- Criando a Tabela "Endereco"

create table Endereco(
	Codigo int primary key identity,
	Rua varchar(50),
	Bairro varchar (30),
	CEP varchar(10),
	Numero int,
	Complemento varchar (50)
)

-- Criando a Tabela "Telefone"

create table Telefone(
	Codigo int primary key identity,
	Telefone varchar(16)
)

--Inserindo a chave "CodigoCliente" na Tabela "Endereco"
alter table Endereco ADD CodigoCliente int NOT NULL

--Inserindo a Chave Estrangeira "Cliente(Codigo)" na Tabela "Endereco"
alter table Endereco ADD FOREIGN KEY (CodigoCliente) REFERENCES Cliente(Codigo)

--Inserindo a chave "CodigoCliente" na Tabela "Telefone"
alter table Telefone ADD CodigoCliente int NOT NULL

--Inserindo a Chave Estrangeira "Cliente(Codigo)" na Tabela "Telefone"
alter table Telefone ADD FOREIGN KEY (CodigoCliente) REFERENCES Cliente(Codigo)

--Inserindo dados na Tabela "Cliente"
insert into Cliente VALUES ('Jorge da Fonseca', '2000/03/10', 'M')
insert into Cliente VALUES ('Mario da Silva', '1950/10/10', 'M')
insert into Cliente VALUES ('Jorge Carraro', '1986/07/07', 'M')
insert into Cliente VALUES ('Eduardo Lemos', '1999/12/31', 'M')
insert into Cliente VALUES ('Gabriel Teixeira', '2002/02/02', 'M')
insert into Cliente VALUES ('Maria Branca', '1990/05/18', 'F')
insert into Cliente VALUES ('Daiane Crevei', '1993/06/06', 'F')
insert into Cliente VALUES ('Larissa Alves', '2015/04/12', 'F')
insert into Cliente VALUES ('Katia de Lima', '2005/09/09', 'F')
insert into Cliente VALUES ('Joaquina Pereira dos Santos', '1910/01/01', 'F')

--Inserindo dados na Tabela "TipoEndereco"
insert into TipoEndereco VALUES ('Casa')
insert into TipoEndereco VALUES ('Trabalho')

--Inserindo a chave "CodigoTipo Endereco" na Tabela "Endereco"
alter table Endereco ADD CodigoTipoEndereco int NOT NULL

--Inserindo a Chave Estrangeira "TipoEndereco(Codigo)" na Tabela "Endereco"
alter table Endereco ADD FOREIGN KEY (CodigoTipoEndereco) REFERENCES TipoEndereco(Codigo)

--Inserindo dados na Tabela "Endereco"
insert into Endereco VALUES ('Rua do amor', 'Centro', '85603-495', '434', '', 1, 1)
insert into Endereco VALUES ('Rua Tapajós', 'Mercês', '85435-124', '1234', '', 1, 2)
insert into Endereco VALUES ('Rua dos Pinheiros', 'Bigorrilho', '81746-394', '1353', 'Ap 453', 2, 1)
insert into Endereco VALUES ('Rua Viscondede Nacar', 'Centro', '87461-401', '2394', 'Conj 340', 2, 2)
insert into Endereco VALUES ('Rua Almirante Tamandaré', 'Portão', '87463-384', '394', '', 3, 1)
insert into Endereco VALUES ('Rua Canadá', 'Fazendinha', '86473-431', '84', '', 3, 2)
insert into Endereco VALUES ('Rua Paraná', 'Centro', '82748-301', '1093', '', 4, 1)
insert into Endereco VALUES ('Rua Amoras', 'Centro', '85603-495', '430', '', 4, 2)
insert into Endereco VALUES ('Rua Rio Claro', 'Pinheirinho', '87463-345', '230', '', 5, 1)
insert into Endereco VALUES ('Rua Pinheiros', 'Boa Vista', '84736-392', '434', '', 5, 2)
insert into Endereco VALUES ('Rua Estados Unidos', 'Boa Vista', '87467038', '500', 'Ap 56', 6, 1)
insert into Endereco VALUES ('Rua Nova', 'Cabral', '89483-934', '9484', '', 6, 2)
insert into Endereco VALUES ('Rua Pereira', 'Centro', '83784-183', '3948', '', 7, 1)
insert into Endereco VALUES ('Rua Pimenta', 'Capão Raso', '84737-039', '4562', 'Ap 62 T5', 7, 2)
insert into Endereco VALUES ('Rua XV de Novembro', 'Cabral', '83746-038', '398', '', 8, 1)
insert into Endereco VALUES ('Rua Santos Dumont', 'Santa Felicidade', '85603-493', '3728', '', 8, 2)
insert into Endereco VALUES ('Rua Ermelino de Leão', 'Uberaba', '85603-491', '038', 'Ap 4', 9, 1)
insert into Endereco VALUES ('Rua Jararaca', 'Tingui', '85303-495', '8387', '', 9, 2)
insert into Endereco VALUES ('Rua Fernando Gomes', 'Água Verde', '85643-495', '829', '', 10, 1)
insert into Endereco VALUES ('Rua José', 'Tingui', '85123-495', '183', 'Conj 10', 10, 2)
insert into Endereco VALUES ('Rua XV DE setembro', 'Tingui', '85123-495', '183', 'Conj 10', 4, 1)

--Inserindo dados na Tabela "Telefone"
insert into Telefone VALUES ('(041) 89384-3984', 1),
('(041) 99103-4984', 2),
('(041) 93456-4324', 3),
('(041) 89374-3456', 4),
('(041) 90139-3367', 5),
('(041) 99803-6948', 6),
('(041) 88973-1093', 7),
('(041) 88903-1839', 8),
('(041) 87940-1093', 9),
('(041) 99409-2903', 10)

--Selecione os clientes do sexo masculino

select Nome, Sexo from Cliente where Sexo='M'

--Selecione os clientes cujos nomes começam com a letra "D"

select Nome from Cliente where Nome like 'd%'

--Selecione os clientes que tenham a letra D no nome

select Nome from Cliente where Nome like '%d%'

--Selecione os clientes que nasceram depos de 01/01/2000

select Nome, DataNascimento from Cliente where DataNascimento > '01/01/2000'

--Selecione o nome dos clientes e seus endereços

select Nome, Rua, Bairro, CEP, Numero, Complemento
from Cliente
inner join Endereco
on Cliente.Codigo = Endereco.CodigoCliente order by Nome

/*Selecione o nome do Cliente, Rua, Número e descrição do tipo de endereço
ordenado por nome (utilizando inner join)*/

select Cliente.Nome, Endereco.Rua, Endereco.Numero, TipoEndereco.Descricao
from Cliente
inner join Endereco
on Endereco.CodigoCliente = Cliente.Codigo
inner join TipoEndereco
on TipoEndereco.Codigo = Endereco.CodigoTipoEndereco
order by Cliente.Nome;

/*Selecione o nome do Cliente, Rua, Número e descrição do tipo de endereço
ordenado por nome (utilizando WHERE e AND)*/

select Cliente.Nome, Endereco.Rua, Endereco.Numero, TipoEndereco.Descricao
as Descricao 
from Cliente, Endereco, TipoEndereco
where Cliente.Codigo = Endereco.CodigoCliente and Endereco.CodigoTipoEndereco = TipoEndereco.Codigo
order by Cliente.Nome

--Selecione os clientes que não tenham endereço cadastrado

insert into Cliente VALUES ('Joaquim Silvestre', '1960/07/13', 'M'),
('Sergio Silveira Campos', '1982/05/23', 'M')

SELECT * FROM Cliente 
LEFT JOIN Endereco 
ON Endereco.CodigoCliente = Cliente.Codigo
where Endereco.Codigo is null


--Selecione os clientes que tenham endereço cadastrado

select Cliente.Nome, Endereco.Rua
From Cliente, Endereco
where Cliente.Codigo = Endereco.CodigoCliente

-- Selecione os clientes com endereço e telefone

select Cliente.Nome, Endereco.Rua, Telefone.Telefone
From Cliente, Endereco, Telefone
where Cliente.Codigo = Endereco.CodigoCliente and Cliente.Codigo = Telefone.CodigoCliente

--Selecione os clientes com endereço tipo casa e telefone

select Nome, Telefone, Descricao
from Cliente, Telefone, TipoEndereco
where Cliente.Codigo = Telefone.CodigoCliente and TipoEndereco.Codigo = 1

--Selecione clientes que tenham mais de um endereço tipo casa e mostre só esses endereços

SELECT aa.Nome, bb.Bairro, bb.Rua
	FROM Cliente aa
	INNER JOIN Endereco bb
	on aa.Codigo = bb.CodigoCliente
WHERE aa.Codigo = (
SELECT a.Codigo
FROM Cliente a
INNER JOIN Endereco b 
ON b.CodigoCliente = a.Codigo
WHERE b.CodigoTipoEndereco = 1
GROUP BY a.Codigo
HAVING COUNT(a.Codigo) > 1)
AND bb.CodigoTipoEndereco = 1


--Selecione o nome do cliente e quantidade de endereços

SELECT Nome , COUNT(E.Codigo) As Quantidade
FROM Cliente C
left join Endereco E
on C.Codigo = E.CodigoCliente
group by Nome







