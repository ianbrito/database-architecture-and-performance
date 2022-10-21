-- 10) Criar uma função denominada mesAniversario que recebe o código do funcionário e devolve o mês
-- do seu aniversário por extenso.

DROP FUNCTION IF EXISTS mesAniversario;

CREATE OR REPLACE FUNCTION mesAniversario(codigo_funcionario INTEGER) RETURNS text AS
$$
DECLARE
    mes   integer;
    meses text[];
BEGIN
    meses = array ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];
    SELECT extract(month from datanascimento) FROM funcionarios WHERE codigo = codigo_funcionario INTO mes;
    RETURN meses[mes];
END
$$ LANGUAGE plpgsql;

SELECT
    mesAniversario(codigo),
    datanascimento
FROM funcionarios;
