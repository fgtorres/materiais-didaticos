CREATE OR REPLACE FUNCTION isDataAdmissao(codigoemp INTEGER)
RETURNS TEXT AS $$
DECLARE dataadmissao DATE;
BEGIN

    -- Buscamos a data de admissao no banco de dados
    SELECT c.dtadm FROM contratacao as c 
    WHERE 
       c.codemp = $1 AND 
       DATE_PART('DAY',c.dtadm) = DATE_PART('DAY',CURRENT_DATE) AND
       DATE_PART('MONTH',c.dtadm) = DATE_PART('MONTH',CURRENT_DATE)
       INTO dataadmissao;

    -- Avaliamos se o funcionario faz aniversario de contratacao da empresa
    IF dataadmissao IS NULL THEN
       SELECT c.dtadm FROM contratacao as c  WHERE c.codemp = $1  INTO dataadmissao;
       RETURN CONCAT('O aniversario de admissao é na data ',TO_CHAR(dataadmissao,'DD/MM/YYYY'), '.') as resultado;
    ELSE
       RETURN 'Parabens' as resultado;
    END IF;

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


