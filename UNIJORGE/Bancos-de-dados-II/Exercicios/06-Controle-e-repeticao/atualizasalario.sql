CREATE OR REPLACE FUNCTION atualizasalario(codemp INT, piso INT, percentual INT)
RETURNS INT AS $$
DECLARE percentualparcial INT;
DECLARE salarioparcial INT;
BEGIN

    --Lendo o salario total do empregado.
    SELECT salario_total FROM vw_projeto_custo_total vw WHERE vw.codemp = $1 INTO salarioparcial;

    --Inicializando o percentual parcial com o percentual inicial
    percentualparcial = $3;
    RAISE NOTICE 'Percentual parcial: %', percentualparcial;
    RAISE NOTICE 'Salario parcial R$%', salarioparcial;	

    --Projetando o aumento salarial de ajuste do piso.
    WHILE ((salarioparcial * ((100 + percentualparcial)/100))< piso) LOOP
	--Incrementar em 10 o percentual parcial
	percentualparcial = percentualparcial + 10;
    END LOOP;

    --Retornar o percentual de aumento necessário para adequação ao piso.
    RETURN percentualparcial;

END;
$$  LANGUAGE plpgsql
