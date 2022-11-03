ALTER DATABASE usuario SET TIMEZONE = 'America/Sao_Paulo';

DROP TABLE IF EXISTS usuario;

CREATE TABLE usuario
(
    id                 INTEGER NOT NULL PRIMARY KEY,
    nm_login           CHARACTER VARYING,
    ds_senha           CHARACTER VARYING,
    fg_bloqueado       BOOLEAN,
    nu_tentativa_login INTEGER
);

DROP TABLE IF EXISTS bk_usuario;

CREATE TABLE bk_usuario
(
    id                 INTEGER NOT NULL,
    nm_login           CHARACTER VARYING,
    ds_senha           CHARACTER VARYING,
    fg_bloqueado       BOOLEAN,
    nu_tentativa_login INTEGER,
    data_exclusao      TIMESTAMP,
    CONSTRAINT pk_bkp_usuario PRIMARY KEY (id)
);

DROP TABLE IF EXISTS auditoria;

CREATE TABLE auditoria
(
    id                 INTEGER NOT NULL,
    data_alteracao     TIMESTAMP,
    operacao_realizada CHARACTER VARYING
);
