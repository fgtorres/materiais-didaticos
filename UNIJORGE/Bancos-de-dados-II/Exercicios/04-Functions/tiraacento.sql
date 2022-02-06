CREATE OR REPLACE FUNCTION tiraacento(texto TEXT)
RETURNS TEXT AS $$
DECLARE resultado TEXT;
BEGIN

	-- Retirando os acentos do texto e deixando ele UPPER
        SELECT  UPPER($1) INTO resultado;
        SELECT  REPLACE(resultado, 'Ã', 'A') INTO resultado;
        SELECT  REPLACE(resultado, 'É', 'E') INTO resultado;
        SELECT  REPLACE(resultado, 'Ó', 'O') INTO resultado;
        SELECT  REPLACE(resultado, 'Õ', 'O') INTO resultado;
        SELECT  REPLACE(resultado, 'Ç', 'C') INTO resultado;
        SELECT  REPLACE(resultado, 'Á', 'A') INTO resultado;
        SELECT  REPLACE(resultado, 'À', 'A') INTO resultado;
        SELECT  REPLACE(resultado, 'Ú', 'U') INTO resultado;

        RETURN resultado;

END;
$$  LANGUAGE plpgsql




