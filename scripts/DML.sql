--DML
USE db_devconnect;

INSERT INTO tb_usuario (nome_completo, nome_usuario, email, senha, foto_perfil_url) 
VALUES 
('Matheus Felix Coura', 'TTI-098', 'matheus9908@gmail.com', '1234', 'foto_perfil');

SELECT * FROM tb_usuario;

INSERT INTO tb_publicacao (descricao , imagem_url, data_publicacao, id_usuario) 
VALUES 
('descricao', 'imagem', '2025-02-17', 1);

SELECT * FROM tb_publicacao;

INSERT INTO tb_curtida (id_usuario, id_publicacao) 
VALUES 
(1, 1);

SELECT * FROM tb_curtida;

INSERT INTO tb_comentario (id_usuario, id_publicacao, texto, data_comentario)
VALUES 
(1, 1, 'texto', '2025-02-17');

SELECT * FROM tb_comentario;

INSERT INTO tb_seguidor (id_usario_seguidor, id_usuarioseguir) 
VALUES 
(1, 1);

SELECT * FROM tb_seguidor;

