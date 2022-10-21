-- 2) Crie uma função chamada calcInss que retorne o Valor pago de INSS por um funcionário da fazenda,
-- cujo código deve ser passado como parâmetro à função. A regra é a seguinte: Se o funcionário ganha
-- igual ou menor que 2000, o inss é 10% do salário; se for maior que 2000 o inss é 15% do salário.

-- DROP FUNCTION IF EXISTS calculaINSS;

CREATE OR REPLACE FUNCTION calculaINSS(codigo_funcionario integer) RETURNS FLOAT AS
$$
DECLARE
    _salario FLOAT;
    _inss    FLOAT;
BEGIN
    _salario := (SELECT salario FROM funcionarios F WHERE F.codigo = codigo_funcionario);
    IF _salario <= 2000 THEN
        _inss := _salario * 0.10;
    ELSE
        _inss := _salario * 0.15;
    END IF;
    RETURN _inss;
END;
$$ LANGUAGE plpgsql;

SELECT  calculaINSS(codigo) FROM funcionarios;