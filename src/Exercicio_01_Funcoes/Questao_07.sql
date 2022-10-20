-- 7) Criar uma função denominada numVogais que recebe o código de um funcionário e devolve o
-- número de vogais contidas no seu nome.

-- Versão 01
DROP FUNCTION IF EXISTS numVogais;

CREATE OR REPLACE FUNCTION numVogais(codigo_funcionario INTEGER) RETURNS integer AS
$$
DECLARE
    _contador integer;
    i text;
BEGIN
    _contador = 0;
    FOR i IN SELECT REGEXP_MATCHES(lower(nome), '[a,e,i,o,u]', 'g')FROM funcionarios WHERE codigo = codigo_funcionario LOOP
        _contador = _contador  + 1;
    END LOOP;
    RETURN  _contador;
END;
$$ LANGUAGE plpgsql;

SELECT nome, numVogais(codigo) as qtd_vogais FROM funcionarios;

-- Versão 02
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