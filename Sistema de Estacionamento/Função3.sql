CREATE FUNCTION Quantidade_Estados()
RETURNS INT
AS
BEGIN
DECLARE @QuantidadeEstados INT
SELECT @QuantidadeEstados = COUNT(DISTINCT UF) FROM Endereco -- DISTINCT serve para mostrar resultados distintos
RETURN @QuantidadeEstados
END;

SELECT dbo.Quantidade_Estados() AS 'Quantidade de Estados Cadastrados'
