use Estacionamento
GO
CREATE PROCEDURE EnderecoCliente
	@Cidade varchar(50),
	@UF char(2)
AS
BEGIN
SELECT * FROM Endereco WHERE Cidade = @Cidade and UF = @UF
END
GO
EXEC EnderecoCliente @Cidade = 'Curitiba', @UF = 'PR';