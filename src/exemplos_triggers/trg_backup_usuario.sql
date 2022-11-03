SET TIMEZONE = 'America/Sao_Paulo';

CREATE OR REPLACE FUNCTION backup_usuario() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO bk_usuario SELECT OLD.*, NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_backup_usuario AFTER DELETE
    ON usuario FOR EACH ROW EXECUTE PROCEDURE backup_usuario();

DELETE FROM usuario WHERE id = 2;

SELECT * FROM usuario;

SELECT * FROM bk_usuario;

