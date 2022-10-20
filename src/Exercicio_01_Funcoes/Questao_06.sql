-- 6) Criar uma função chamada getIdadeFuncionario que recebe o código do funcionário e retorna a idade dele.

DROP FUNCTION IF EXISTS getIdadeFuncionario;

CREATE OR REPLACE FUNCTION getIdadeFuncionario(codigo_funcionario INTEGER) RETURNS INTEGER AS
$$
DECLARE
    _data_nascimento DATE;
    _idade INTEGER;
BEGIN
   _data_nascimento := (SELECT datanascimento FROM funcionarios WHERE codigo = codigo_funcionario);
   _idade := EXTRACT(year FROM AGE(_data_nascimento));
   RETURN _idade;
END;
$$ LANGUAGE plpgsql;

SELECT getIdadeFuncionario(1);

-- SELECT EXTRACT(year FROM AGE(datanascimento)) FROM funcionarios WHERE codigo = 1;