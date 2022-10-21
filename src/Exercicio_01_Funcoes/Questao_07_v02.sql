-- 7) Criar uma função denominada numVogais que recebe o código de um funcionário e devolve o
-- número de vogais contidas no seu nome.

DROP FUNCTION IF EXISTS numVogais;

CREATE OR REPLACE FUNCTION numVogais(codigo_funcionario INTEGER) RETURNS integer AS
$$
DECLARE
    regexp text := '[a,e,i,o,u]';
    matches text[];
BEGIN
    matches := array (SELECT REGEXP_MATCHES(lower(nome), regexp, 'g') FROM funcionarios WHERE codigo = codigo_funcionario);
    RETURN  array_length(matches, 1);
END;
$$ LANGUAGE plpgsql;

SELECT nome, numVogais(codigo) as qtd_vogais FROM funcionarios;