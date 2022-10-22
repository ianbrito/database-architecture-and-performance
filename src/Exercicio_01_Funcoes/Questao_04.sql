-- 4) Criar uma função chamada getQtdFuncionarios que retorna a quantidade de funcionários que
-- trabalham em uma determinada fazenda cujo nome é passado como parâmetro.

CREATE OR REPLACE FUNCTION getQtdFuncionarios(nome_fazenda varchar)
RETURNS integer AS $$
    SELECT
        count(FF.codigofunc) AS funcionarios
    FROM funcionarios_fazendas FF
        JOIN fazendas FAZ ON FAZ.codigo = FF.codfazenda
    WHERE FAZ.nome = nome_fazenda;
$$ LANGUAGE SQL;

SELECT getQtdFuncionarios(nome) FROM fazendas;