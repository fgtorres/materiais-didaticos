--TRIGGER
CREATE TRIGGER cidade_trigger_bef_del
BEFORE DELETE ON cidade
FOR EACH ROW
EXECUTE PROCEDURE cidade_log_func_del();

--FUNCTION TRIGGER
CREATE OR REPLACE FUNCTION cidade_log_func_del()
   RETURNS trigger AS $BODY$
BEGIN

   INSERT INTO log (codlog, data_hora, operacao, tabela,
   valor) VALUES ( nextval('seq_log'), CURRENT_TIMESTAMP,'D','CIDADE',
   CONCAT(
	'ANTIGO{codcid: ',OLD.codcid,';nome: ',OLD.nome,';codest:',OLD.codest,'}'));

   RETURN new;
   
END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;