-- 9) Criar uma função denominada signo que recebe o código de um funcionário e devolve o signo dele
-- com base na sua data de nascimento.

CREATE OR REPLACE FUNCTION getFuncionarioSigno(codigo_funcionario INTEGER) RETURNS TEXT AS
$$
DECLARE
    data_nascimento text;
BEGIN
    data_nascimento := (SELECT to_char(datanascimento, 'mm-dd') FROM funcionarios WHERE codigo = codigo_funcionario);
    CASE
        WHEN data_nascimento BETWEEN '03-21' AND '04-20'
            THEN RETURN 'Áries';
        WHEN data_nascimento BETWEEN '04-21' AND '05-20'
            THEN RETURN 'Touro';
        WHEN data_nascimento BETWEEN '05-21' AND '06-20'
            THEN RETURN 'Gêmeos';
        WHEN data_nascimento BETWEEN '06-21' AND '07-22'
            THEN RETURN 'Câncer';
        WHEN data_nascimento BETWEEN '07-23' AND '08-22'
            THEN RETURN 'Leão';
        WHEN data_nascimento BETWEEN '08-23' AND '09-22'
            THEN RETURN 'Virgem';
        WHEN data_nascimento BETWEEN '07-23' AND '10-22'
            THEN RETURN 'Libra';
        WHEN data_nascimento BETWEEN '10-23' AND '11-21'
            THEN RETURN 'Escorpião';
        WHEN data_nascimento BETWEEN '11-22' AND '12-21'
            THEN RETURN 'Sagitário';
        WHEN data_nascimento BETWEEN '12-22' AND '12-31'
            THEN RETURN 'Capricórnio';
        WHEN data_nascimento BETWEEN '01-01' AND '01-20'
            THEN RETURN 'Capricórnio';
        WHEN data_nascimento BETWEEN '01-21' AND '02-19'
            THEN RETURN 'Aquário';
        WHEN data_nascimento BETWEEN '02-19' AND '03-20'
            THEN RETURN 'Peixes';
        ELSE RETURN NULL;
        END CASE;
END;
$$ LANGUAGE plpgsql;

SELECT
    datanascimento,
    getFuncionarioSigno(codigo)
FROM funcionarios;