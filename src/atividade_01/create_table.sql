DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias
(
    codigo    SMALLSERIAL  NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY (codigo)
);

DROP TABLE IF EXISTS autores_principais;

CREATE TABLE autores_principais
(
    codigo SMALLSERIAL  NOT NULL,
    nome   VARCHAR(100) NOT NULL,
    PRIMARY KEY (codigo)
);

DROP TABLE IF EXISTS livros;

CREATE TABLE livros
(
    codigo        SMALLSERIAL NOT NULL,
    titulo        VARCHAR(100),
    preco_compra  FLOAT,
    volume        INT,
    edicao        INT,
    qtd_paginas   INT,
    situacao      VARCHAR(10),
    cod_categoria smallint,
    cod_autor     smallint,
    PRIMARY KEY (codigo),
    FOREIGN KEY (cod_categoria) REFERENCES categorias (codigo),
    FOREIGN KEY (cod_autor) REFERENCES autores_principais (codigo)
);

DROP TABLE IF EXISTS amigos;

CREATE TABLE amigos
(
    codigo       SMALLSERIAL  NOT NULL,
    nome         VARCHAR(100) NOT NULL,
    logradouro   VARCHAR(100) NOT NULL,
    bairro       VARCHAR(40)  NOT NULL,
    fone_celular VARCHAR(9)   NOT NULL,
    tipo         VARCHAR(20)  NOT NULL,
    PRIMARY KEY (codigo)
);

DROP TABLE IF EXISTS emprestimos;

CREATE TABLE emprestimos
(
    num_emprestimo  SMALLSERIAL NOT NULL,
    data_emprestimo DATE        NOT NULL,
    cod_amigo       SMALLINT    NOT NULL,
    cod_livro       SMALLINT    NOT NULL,
    PRIMARY KEY (num_emprestimo),
    FOREIGN KEY (cod_amigo) REFERENCES amigos (codigo),
    FOREIGN KEY (cod_livro) REFERENCES livros (codigo)
);
