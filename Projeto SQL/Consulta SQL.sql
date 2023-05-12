/*
	Coment�rio de Multiplas Linhas
*/

-- Coment�rio de linha �nica

-- Consulta da tabela de correntista com subconsulta
Select
	C.IdCorrentista As ID,
	C.Nome As Cliente,
	C.DataCriacao As DtaCriacao,
	C.SaldoFinanceiro As Saldo
From Correntista C
Where (
		Select Count (*) 
		From Correntista CC 
		Where CC.SaldoFinanceiro = CC.SaldoFinanceiro
		) > 1;

-- Consulta da tabela de movimenta��o
Select
	M.idCorrentista As ID,
	M.idMovimentacao As Movimentacao,
	M.TipoMovimentacao As Tipo,
	M.DataCriacao As DtaCriacao,
	M.Valor As Valor
From Movimentacao M
Where M.Valor > 100;

(Plus)
-- Consulta com Jun��o de Tabelas (Inner Join)
Select * From Correntista C;
Select * From Movimentacao M;

-- Jun��o de Tabelas com Order By
Select Distinct 
	C.Nome As Correntista,
	M.TipoMovimentacao As Tipo
From Correntista C 
Inner Join Movimentacao M On M.idCorrentista = C.IdCorrentista
Where M.TipoMovimentacao = 'C'
Order By C.Nome Desc;