CREATE FUNCTION Tempo_Estacionado(@id int)
RETURNS INT
AS
BEGIN
DECLARE @Tempo INT
SELECT @Tempo = DATEDIFF(MINUTE, HorarioEntrada, HorarioSaida)
FROM Estacionar
WHERE id=@id
RETURN @Tempo
END;

SELECT dbo.Tempo_Estacionado(3) AS 'Quantidade de Minutos Estacionados'