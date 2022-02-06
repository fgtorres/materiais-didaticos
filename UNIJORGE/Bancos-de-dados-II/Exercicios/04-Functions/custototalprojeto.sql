CREATE OR REPLACE FUNCTION custototalprojeto(projeto TEXT)
RETURNS INTEGER AS $$
DECLARE resultado INTEGER;
BEGIN

    SELECT SUM(salario_hora * qtdhoras) 
    FROM alocacao as a, projeto as p, empregado as e, 
	profissao as prof, salario as s
    WHERE
       a.codproj = p.codproj AND
       a.codemp = e.codemp AND
       e.codprof = prof.codprof AND
       s.codprof = prof.codprof AND
       p.codproj = $1
    GROUP BY
       p.codproj INTO resultado;

    RETURN resultado;
    
END;
$$  LANGUAGE plpgsql


