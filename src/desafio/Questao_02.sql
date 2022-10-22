CREATE OR REPLACE FUNCTION getNome(nome text) RETURNS text AS
$$
DECLARE
    parts text[];
    length int;
BEGIN
    parts := regexp_split_to_array(nome, '\s');
    length := array_length(parts, 1);

    IF upper(parts[length-1]) IN ('DE', 'DA') THEN
        RETURN concat(parts[1], ' ', parts[length-1], ' ',parts[length]);
    END IF;

    RETURN concat(parts[1], ' ', parts[length]);
END;
$$ LANGUAGE plpgsql;

SELECT getNome(nome) FROM pessoas;

SELECT getNome('Ian de Brito de Azevedo');