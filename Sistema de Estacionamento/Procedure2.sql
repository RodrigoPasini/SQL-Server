use Estacionamento
go
CREATE PROCEDURE PlacaClientesss
	@placa varchar(20),
	@PrimeiroNome  varchar(50)
AS
BEGIN
SELECT * FROM Cliente WHERE PrimeiroNome = @PrimeiroNome
SELECT * FROM Veiculo WHERE placa = @placa
END

select*from Veiculo
Select * from Cliente
EXEC PlacaClientesss @placa =  'AAA-1111', @PrimeiroNome = 'Rodrigo';