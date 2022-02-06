-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION atualiza_profissao_salario()
   RETURNS trigger AS $BODY$
DECLARE
  salariohoras DOUBLE PRECISION;
  varqtdhoras INTEGER;
  novosalario INTEGER;
  maxmes INTEGER;
  maxano INTEGER;
BEGIN

   -- CHECAR SE OCORREU MUDANCA DE PROFISSAO
   IF NEW.codprof <> OLD.codprof THEN

      --GET SALARIO HORAS NEW PROF
      SELECT s.salario_hora FROM salario AS s WHERE s.codprof = NEW.codprof
         INTO salariohoras;

      --GET QUANTIDADE DE HORAS
      SELECT SUM(a.qtdhoras) FROM alocacao AS a WHERE a.codemp = NEW.codemp
         INTO varqtdhoras;
      
      --CALCULAR O NOVO SALARIO
      novosalario = salariohoras * varqtdhoras;

      --ATUALIZANDO NA TABELA FOLHA
      SELECT MAX(mes) FROM folha WHERE codemp = NEW.codemp INTO maxmes;
      SELECT MAX(ano) FROM folha WHERE codemp = NEW.codemp INTO maxano;

      UPDATE folha SET salario = novosalario WHERE
        codemp = NEW.codemp AND
        mes = maxmes AND
        ano = maxano;

   END IF;

   RETURN new;
   
END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;

-- CREATE TRIGGER
CREATE TRIGGER empregado_trigger_bef_upd
BEFORE UPDATE ON empregado
FOR EACH ROW
EXECUTE PROCEDURE atualiza_profissao_salario();
