CREATE OR REPLACE FUNCTION auditoria() RETURNS TRIGGER AS
$$
DECLARE
    codigo             INTEGER;
    operacao_realizada TEXT;
BEGIN
    CASE tg_op
        WHEN 'INSERT' THEN
            codigo := NEW.id;
            operacao_realizada := 'Operação ' || tg_op || '. A linha de código ' || NEW.id || ' foi inserida';
        WHEN 'UPDATE' THEN
                codigo := NEW.id;
                operacao_realizada := 'Operação ' || tg_op || '. A linha de código ' || NEW.id || ' foi alterada';
        WHEN 'DELETE' THEN
            codigo := OLD.id;
            operacao_realizada := 'Operação ' || tg_op || '. A linha de código ' || OLD.id || ' foi excluída';
        END CASE;
    
    INSERT INTO auditoria(id, data_alteracao, operacao_realizada) VALUES (codigo, NOW(), operacao_realizada);

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_auditoria AFTER INSERT OR UPDATE OR DELETE ON usuario FOR EACH ROW EXECUTE PROCEDURE auditoria();

-- Testes

INSERT INTO usuario
VALUES (1, 'hallan', 'hallan2011', false, 0),
       (2, 'maria', 'abc1234', false, 2),
       (3, 'joao', '123456', false, 0);

UPDATE usuario SET fg_bloqueado = true WHERE id = 2;

DELETE FROM usuario;
