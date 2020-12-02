CREATE DATABASE CadProdutos

USE CadProdutos

create table Produto
(
	codigo int primary key identity (1,1),
	nome varchar (100),
	qtde int,
	importacao bit,
	dataValidade date
)
select* from Produto

insert into Produto
(nome, qtde, importacao, dataValidade)
VALUES
('Doce de Goiaba', 50,1, '2020-12-04')