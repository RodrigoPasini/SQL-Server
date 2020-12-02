CREATE DATABASE CLINICA
GO

USE CLINICA
GO

CREATE TABLE Bebe (
Id INT PRIMARY KEY NOT NULL IDENTITY,
Nome VARCHAR(150) NULL,
DataNasc DATETIME NULL,
PesoNasc DECIMAL(10,5) NULL,
Altura DECIMAL(10,5) NULL,
IdMedico INTEGER NOT NULL, -- FK
IdMae INTEGER NOT NULL -- FK
)
GO
--INSERINDO DADOS NA TABELA Bebe
INSERT INTO Bebe (Nome, DataNasc, PesoNasc, Altura, IdMedico, IdMae) VALUES
('Breno', '06/11/2019', '3000', '47', 1, 1),
('Sofia', '12/07/2019', '3100', '48', 2, 2),
('Bernardo', '27/04/2019', '3200', '49', 3, 3)
GO


CREATE TABLE Cidade (
Id INT PRIMARY KEY NOT NULL IDENTITY,
IdEstado INT NOT NULL, -- FK
Nome VARCHAR(30)
)
GO
--INSERINDO DADOS NA TABELA Cidade
INSERT INTO Cidade (IdEstado, Nome) VALUES
(1, 'Curitiba'),
(2, 'Florianópolis'),
(3, 'Porto Alegre')
GO


CREATE TABLE Endereco (
Id INT PRIMARY KEY NOT NULL IDENTITY,
IdTipoEndereco INT NOT NULL, -- FK
IdCidade INT NOT NULL, -- FK
Rua VARCHAR(50),
Numero VARCHAR(10),
Bairro VARCHAR(20),
CEP VARCHAR(20)
)
GO
-- INSERINDO DADOS NA TABELA Endereco
INSERT INTO Endereco (IdTipoEndereco, IdCidade, Rua, Numero, Bairro, CEP) VALUES
(1, 1, 'Visconde de Guarapuava', '100', 'Batel', '80.000-000'),
(2, 2, 'Avenida Beira Mar', '200', 'Centro', '88.010-000'),
(3, 3, 'Rua Fernando Osório', '300', 'Aberta dos Morros', '91.720-330')
GO


CREATE TABLE Especialidade (
Id INT PRIMARY KEY NOT NULL IDENTITY,
Nome VARCHAR(45),
Descrição VARCHAR(100)
)
GO
-- INSERINDO DADOS NA TABELA Especialidade
INSERT INTO Especialidade (Nome, Descrição) VALUES
('Oftalmologista', 'Pediatra'),
('Cardiologista', 'Pediatra'),
('Pediatra', 'Pediatra')
GO


CREATE TABLE Estado (
Id INT PRIMARY KEY IDENTITY,
Nome VARCHAR(20) NULL
)
GO
--INSERINDO DADOS TABELA Estado
INSERT INTO Estado (Nome) VALUES
('Paraná'),
('Santa Catarina'),
('Rio Grande do Sul')
GO


CREATE TABLE Mae (
Id INTEGER PRIMARY KEY NOT NULL IDENTITY,
Nome VARCHAR(100) NULL,
DataN DATETIME NULL
)
GO
--INSERINDO DADOS NA TABELA Mae
INSERT INTO Mae (Nome, DataN) VALUES
('Renata', '12/07/1985'),
('Débora', '03/08/1987'),
('Carla', '21/02/1986')
GO


CREATE TABLE Mae_Endereco (
IdMae INTEGER NOT NULL, -- vem de fk
IdEndereco INTEGER NOT NULL, -- vem de fk
PRIMARY KEY CLUSTERED (IdMae, IdEndereco) -- SEM O CLUSTERED TBM FUNCIONA
)
-- ou ALTER TABLE Mae_Endereco
-- ADD CONSTRAINT PK_Mae_Endereco PRIMARY KEY CLUSTERED (IdMae, IdEndereco)
/* se for necessário utilizar esta chave em uma tabela como uma chave estrangeira,
tem que cuidar pq ela é composta, precisa declarar tbmALTER TABLE Historico_Mae
ADD CONSTRAINT FK_Mae FOREIGN KEY NONCLUSTERED (IdMae, IdEndereco)
REFERENCES Mae_Endereco (IdMae, IdEndereco)
*/
GO
--INSERINDO DADOS NA TABELA Mae_Endereco
INSERT INTO Mae_Endereco (IdMae, IdEndereco) VALUES
(1,1),
(2,2),
(3,3)
GO


CREATE TABLE Medico (
Id INT PRIMARY KEY NOT NULL IDENTITY,
IdEspecialidade INT NOT NULL, --fk
Nome VARCHAR(150) NULL
)
GO
-- INSERINDO DADOS NA TABELA Medico
INSERT INTO Medico (IdEspecialidade, Nome) VALUES
(1, 'Ricardo'),
(2, 'Evelin'),
(3, 'Mônica')
GO


CREATE TABLE Telefone (
Id INTEGER PRIMARY KEY NOT NULL IDENTITY,
IdTipoTelefone INTEGER NOT NULL, -- fk
IdMedico INTEGER NOT NULL, --fk
IdMae INTEGER NOT NULL, --fk
Numero VARCHAR(20) NULL
)
GO
--INSERINDO DADOS NA TABELA Telefone
INSERT INTO Telefone (IdTipoTelefone, IdMedico, IdMae, Numero) VALUES
(1, 1, 1, '3333-3333'),
(2, 2, 2, '3322-3322'),
(3, 3, 3, '3232-2222')
GO

CREATE TABLE TipoEndereco (
Id INT NOT NULL IDENTITY,
Nome_Tipo VARCHAR(30) NULL,
Descricao VARCHAR(100) NULL,
PRIMARY KEY(Id) -- posso colocar a chave primaria depois assim
)
GO
--INSERINDO DADOS NA TABELA TipoTelefone
INSERT INTO TipoEndereco (Nome_Tipo, Descricao) VALUES
('Casa', 'Propriedade'),
('Trabalho', 'Propriedade'),
('Casa', 'Alugada')
GO

CREATE TABLE TipoTelefone (
Id INT NOT NULL IDENTITY,
Nome_Tipo VARCHAR(30) NULL,
Descricao VARCHAR(100) NULL,
PRIMARY KEY(Id) -- posso colocar a chave primaria depois assim
)-- Chaves Tabela Bebê --ALTER TABLE Bebe ADD FOREIGN KEY (IdMedico) REFERENCES Medico (Id)
GO
--INSERINDO DADOS NA TABELA TipoTelefone
INSERT INTO TipoTelefone (Nome_Tipo, Descricao) VALUES
('Trabalho', 'Celular'),
('Casa', 'Fixo'),
('Casa', 'Celular')
GO

ALTER TABLE Bebe ADD FOREIGN KEY (IdMae) REFERENCES Mae(Id)
GO

-- Chaves Tabela Cidade --
ALTER TABLE Cidade ADD FOREIGN KEY (IdEstado) REFERENCES Estado(Id)
GO
-- Chaves Tabela Endereco --
ALTER TABLE Endereco ADD FOREIGN KEY (IdTipoEndereco) REFERENCES TipoEndereco(Id)
GO

ALTER TABLE Endereco ADD FOREIGN KEY (IdCidade) REFERENCES Cidade(Id)
GO

-- Chaves Tabela Mae_Endereco --
ALTER TABLE Mae_Endereco ADD FOREIGN KEY (IdMae) REFERENCES Mae (Id)
GO

ALTER TABLE Mae_Endereco ADD FOREIGN KEY (IdEndereco) REFERENCES Endereco (Id)
GO

-- Chaves Tabela Medico --
ALTER TABLE Medico ADD FOREIGN KEY (IdEspecialidade) REFERENCES Especialidade (Id)
GO

-- Chaves Tabela Telefone --
ALTER TABLE Telefone ADD FOREIGN KEY (IdMedico) REFERENCES Medico (Id)
GO

ALTER TABLE Telefone ADD FOREIGN KEY (IdTipoTelefone) REFERENCES TipoTelefone (Id)
GO
--
--selecionar todas as tabelas do banco em questão
-- SELECT * FROM information_schema.tables;select * from Bebe
select * from Cidade
select * from Endereco
select * from Especialidade
select * from Estado
select * from Mae
select * from Mae_Endereco
select * from Medico
select * from Telefone
select * from TipoEndereco
select * from TipoTelefone

ALTER TABLE Telefone ADD FOREIGN KEY (IdMae) REFERENCES Mae (Id)
