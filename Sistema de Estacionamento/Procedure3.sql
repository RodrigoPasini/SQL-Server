use Estacionamento
GO
CREATE PROCEDURE Excluirr
	@id int
AS
BEGIN
DELETE FROM Estacionar WHERE @id = @id
DELETE FROM Veiculo WHERE @id = @id
DELETE FROM Endereco WHERE @id = @id
DELETE FROM Cliente WHERE id = @id
END

Select * from Cliente

EXEC Excluirr 1;