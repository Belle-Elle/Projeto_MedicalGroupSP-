USE MEDICALGROUP_ISABELLE
GO

SELECT * FROM tipoUsuario
go

SELECT * FROM usuario
go

SELECT * FROM situacao
GO

SELECT *FROM paicente
go

SELECT * FROM especialidade
GO

SELECT * FROM clinica
go

SELECT * FROM medico
go 

SELECT * FROM consulta 
go


--listagem de dados da cunsulta 
SELECT U.nomeUsuario, UM.nomeUsuario, 
descricao,  
CONVERT(VARCHAR(20), dataConsulta, 13) [Data da Consulta], 
statusSituacao  
FROM consulta C
INNER JOIN medico M
ON C.idMedico = M.idMedico
JOIN paciente P
ON C.idPaciente = P.idPaciente
INNER JOIN usuario U
ON M.idMedico = U.idUsuario 
INNER JOIN usuario UM
ON P.idUsuario = UM.idUsuario
JOIN situacao S
ON C.idSituacao = S.idSituacao
go

--mudança na data de nascimento 
SELECT 
dataNasc, CONVERT(VARCHAR(20), 
dataNasc, 101) [Data de nascimento convertida],
telefone, 
CPF, 
RG, 
endereco 
FROM paciente
go

-- quantidade de medicos pra cada especialidade
CREATE FUNCTION qntdMedEsp(@nomeEspecial VARCHAR(100))
RETURNS TABLE
AS
RETURN
(
SELECT @nomeEspecial Especialização, COUNT(idEspecialidade) [Quantidade de médicos] FROM especialidade
WHERE tituloEspecialidade LIKE '%'+ @nomeEspecial + '%'
)
GO

SELECT * FROM qntdMedEsp('Acumpuntura')