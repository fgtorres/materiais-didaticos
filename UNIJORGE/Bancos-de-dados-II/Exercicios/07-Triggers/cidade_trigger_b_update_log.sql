--TRIGGER
CREATE TRIGGER cidade_trigger_bef_upd
BEFORE UPDATE ON cidade
FOR EACH ROW
EXECUTE PROCEDURE cidade_log_func_upd();

--FUNCTION TRIGGER
CREATE OR REPLACE FUNCTION cidade_log_func_upd()
   RETURNS trigger AS $BODY$
BEGIN

   INSERT INTO log (codlog, data_hora, operacao, tabela,
   valor) VALUES ( nextval('seq_log'), CURRENT_TIMESTAMP,'U','CIDADE',
   CONCAT(
	'ANTIGO{codcid: ',OLD.codcid,';nome: ',OLD.nome,';codest:',OLD.codest,'}',
	'NOVO{codcid: ',NEW.codcid,';nome: ',NEW.nome,';codest:',NEW.codest,'}'));

   RETURN new;
   
END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;