USE Estacionamento
GO

CREATE VIEW vwVeiculoEstacionado AS
SELECT C.PrimeiroNome, V.Marca, V.Modelo, Es.HorarioEntrada
FROM Cliente C
INNER JOIN Veiculo V
ON C.id=V.VeiculoID
INNER JOIN Estacionar Es
ON C.id=Es.ClienteEstacionarID

Select*FROM vwVeiculoEstacionado