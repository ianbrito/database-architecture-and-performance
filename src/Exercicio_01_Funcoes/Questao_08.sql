DROP FUNCTION IF EXISTS getPai;

CREATE OR REPLACE FUNCTION getPai(codigo_animal INTEGER) RETURNS TEXT AS
$$
DECLARE
    pai TEXT;
BEGIN

    SELECT
        P.nome INTO pai
    FROM animais F
        JOIN animais P ON F.codpai = P.codigo
    WHERE F.codigo = codigo_animal;

    RETURN pai;
END;
$$ LANGUAGE plpgsql;

SELECT getPai(codigo) FROM funcionarios;