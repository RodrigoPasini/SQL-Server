--Selecione a mae de cada bebe
SELECT Bebe.Id, Bebe.Nome, Mae.Id, Mae.Nome
FROM Mae
INNER JOIN Bebe
ON Mae.Id = Bebe.IdMae
select*from Mae
select*from Bebe