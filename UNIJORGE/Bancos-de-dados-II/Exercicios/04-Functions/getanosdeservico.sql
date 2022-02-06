CREATE OR REPLACE FUNCTION getanosdeservico(codigoemp INTEGER)
RETURNS INTEGER AS $$
DECLARE resultado INTEGER;
BEGIN

    SELECT  (DATE_PART('year', c.dtdem) - DATE_PART('year', c.dtadm)) FROM empregado AS e  JOIN contratacao AS c ON (e.codemp = c.codemp)  WHERE e.codemp = $1 INTO resultado;

    RETURN resultado;

END;
$$  LANGUAGE plpgsql

