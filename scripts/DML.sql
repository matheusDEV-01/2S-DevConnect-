--DML

USE  db_Devconnect;

INSERT INTO tb_Usuario (nomeCompleto, nomeDeUsuario, email, senha)
VALUES 
('TTI', 'TTI01', 'TTI0212@gmail.com', '1937');

INSERT INTO tb_Usuario (nomeCompleto, nomeDeUsuario, email, senha, fotoPerfilUrl)
VALUES 
('Matheus', 'opalaale', 'alexia@email.com', 'senai@134', NULL);

INSERT INTO tb_Publicacao (descricao, imagemUrl, data_publicacao, id_usuario)
VALUES 
('Dexterz', 'https://foto.Aleatoria', '2025-12-30', 1);

INSERT INTO tb_Curtida (id_Usuario, id_Publicacao)
VALUES 
(1, 8);

INSERT INTO tb_Comentarios (texto, dataComentario, id_Publicacao, id_Usuario)
VALUES 
('Nao gosto dessa serie ', '2025-10-02', 8, 3);

INSERT INTO tb_Seguidor (id_Usuario_Seguir, id_Usuario_Seguido)
VALUES 
(1, 2);

    SELECT * FROM tb_Usuario;
	SELECT * FROM tb_Publicacao;
	SELECT * FROM tb_Curtida;
	SELECT * FROM tb_Comentarios;
	SELECT * FROM tb_Seguidor;