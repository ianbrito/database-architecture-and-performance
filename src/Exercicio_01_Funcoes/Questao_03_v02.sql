-- 3) Criar uma função denominada totalSalario que retorne o valor total pago de salários aos funcionários
-- que ocupam uma dada função passada por parâmetro. Lembre que na tabela funcionários temos as
-- seguintes funções: Vaqueiro, Cowboy, Capataz.

DROP FUNCTION IF EXISTS totalSalario;

CREATE OR REPLACE FUNCTION totalSalario(funcao_funcionario enum_funcao) RETURNS FLOAT AS
$$
DECLARE
    _soma_salarios FLOAT;
    row RECORD;
BEGIN
    _soma_salarios := 0;
    FOR row IN SELECT salario FROM funcionarios F WHERE F.funcao = funcao_funcionario LOOP
        _soma_salarios := _soma_salarios + row.salario;
    END LOOP ;
    RETURN _soma_salarios;
END;
$$ LANGUAGE plpgsql;

SELECT totalSalario('Capataz') AS salarios;