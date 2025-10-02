--DDL

CREATE DATABASE db_Devconnect;


USE db_Devconnect;

CREATE TABLE tb_Usuario(
	id				INT IDENTITY	(1,1) PRIMARY KEY,
	nomeCompleto	NVARCHAR		(255) NOT NULL,
	nomeDeUsuario	NVARCHAR		(20) UNIQUE NOT NULL,
	email			NVARCHAR		(255) UNIQUE NOT NULL,
	senha			NVARCHAR		(50) NOT NULL,
	fotoPerfilUrl	NVARCHAR		(255)
);

CREATE TABLE tb_Publicacao(
	id				INT IDENTITY	(1,1) PRIMARY KEY,
	descricao		NVARCHAR		(500),
	imagemUrl		NVARCHAR		(255) NOT NULL,
	data_Publicacao DATE NOT NULL,
	id_Usuario		INT NOT NULL FOREIGN KEY REFERENCES tb_Usuario(id)
);



CREATE TABLE tb_Curtida(
	id				INT IDENTITY	(1,1) PRIMARY KEY,
	id_Usuario		INT NOT NULL FOREIGN KEY REFERENCES tb_Usuario(id),
	id_Publicacao	INT NOT NULL FOREIGN KEY REFERENCES tb_Publicacao(id)
);


CREATE TABLE tb_Comentarios(
	id				INT IDENTITY	(1,1) PRIMARY KEY,
	texto			NVARCHAR		(300) NOT NULL,
	dataComentario	DATE NOT NULL,
	id_Publicacao	INT NOT NULL FOREIGN KEY REFERENCES tb_Publicacao(id),
	id_Usuario		INT NOT NULL FOREIGN KEY REFERENCES tb_Usuario(id)
);


CREATE TABLE tb_Seguidor(                  
	id_Usuario_Seguir INT NOT NULL,  
	id_Usuario_Seguido INT NOT NULL,  
	PRIMARY KEY (id_Usuario_Seguir, id_Usuario_Seguido)
);


	SELECT * FROM tb_Usuario;
	SELECT * FROM tb_Publicacao;
	SELECT * FROM tb_Curtida;
	SELECT * FROM tb_Comentarios;
	SELECT * FROM tb_Seguidor;

	DROP TABLE tb_Publicacao
	DROP TABLE tb_Curtida;
	DROP TABLE tb_Comentarios