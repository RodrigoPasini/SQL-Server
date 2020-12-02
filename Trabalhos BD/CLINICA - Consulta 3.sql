--Selecione os medicos e suas especialidades
SELECT Especialidade.Nome as Especialidade, Medico.Nome as Medico FROM Medico 
inner join Especialidade
ON Especialidade.Id = Medico.IdEspecialidade