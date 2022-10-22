DROP FUNCTION IF EXISTS valida_cpf;

CREATE OR REPLACE FUNCTION valida_cpf(cpf text) RETURNS text AS
$$
DECLARE
    soma int = 0;
    i    int;
    j    int = 1;
BEGIN
    cpf = REGEXP_REPLACE(cpf, '[^0-9]+', '', 'g');
    FOR i IN 10..11
        LOOP
            soma := 0;
            j := 1;
            WHILE j < i
                LOOP
                    soma = soma + (substring(cpf, j, 1)::int * ((i + 1) - j));
                    j = j + 1;
                END LOOP;
            soma = ((10 * soma) % 11) % 10;
            IF substring(cpf, j, 1)::int <> soma THEN
                RAISE EXCEPTION 'CPF Inválido %', cpf USING ERRCODE = 'cpf_validation' ;
            END IF;
        END LOOP;
    RETURN cpf;
END;
$$ LANGUAGE plpgsql;

DROP TABLE IF EXISTS pessoas;

CREATE TABLE pessoas
(
    id   SERIAL,
    cpf  VARCHAR(11),
    nome VARCHAR(50)
);

INSERT INTO pessoas(cpf, nome) VALUES (valida_cpf('114.193.640-22'), 'Otávio Silva Fernandes');
INSERT INTO pessoas(cpf, nome) VALUES (valida_cpf('773.018.112-65'), 'Marisa Carvalho Rocha');

SELECT * FROM pessoas;