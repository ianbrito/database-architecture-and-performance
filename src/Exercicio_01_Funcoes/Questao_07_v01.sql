-- 7) Criar uma função denominada numVogais que recebe o código de um funcionário e devolve o
-- número de vogais contidas no seu nome.

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
