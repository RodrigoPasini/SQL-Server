--TEMA: SISTEMA DE ESTACIONAMENTO

--ALUNOS: RODRIGO FIAD PASINI e JOÃO ZUQUETTO COLARES CERQUEIRA

/*TEXTO: 
O referente trabalho aborda um sistema básico de estacionamento que pode ser aplicado em varios setores
como por exemplo um shopping, hospitais, centros comerciais entre outros estabelecimentos. O sistema consiste
em um banco de dados que tem como base quatro tabelas:

Tabela "CLIENTE" possuindo os seguintes atributos "id", "PrimeiroNome", "SegundoNome",
"UltimoNome", "DataNasc", "RG", "CPF".

Tabela "Endereco" possue "id", "Rua", "Numero", "Complemento", "Bairro", "Cidade", "UF", "idCliente" que é a chave 
estrangeira da tabela "Cliente".

Tabela "Veiculo" possue "id", "Cor", "Marca", "Modelo", "Anofrabricacao", "Placa", "idCliente" sendo chave estrangeira
da tabela "Cliente".

Tabela"Estacionar" possue "id", "HorarioEntrada", "HorarioSaida", "IdCliente" que é a chave estrangeira da tabela
"Cliente" e por ultimo "idVeiculo" marcado como chave estrangeira da tabela "Veiculo"

*/
CREATE DATABASE Estacionamento
GO

USE Estacionamento
GO

CREATE TABLE Cliente(

	id int primary key identity,
	PrimeiroNome varchar(50),
	SegundoNome varchar(50),
	UltimoNome varchar(50),
	DataNasc date,
	RG varchar(20),
	CPF varchar(11)
	)
GO

CREATE TABLE Endereco(
	
	id int primary key identity,
	Rua varchar(50),
	Numero int,
	Complemento varchar(20),
	Bairro varchar (20),
	Cidade varchar(50),
	UF char (2),
	EnderecoID int not null
	)
GO

CREATE TABLE Veiculo(
	
	id int primary key identity,
	Cor varchar(50),
	Marca varchar(40),
	Modelo varchar(40),
	AnoFabricacao int,
	Placa varchar(20),
	VeiculoID int not null
	)
GO

CREATE TABLE Estacionar(

	id int primary key identity,
	HorarioEntrada varchar(20),
	HorarioSaida varchar(20),
	ClienteEstacionarID int not null,
	VeiculoEstacionarID int not null,
	)
GO

--Inserindo a Chave Estrangeira "Cliente(id)" na Tabela "Endereco"
alter table Endereco ADD FOREIGN KEY (EnderecoID) REFERENCES Cliente(id)

--Inserindo a Chave Estrangeira "Cliente(id)" na Tabela "Veiculo"
alter table Veiculo ADD FOREIGN KEY (VeiculoID) REFERENCES Cliente(id)

--Inserindo a Chave Estrangeira "Cliente(Codigo)" na Tabela "Estacionar"
alter table Estacionar ADD FOREIGN KEY (ClienteEstacionarID) REFERENCES Cliente(id)

--Inserindo a Chave Estrangeira "Cliente(Codigo)" na Tabela "Estacionar"
alter table Estacionar ADD FOREIGN KEY (VeiculoEstacionarID) REFERENCES Cliente(id)

--inserção dados Clientes
insert into Cliente (PrimeiroNome, SegundoNome, UltimoNome, DataNasc, RG, CPF)
values
('Rodrigo', 'Fiad', 'Pasini', '11/02/1985', '12345678', '11122233345'),
('João', 'Zuquetto', 'Colares', '12/01/2001', '87654321', '55544433321'),
('Cesar', 'Augusto', 'Pinheiros', '29/05/1998', '32198754', '33311122276'),
('Carlos', 'Cesar', 'Lemem', '17/07/1978', '0023489223', '22255577798'),
('Marlus', 'Eduardo', 'Fernandes', '06/10/1982', '78640241', '88899977732'),
('Joaquim', 'Rodrigues', 'Silvestre', '07/12/1955', '95043456', '11699514908')
GO

--inserção dados Endereco
insert into Endereco (Rua, Numero, Complemento, Bairro, Cidade, UF, EnderecoID)
values
('Av. Sete de Setembro', '223', 'Apto 11', 'Centro', 'Curitiba', 'PR', 1),
('Rua 29 de Março', '1987', 'Apto 302', 'Jardim Social', 'São Paulo', 'SP', 2),
('Padre Agostinho', '331', 'Apto 30', 'Champagnat', 'Curitiba', 'PR', 3),
('Av. Atlântida', '854', 'Casa 02', 'Centro', 'Balneário Camboriu', 'SC', 4),
('Av. Beira Mar', '500', 'Apto 45-C', 'Copacabana', 'Rio de Janeiro', 'RJ', 5)
GO

-- inserção dados Veiculos
insert into Veiculo (Cor, Marca, Modelo, AnoFabricacao, Placa, VeiculoID)
values
('Prata', 'Renault', 'Duster', '2012', 'AAA-1111', 1),
('Preto', 'Chevrolet', 'Ônix', '2014', 'BBB-2222', 2),
('Vermelho', 'Ford', 'Fiesta', '2006', 'CCC-3333', 3),
('Branca', 'Fiat', '500', '2012', 'DDD-4444', 4),
('Bege', 'Honda', 'Civic', '2008', 'EEE-555', 5),
('Prata', 'Honda', 'Fit', '2017', 'EXE-755', 6)
GO

--inserção dados Estacionar
insert into Estacionar (HorarioEntrada, HorarioSaida, ClienteEstacionarID, VeiculoEstacionarID)
values
('06/10/2020 11:15', '06/10/2020 17:10', 1, 1),
('05/10/2020 09:11', '05/10/2020 18:00', 2, 2),
('05/10/2020 10:20', '06/10/2020 11:05', 3, 3),
('06/10/2020 10:54', '06/10/2020 16:12', 4, 4),
('02/10/2020 09:32', '04/10/2020 13:45', 5, 5)
GO

select*from Veiculo
select*from Cliente
select*from Endereco
select*from Estacionar