-- 9) Criar uma função denominada signo que recebe o código de um funcionário e devolve o signo dele
-- com base na sua data de nascimento.

CREATE OR REPLACE FUNCTION getFuncionarioSigno(codigo_funcionario INTEGER) RETURNS TEXT AS
$$
DECLARE
    _data_nascimento DATE;
    ano              INTEGER;
BEGIN
    SELECT datanascimento INTO _data_nascimento FROM funcionarios WHERE codigo = codigo_funcionario;
    ano := EXTRACT(year FROM _data_nascimento);

    CASE
        WHEN _data_nascimento BETWEEN concat(ano, '-', '03-21')::date AND concat(ano, '-', '04-20')::date
            THEN RETURN 'Áries';
        WHEN _data_nascimento BETWEEN concat(ano, '-', '04-21')::date AND concat(ano, '-', '05-20')::date
            THEN RETURN 'Touro';
        WHEN _data_nascimento BETWEEN concat(ano, '-', '05-21')::date AND concat(ano, '-', '06-20')::date
            THEN RETURN 'Gêmeos';
        WHEN _data_nascimento BETWEEN concat(ano, '-', '06-21')::date AND concat(ano, '-', '07-22')::date
            THEN RETURN 'Câncer';
        WHEN _data_nascimento BETWEEN concat(ano, '-', '07-23')::date AND concat(ano, '-', '08-22')::date
            THEN RETURN 'Leão';
        WHEN _data_nascimento BETWEEN concat(ano, '-', '08-23')::date AND concat(ano, '-', '09-22')::date
            THEN RETURN 'Virgem';
        WHEN _data_nascimento BETWEEN concat(ano, '-', '07-23')::date AND concat(ano, '-', '10-22')::date
            THEN RETURN 'Libra';
        WHEN _data_nascimento BETWEEN concat(ano, '-', '10-23')::date AND concat(ano, '-', '11-21')::date
            THEN RETURN 'Escorpião';
        WHEN _data_nascimento BETWEEN concat(ano, '-', '11-22')::date AND concat(ano, '-', '12-21')::date
            THEN RETURN 'Sagitário';
        WHEN _data_nascimento BETWEEN concat(ano, '-', '12-22')::date AND concat(ano, '-', '01-20')::date
            THEN RETURN 'Capricórnio';
        WHEN _data_nascimento BETWEEN concat(ano, '-', '12-22')::date AND concat(ano, '-', '12-31')::date
            THEN RETURN 'Capricórnio';
        WHEN _data_nascimento BETWEEN concat(ano, '-', '01-01')::date AND concat(ano, '-', '02-19')::date
            THEN RETURN 'Aquário';
        WHEN _data_nascimento BETWEEN concat(ano, '-', '02-19')::date AND concat(ano, '-', '03-20')::date
            THEN RETURN 'Peixes';
        ELSE RETURN null;
        END CASE;
END;
$$ LANGUAGE plpgsql;

SELECT getFuncionarioSigno(1);
