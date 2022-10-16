-- 5) Criar uma função chamada getResponsavel que recebe o nome de uma fazenda e retorne o nome do
-- seu responsável.

DROP FUNCTION IF EXISTS getResponsavel;

CREATE OR REPLACE FUNCTION getResponsavel(nome_fazenda varchar)
RETURNS varchar AS $$
    SELECT
        F.nome
    FROM funcionarios F
        JOIN fazendas FAZ ON F.codigo = FAZ.codfuncresp
    WHERE FAZ.nome = nome_fazenda;
$$ LANGUAGE SQL;

SELECT getResponsavel('Tapajoara');
