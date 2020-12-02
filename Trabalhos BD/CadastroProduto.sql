create database CadastroProduto

Use CadastroProduto

create table CadastrodeProduto(
Codigo int Primary Key Identity,
Nome varchar(60),
Quantidade int,
DataVencimento datetime,
Importacao bit
)

select * from CadastrodeProduto