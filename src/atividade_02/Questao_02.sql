CREATE OR REPLACE FUNCTION validaSenha() RETURNS TRIGGER AS
$$
BEGIN
    IF length(NEW.ds_senha) < 8 THEN
        RAISE EXCEPTION 'senha inválida' USING HINT = 'senha deve conter no mínimo 8 caracteres';
    ELSIF regexp_match(NEW.ds_senha, '[A-Z]{1,}') IS NULL THEN
        RAISE EXCEPTION 'senha inválida' USING HINT = 'senha deve conter no mínimo uma letra maiúscula';
    ELSIF regexp_match(NEW.ds_senha, '[a-z]{1,}') IS NULL THEN
        RAISE EXCEPTION 'senha inválida' USING HINT = 'senha deve conter no mínimo uma letra minúscula';
    ELSIF regexp_match(NEW.ds_senha, '[0-9]{1,}') IS NULL THEN
        RAISE EXCEPTION 'senha inválida' USING HINT = 'senha deve conter no mínimo um número';
    ELSIF regexp_match(NEW.ds_senha, '[$*&@#!_.)(:<>/?]{1,}') IS NULL THEN
        RAISE EXCEPTION 'senha inválida' USING HINT = 'senha deve conter no mínimo um caractere especial';
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_validaSenha ON usuario;

CREATE TRIGGER trg_validaSenha BEFORE INSERT OR UPDATE ON usuario FOR EACH ROW EXECUTE PROCEDURE validaSenha();

-- Teste 01
UPDATE usuario SET ds_senha = 'ufopabcc' WHERE id = 1;

-- Teste 02
UPDATE usuario SET ds_senha = 'UfopaBcc' WHERE id = 1;

-- Teste 03
UPDATE usuario SET ds_senha = 'UfopaBcc2022' WHERE id = 1;

-- Teste 04
UPDATE usuario SET ds_senha = 'UfOP@bcc2022' WHERE id = 1;

SELECT * FROM auditoria;
