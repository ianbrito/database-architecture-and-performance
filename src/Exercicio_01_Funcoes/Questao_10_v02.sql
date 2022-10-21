-- 10) Criar uma função denominada mesAniversario que recebe o código do funcionário e devolve o mês
-- do seu aniversário por extenso.

DROP FUNCTION IF EXISTS mesAniversario;

CREATE OR REPLACE FUNCTION mesAniversario(codigo_funcionario INTEGER) RETURNS text AS
$$
DECLARE
    nascimento date;
BEGIN
    SELECT datanascimento FROM funcionarios WHERE codigo = codigo_funcionario INTO nascimento;
    RETURN to_char(nascimento, 'Month');
END
$$ LANGUAGE plpgsql;

SELECT
    mesAniversario(codigo),
    datanascimento
FROM funcionarios;