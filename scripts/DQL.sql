--DQL 

USE db_Devconnect;

SELECT * FROM tb_Usuario;

SELECT * FROM tb_Publicacao;

SELECT * FROM tb_Curtida;

SELECT * FROM tb_Comentario;

SELECT * FROM tb_seguidor;


--Exibir todas as publicações com descrição, caminho da imagem e nome do usuário
SELECT 
    tb_Publicacao.descricao,
    tb_Publicacao.imagemUrl,
    tb_Usuario.nomeDeUsuario
FROM tb_Publicacao 
LEFT JOIN tb_Usuario  ON tb_Publicacao .id_usuario = tb_Usuario.id;

--Exibir todos os usuários que não fizeram publicação
SELECT 
    tb_Usuario.nomeDeUsuario
FROM tb_Usuario 
LEFT JOIN tb_Publicacao  ON tb_Usuario.id = tb_Publicacao.id_Usuario
WHERE tb_Publicacao.id IS NULL;

--Exibir todos os usuários que não fizeram reações
SELECT 
  tb_Usuario.nomeDeUsuario
FROM tb_Usuario 
LEFT JOIN tb_Curtida  ON tb_Usuario.id = tb_Curtida.id
WHERE tb_Curtida.id_Publicacao IS NULL;

--Exibir todos os comentários com o nome e o texto de uma respectiva publicação
SELECT 
    tb_Usuario.nomeDeUsuario,
    tb_Comentarios.texto,
    tb_Publicacao.descricao AS Publicacao
FROM tb_Comentarios 
LEFT JOIN tb_Usuario  ON tb_Comentarios.id_Usuario = tb_Usuario.id
RIGHT JOIN tb_Publicacao  ON tb_Comentarios.id_Publicacao = tb_Publicacao.id;

--Exibir todos os nomes dos seguidores (quem segue e quem é seguido)
SELECT 
    seguidor.nomeCompleto AS Nome_Seguidor,
    seguido.nomeCompleto AS Nome_Seguido
FROM tb_Seguidor 
LEFT JOIN tb_Usuario seguidor ON tb_Seguidor.id_Usuario_Seguido = seguidor.id
RIGHT JOIN tb_Usuario seguido ON tb_Seguidor.id_Usuario_Seguido = seguido.id;


--Exiba quando seguidores possui um respectivo usuário
SELECT 
    tb_Usuario.nomeCompleto AS Usuario,
    COUNT(tb_Seguidor.id_Usuario_Seguido) AS Quantidade_Seguidores
FROM tb_Usuario 
LEFT JOIN tb_Seguidor ON tb_Usuario.id = tb_Seguidor.id_Usuario_Seguido
GROUP BY tb_Usuario.nomeCompleto;

--Exibir a quantidade de curtidas de uma respectiva publicação
SELECT 
    tb_Publicacao.descricao AS Publicacao,
    COUNT(tb_Curtida.id_Usuario) AS Quantidade_Curtidas
FROM tb_Curtida 
LEFT JOIN tb_Publicacao  ON tb_Curtida.id_Publicacao = tb_Publicacao.id
GROUP BY tb_Publicacao.descricao;




