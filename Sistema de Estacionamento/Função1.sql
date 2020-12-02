CREATE FUNCTION Quantidade_Clientes()
RETURNS INT
AS
BEGIN
DECLARE @Quantidade INT
SELECT @Quantidade = COUNT(PrimeiroNome) FROM Cliente
RETURN @Quantidade
END;

SELECT dbo.Quantidade_Clientes() AS 'Quantidade de Clientes cadastrados'