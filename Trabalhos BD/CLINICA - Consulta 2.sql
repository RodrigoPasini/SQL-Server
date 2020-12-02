--Selecione o Medico correspondente de cada Bebe
SELECT M.Nome as Medico, B.Nome as Bebe FROM Bebe B
INNER JOIN Medico M
ON M.Id = B.IdMedico
