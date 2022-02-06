CREATE OR REPLACE FUNCTION getquantidadeprojetos(codigoempresa INTEGER)
RETURNS INTEGER AS $$
DECLARE quantidade INTEGER;
BEGIN

    -- CALCULAR A CARGA HORARIA TOTAL
    SELECT COUNT(p.codproj) FROM projetos as p WHERE p.codempresa = $1 INTO quantidade; 
    RETURN quantidade;
    
END;
$$  LANGUAGE plpgsql

