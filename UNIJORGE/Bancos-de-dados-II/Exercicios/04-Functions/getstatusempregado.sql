CREATE OR REPLACE FUNCTION getstatusempregado(codigoemp INTEGER)
RETURNS TEXT AS $$
DECLARE datademissao DATE;
BEGIN

    -- Buscamos a data de demissao no banco de dados
    SELECT c.dtdem FROM empregado as e, contratacao as c 
    WHERE 
       e.codemp = c.codemp AND
       e.codemp = $1 INTO datademissao;

    -- Avaliamos se o funcionario estava ativo ou desligado
    --IF datademissao IS NULL THEN
    --   RETURN 'Ativo';
    --ELSE
    --   RETURN 'Inativo';
    --END IF;

    --------------------------------------------------------
    --IF <condicao> THEN
	--<comando>
    --END IF;

    --------------------------------------------------------
    --IF <condicao> THEN
	--<comando>
    --ELSIF THEN
	--<comando>
    --ELSE
	--<comando>
    --END IF;

END;
$$  LANGUAGE plpgsql

