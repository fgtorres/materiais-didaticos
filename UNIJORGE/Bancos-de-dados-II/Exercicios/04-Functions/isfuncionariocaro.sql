CREATE OR REPLACE FUNCTION isfuncionariocaro(codigoproj character(2))
RETURNS TEXT AS $$
DECLARE nomeprojeto TEXT;
DECLARE empregado TEXT;
BEGIN

    -- 
    SELECT nome FROM projeto WHERE codproj = $1 INTO nomeprojeto;

    SELECT nome FROM vw_projeto_custo_total
    WHERE 
       nome_projeto LIKE nomeprojeto
    ORDER BY
       salario_total
    DESC LIMIT 1 INTO empregado;

    RETURN empregado;
END;
$$  LANGUAGE plpgsql


SELECT isfuncionariocaro('TK');