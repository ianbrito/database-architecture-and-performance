-- 2) Crie uma função chamada calcInss que retorne o Valor pago de INSS por um funcionário da fazenda,
-- cujo código deve ser passado como parâmetro à função. A regra é a seguinte: Se o funcionário ganha
-- igual ou menor que 2000, o inss é 10% do salário; se for maior que 2000 o inss é 15% do salário.

CREATE OR REPLACE FUNCTION calculaINSS(codigo_funcionario integer)
RETURNS float AS $$
    SELECT CASE
            WHEN F.salario <= 2000 THEN (F.salario * 0.10)
            WHEN F.salario > 2000 THEN (F.salario * 0.15)
        END AS inss
    FROM funcionarios F
    WHERE F.codigo = codigo_funcionario
$$ LANGUAGE SQL;

SELECT * FROM funcionarios;

SELECT calculaINSS(6);