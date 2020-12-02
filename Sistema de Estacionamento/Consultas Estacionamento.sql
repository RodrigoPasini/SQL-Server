--TEMA: SISTEMA DE ESTACIONAMENTO

--ALUNOS: RODRIGO FIAD PASINI e JOÃO ZUQUETTO COLARES CERQUEIRA


--Selecione os atributos "Cidade", "Uf" e "idCliente" da tabela "Endereco".

select E.Cidade,E.UF,E.idCliente
from Endereco E

--Selecione  nome e sobrenome ordenado pelo "Ultimonome".
SELECT C.PrimeiroNome, C.UltimoNome
FROM Cliente C
ORDER BY UltimoNome

--Selecione todos os clientes com endereço em Curitiba.

select E.Cidade,E.idCliente
from Endereco E
where Cidade = 'Curitiba'

--Selecione o "PrimeiroNome","RG","Placa","Modelo","UF" e "HorarioEntrada" de todos os clientes.

select C.PrimeiroNome,C.RG,V.Placa,V.Modelo,E.UF,ES.HorarioEntrada
from Cliente C
join Veiculo V
on V.idCliente = C.id
join Endereco E
on E.idCliente = C.id
join Estacionar ES
on ES.idCliente = C.id
ORDER BY C.PrimeiroNome

--Selecione o "PrimeiroNome","RG","Placa","Modelo","UF" e "HorarioSaida" de todos os clientes.

select C.PrimeiroNome,C.RG,V.Placa,V.Modelo,E.UF,ES.HorarioSaida
from Cliente C
join Veiculo V
on V.idCliente = C.id
join Endereco E
on E.idCliente = C.id
join Estacionar ES
on ES.idCliente = C.id
ORDER BY C.PrimeiroNome


--Selecione o nome completo de todos os cliente que tenham o veiculo "Civic".
    
SELECT C. PrimeiroNome, C. SegundoNome, C.UltimoNome, V.Modelo
From Cliente C
JOIN
Veiculo V
ON V.idCliente = C.id
WHERE 'Civic' IN
(SELECT V.Modelo FROM Veiculo V WHERE V.idCliente = C.id)

--Selecione o nome completo de todos os cliente que são de SP.
    
SELECT C. PrimeiroNome, C. SegundoNome, C.UltimoNome, E.UF
From Cliente C
JOIN Endereco E
ON E.idCliente = C.id
WHERE 'SP' IN
(SELECT E.UF FROM Endereco E WHERE E.idCliente = C.id)

--Selecione todos os dados pessoais da tabela "Cliente", filtrando o cliente do estado do PR que tem possue o veiculo duster.

SELECT C.*, E.UF, V.Modelo
From Cliente C
JOIN Endereco E
ON E.idCliente = C.id
JOIN Veiculo V
on V.idCliente = C.id
WHERE 'PR' IN
(SELECT E.UF FROM Endereco E WHERE E.idCliente = C.id) 
AND 'Duster' IN
(SELECT V.Modelo FROM Veiculo V WHERE V.idCliente = C.id)


--Selecione todos os atributos da tabela "Cliente" e número e complemento do "Endereço" filtrando o cliente que não possue endereço cadastrado.

SELECT C.*,E.Numero,E.Complemento
FROM Cliente C
left join Endereco E
on C.id = E.idCliente
Order by C.id

--Selecione todos os atributos da tabela "Veiculo" e HorarioEntrada da "Estacionar" filtrando o veiculo que não possue "HorarioEntrada" cadastrado.
SELECT V.*,ES.HorarioEntrada
FROM Estacionar ES
right join Veiculo V
on V.id = ES.idVeiculo
Order by ES.HorarioEntrada



