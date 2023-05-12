use unp_db;
drop table departamento; -- apagado a tabela inteira
-- Criação da Tabela
CREATE TABLE Departamento
(
	CodDepartamento int primary key auto_increment,
    NomeDepartamento varchar(50) collate latin1_general_ci default null
)
engine=MyISAM default charset=latin1 collate=latin1_general_cs;

-- Inserindo registros na tabela departamento
INSERT INTO departamento (NomeDepartamento) values ('Comercial');
INSERT INTO departamento (NomeDepartamento) values ('TI');
INSERT INTO departamento (NomeDepartamento) values ('Marketing');
INSERT INTO departamento (NomeDepartamento) values ('Finanças');

use unp_db;
drop table colaborador; -- apago a tabela de colaborador
CREATE TABLE Colaborador
(
	CodColaborador int primary key auto_increment,
    NomeColaborador varchar(50) collate latin1_general_ci default null,
    CodDepartamento int, foreign key (CodDepartamento) references Departamento(CodDepartamento)
)
engine=MyISAM default charset=latin1 collate=latin1_general_cs;

-- inserindo dados na tabela de colaborador
INSERT INTO Colaborador (NomeColaborador, CodDepartamento) values ('RAFAEL', 1);
INSERT INTO Colaborador (NomeColaborador, CodDepartamento) values ('FRANK', 2);
INSERT INTO Colaborador (NomeColaborador, CodDepartamento) values ('LUCAS', 3);
INSERT INTO Colaborador (NomeColaborador, CodDepartamento) values ('RICARDO', 1);
INSERT INTO Colaborador (NomeColaborador, CodDepartamento) values ('ITALO', 2);
INSERT INTO Colaborador (NomeColaborador, CodDepartamento) values ('ANDREZA', 3);
INSERT INTO Colaborador (NomeColaborador, CodDepartamento) values ('JESSICA', 1);

-- Consulta
SELECT * FROM Departamento;
SELECT * FROM Colaborador;

-- Update (Atualização)
Update Departamento Dep
Set Dep.NomeDepartamento = 'Tecnologia da Informação'
Where Dep.CodDepartamento = 2

-- Delete
Delete From Departamento Where CodDepartamento = 4;

-- Inner Join (Junção de Tabelas)
SELECT 
	Col.NomeColaborador As Colaborador,
    Dep.NomeDepartamento As Departamento,
    Concat(Col.NomeColaborador, Col.Sobrenome) As NomeCompleto
FROM Departamento Dep
INNER JOIN Colaborador Col 
On Col.CodDepartamento = Dep.CodDepartamento
Order By Colaborador Asc;