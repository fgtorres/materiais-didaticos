CREATE VIEW vw_dados_profissionais AS

SELECT 
   e.nome as "nome_completo",
   prof.nome as "profissao",
   emp.nome as "empresa",
   c.nome as "cidade",
   est.nome as "estado"
FROM 
   empregado e,
   alocacao a,
   profissao prof,
   projeto p,
   empresa emp,
   cidade c,
   estado est
WHERE 
   e.codemp = a.codemp AND
   e.codprof = prof.codprof AND
   a.codproj = p.codproj AND
   emp.codempresa = p.codempresa AND
   c.codcid = emp.codcid AND
   est.codest = c.codest;
   
   
