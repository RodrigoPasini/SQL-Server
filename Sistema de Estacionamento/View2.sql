CREATE VIEW vwInformacao AS
SELECT C.PrimeiroNome, C.SegundoNome, C.UltimoNome, E.Cidade, E.UF, V.Modelo
FROM Cliente C
INNER JOIN Endereco E
ON C.id=E.EnderecoID
INNER JOIN Veiculo V
ON C.id=V.VeiculoID

SELECT * FROM vwInformacao