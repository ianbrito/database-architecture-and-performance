-- 4) Criar uma função chamada getQtdFuncionarios que retorna a quantidade de funcionários que
-- trabalham em uma determinada fazenda cujo nome é passado como parâmetro.

CREATE OR REPLACE FUNCTION getQtdFuncionarios(nome_fazenda varchar)
RETURNS integer AS $$
    SELECT
        count(FUN.codigo) AS funcionarios
    FROM funcionarios_fazendas FF
        JOIN fazendas FAZ ON FAZ.codigo = FF.codfazenda
        JOIN funcionarios FUN ON FUN.codigo = FF.codigofunc
    WHERE FAZ.nome = nome_fazenda;
$$ LANGUAGE SQL;

SELECT getQtdFuncionarios('Tapajoara');

SELECT
    count(FUN.codigo) AS funcionarios
FROM funcionarios_fazendas FF
    JOIN fazendas FAZ ON FAZ.codigo = FF.codfazenda
    JOIN funcionarios FUN ON FUN.codigo = FF.codigofunc
WHERE FAZ.nome = 'Tapajoara';