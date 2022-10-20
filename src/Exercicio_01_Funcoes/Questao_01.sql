-- 1) Criar uma Função chamada getfuncionario que recebe o código de um funcionário e retorna
-- todos os seus dados. Dica: a função retorna um SETOF.

CREATE OR REPLACE FUNCTION getFuncionario(codigo_funcionario integer) RETURNS SETOF funcionarios AS
$$
    SELECT * FROM funcionarios F WHERE F.codigo = codigo_funcionario
$$ LANGUAGE SQL;

SELECT * FROM getFuncionario(3);