-- 3) Criar uma função denominada totalSalario que retorne o valor total pago de salários aos funcionários
-- que ocupam uma dada função passada por parâmetro. Lembre que na tabela funcionários temos as
-- seguintes funções: Vaqueiro, Cowboy, Capataz.

DROP FUNCTION IF EXISTS totalSalario;

CREATE OR REPLACE FUNCTION totalSalario(funcao_funcionario enum_funcao)
RETURNS float AS $$
    SELECT sum(F.salario) AS salarios FROM funcionarios F
    WHERE F.funcao = funcao_funcionario;
$$ LANGUAGE SQL;

SELECT totalSalario('Capataz') AS salarios;