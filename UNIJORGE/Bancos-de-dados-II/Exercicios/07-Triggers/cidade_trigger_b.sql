--TRIGGER
CREATE TRIGGER cidade_trigger_bef_ins
BEFORE INSERT ON cidade
FOR EACH ROW
EXECUTE PROCEDURE cidade_log_func();

--FUNCTION TRIGGER
CREATE OR REPLACE FUNCTION cidade_log_func()
   RETURNS trigger AS $BODY$
BEGIN

   INSERT INTO log (codlog, data_hora, operacao, tabela,
   valor) VALUES ( nextval('seq_log'), CURRENT_TIMESTAMP,'I','CIDADE',
   CONCAT('codcid: ',NEW.codcid,';nome: ',NEW.nome,';codest:',NEW.codest));

   RETURN new;
   
END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;