--DDL
CREATE DATABASE db_devconnect

USE db_devconnect

 CREATE TABLE tb_usuario(

id_usuario  INT IDENTITY (1, 1) PRIMARY KEY,
nome_completo  NVARCHAR (255)                NOT NULL,
nome_usuario  NVARCHAR (50)    UNIQUE        NOT NULL,
email  NVARCHAR (255)          UNIQUE        NOT NULL,
senha  NVARCHAR (50)                         NOT NULL,
foto_perfil_url  NVARCHAR (255)              NULL,
);

SELECT * FROM tb_usuario

CREATE TABLE tb_publicacao(

id_publicacao  INT IDENTITY(1,1) PRIMARY KEY,
descricao  NVARCHAR(255)    NULL,
imagem_url  NVARCHAR(155)   NULL,
data_publicacao  DATE       NOT NULL,

id_usuario INT FOREIGN KEY REFERENCES tb_usuario(id_usuario),

);

SELECT * FROM tb_publicacao

CREATE TABLE tb_curtida (
    id_curtida INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT FOREIGN KEY REFERENCES tb_usuario(id_usuario),
    id_publicacao INT FOREIGN KEY REFERENCES tb_publicacao(id_publicacao)
);

SELECT * FROM tb_curtida


CREATE TABLE tb_comentario (
    id_comentario INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT FOREIGN KEY REFERENCES tb_usuario(id_usuario),
    id_publicacao INT FOREIGN KEY REFERENCES tb_publicacao(id_publicacao),
    texto NVARCHAR(255) NOT NULL,
    data_comentario DATE NOT NULL,
);

SELECT * FROM tb_comentario

CREATE TABLE tb_seguidor (
id_seguidor INT IDENTITY(1,1) PRIMARY KEY,
id_usario_seguidor  INT  NOT NULL,
id_usuarioseguir  INT    NOT NULL,
);

SELECT * FROM tb_seguidor