CREATE VIEW vw_projeto_custo_total AS

 SELECT empregado.codemp,
    empregado.nome,
    profissao.nome AS profissao,
    (salario.salario_hora * alocacao.qtdhoras) AS salario_total,
    alocacao.qtdhoras,
    projeto.nome AS nome_projeto,

    (SELECT SUM(ssub.salario_hora*asub.qtdhoras) FROM alocacao as asub, empregado as esub, salario as ssub 
	WHERE asub.codproj = projeto.codproj AND
	      asub.codemp = esub.codemp AND
	      esub.codprof = ssub.codprof) as "custo total",

    empresa.nome AS empresa,
    cidade.nome AS cidade,
    estado.nome AS estado
   FROM empregado,
    profissao,
    salario,
    alocacao,
    projeto,
    empresa,
    cidade,
    estado
  WHERE alocacao.codemp = empregado.codemp AND 
	profissao.codprof = empregado.codprof AND 
	salario.codprof = profissao.codprof AND
	projeto.codproj = alocacao.codproj AND 
	empresa.codempresa = projeto.codempresa AND
	cidade.codcid = empresa.codcid AND
	estado.codest = cidade.codest
  ORDER BY empregado.nome;