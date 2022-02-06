CREATE OR REPLACE FUNCTION testefor()
RETURNS INT AS $$
DECLARE x RECORD;
DECLARE i INT;
BEGIN


   RAISE NOTICE 'Utilizacao do FOR 1';
   FOR i IN  1..10 LOOP
	RAISE NOTICE 'I é igual a %.', i;
   END LOOP;


   RAISE NOTICE 'Utilizacao do FOR 2';
   FOR i IN 1..10 BY 1 LOOP
	RAISE NOTICE 'I é igual a %.', i;
   END LOOP;


   RAISE NOTICE 'Utilizacao do FOR 3';
   FOR i IN REVERSE 10..1 BY 2 LOOP
	RAISE NOTICE 'I é igual a %.', i;
   END LOOP;

	
   RAISE NOTICE 'Utilizacao do FOR 4';
   FOR x IN SELECT codemp,nome,salario_total FROM vw_projeto_custo_total 
   LOOP
	
	RAISE NOTICE '[%]% - R$%', x.codemp, x.nome, x.salario_total;

   END LOOP;

   RAISE NOTICE 'Utilizacao do FOR 5';
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

SELECT testefor();

-- CRIACAO DA TABELA FOLHA
--CREATE TABLE folha
--(
--  codemp integer NOT NULL,
--  mes integer NOT NULL,
--  ano integer NOT NULL,
--  salario integer NOT NULL,
--  CONSTRAINT folha_pkey PRIMARY KEY (codemp,mes,ano)
--)
