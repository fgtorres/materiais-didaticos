CREATE OR REPLACE FUNCTION getprofissao(codigoempregado INT)
RETURNS TEXT AS $$
DECLARE resultado TEXT;
BEGIN

    -- Buscando a descricao da profissao do codemp
    SELECT p.nome FROM empregado AS e JOIN profissao AS p ON (e.codprof=p.codprof) WHERE e.codemp = codigoempregado INTO resultado;

    RETURN resultado;

END;
$$  LANGUAGE plpgsql


