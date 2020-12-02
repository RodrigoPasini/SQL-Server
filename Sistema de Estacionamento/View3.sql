CREATE VIEW vwVeiculoClienteHorario AS
SELECT V.Marca, V.Modelo, Es.HorarioSaida
FROM Veiculo V
INNER JOIN Estacionar Es
ON V.id=Es.VeiculoEstacionarID

SELECT*FROM vwVeiculoClienteHorario