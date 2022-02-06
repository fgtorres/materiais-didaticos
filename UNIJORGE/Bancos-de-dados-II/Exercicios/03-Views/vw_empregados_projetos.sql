CREATE OR REPLACE VIEW vw_empregados_projetos AS 

SELECT 
  empregado.*,
  profissao.nome as profissao,
  alocacao.codproj,
  alocacao.qtdhoras,
  projeto.nome as nome_projeto
FROM 
  public.empregado, 
  public.profissao,
  public.alocacao,
  public.projeto
WHERE 
  alocacao.codemp = empregado.codemp AND
  profissao.codprof = empregado.codprof AND
  projeto.codproj = alocacao.codproj AND
  alocacao.qtdhoras >= 100
ORDER BY
  empregado.nome ASC;
