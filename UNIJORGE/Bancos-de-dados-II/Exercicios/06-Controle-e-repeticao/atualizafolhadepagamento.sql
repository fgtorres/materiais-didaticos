CREATE OR REPLACE FUNCTION atualizafolhadepagamento()
RETURNS INT AS $$
DECLARE x RECORD;
BEGIN


   FOR x IN SELECT codemp,SUM(salario_total) as salario_total FROM vw_projeto_custo_total GROUP BY codemp
   LOOP

	--Limpando dados do funcionario na tabela folha
	DELETE FROM folha WHERE codemp = x.codemp AND mes =  DATE_PART('MONTH',CURRENT_DATE)
	AND  ano = DATE_PART('YEAR',CURRENT_DATE);

	--Inserindo salario pro mês atual
	INSERT INTO folha (codemp, mes, ano, salario) VALUES
	( x.codemp, DATE_PART('MONTH',CURRENT_DATE), DATE_PART('YEAR',CURRENT_DATE),
	x.salario_total);

	--Mensagem de informe do salario
	RAISE NOTICE '[%/% - %] R$%', DATE_PART('MONTH',CURRENT_DATE),
	DATE_PART('YEAR',CURRENT_DATE), x.codemp, x.salario_total;

   END LOOP;

   RETURN 1;
END;
$$  LANGUAGE plpgsql

SELECT atualizafolhadepagamento();

-- CRIACAO DA TABELA FOLHA
--CREATE TABLE folha
--(
--  codemp integer NOT NULL,
--  mes integer NOT NULL,
--  ano integer NOT NULL,
--  salario integer NOT NULL,
--  CONSTRAINT folha_pkey PRIMARY KEY (codemp,mes,ano)
--)
