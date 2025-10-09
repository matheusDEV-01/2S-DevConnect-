--DML

USE  db_Devconnect;

INSERT INTO tb_Usuario (nomeCompleto, nomeDeUsuario, email, senha)
VALUES 
('TTI', 'TTI01', 'TTI0212@gmail.com', '1937');

INSERT INTO tb_Usuario (nomeCompleto, nomeDeUsuario, email, senha)
VALUES 
('Lucas Almeida', 'LukDev', 'lucas.almeida@gmail.com', 'lucas456');

INSERT INTO tb_Usuario (nomeCompleto, nomeDeUsuario, email, senha)
VALUES 
('Julia Santos', 'JuSantos', 'julia.santos@gmail.com', 'senha789');

INSERT INTO tb_Usuario (nomeCompleto, nomeDeUsuario, email, senha)
VALUES 
('Fernanda Costa', 'Fefeh', 'fernanda.costa@gmail.com', 'fefeh321');

INSERT INTO tb_Usuario (nomeCompleto, nomeDeUsuario, email, senha)
VALUES
('Carlos Oliveira', 'Carluxo', 'carlos.oliveira@yahoo.com', 'car123');

INSERT INTO tb_Usuario (nomeCompleto, nomeDeUsuario, email, senha)
VALUES
('Ana Souza', 'AnaCode', 'ana.souza@hotmail.com', 'abc123');

INSERT INTO tb_Usuario (nomeCompleto, nomeDeUsuario, email, senha)
VALUES 
('João Pereira', 'JoaoDev', 'joao.pereira@gmail.com', '12345');

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
(3, 1);

INSERT INTO tb_Seguidor (id_Usuario_Seguir, id_Usuario_Seguido)
VALUES 
(8, 9); 

INSERT INTO tb_Seguidor (id_Usuario_Seguir, id_Usuario_Seguido)
VALUES 
(10, 11); 

INSERT INTO tb_Seguidor (id_Usuario_Seguir, id_Usuario_Seguido)
VALUES 
(12, 13); 

INSERT INTO tb_Seguidor (id_Usuario_Seguir, id_Usuario_Seguido)
VALUES 
(10, 3); 

INSERT INTO tb_Seguidor (id_Usuario_Seguir, id_Usuario_Seguido)
VALUES 
(11, 1);

INSERT INTO tb_Seguidor (id_Usuario_Seguir, id_Usuario_Seguido)
VALUES 
(8, 1);  

    SELECT * FROM tb_Usuario;
	SELECT * FROM tb_Publicacao;
	SELECT * FROM tb_Curtida;
	SELECT * FROM tb_Comentarios;
	SELECT * FROM tb_Seguidor;

	ALTER TABLE tb_curtida
    ADD UNIQUE(id_usuario, id_publicacao)