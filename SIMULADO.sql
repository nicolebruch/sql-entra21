#1.a) Criação da tabela 
CREATE TABLE livro (
cd_livro INTEGER PRIMARY KEY,
nm_titulo VARCHAR(50),
ano_publicado INTEGER,
vl_livro DECIMAL(8,2),
cd_editora INTEGER REFERENCES editora (cd_editora)
);

CREATE TABLE editora (
cd_editora INTEGER PRIMARY KEY,
nm_editora VARCHAR(50)
);

aulasCREATE TABLE autor (
cd_autor INTEGER PRIMARY KEY,
nm_autor VARCHAR(100),
dt_nascimento DATE
);

CREATE TABLE autor_livro (
cd_autor INTEGER REFERENCES autor (cd_autor),
cd_livro INTEGER REFERENCES livro (cd_livro),
ano_contribuicao INTEGER
);

#b)Inserir dados nas tabelas
INSERT INTO livro (cd_livro, nm_titulo, ano_publicado, vl_livro, cd_editora) VALUES 
(1,'Livro 1',2020,50,1),
(2,'Livro 2',2018,45.5,2),
(3,'Livro 3',2022,60.75,3),
(4,'Livro 4',2010,42.5,2),
(5,'Livro 5', 2015,56.77,3);


INSERT INTO editora (cd_editora, nm_editora) VALUES 
(1,'Editora A'),
(2,'Editora B'),
(3,'Editora C');


INSERT INTO autor (cd_autor, nm_autor, dt_nascimento) VALUES 
(1,'Autor A','1990-01-15'),
(2,'Autor B','1985-07-20'),
(3,'Autor C','1987-03-10'),
(4,'Autor D','1995-10-25'),
(5,'Autor E','1992-06-27');


INSERT INTO autor_livro (cd_livro, cd_autor, ano_contribuicao) VALUES
(1,1,2020),
(1,2,2020),
(2,3,2018),
(3,1,2022),
(3,3,2022),
(4,4,2010),
(5,5,2015);


#⦁	Suponha que você deseja atualizar o preço de todos os livros da Editora B para um novo valor de R$ 55.00. 
UPDATE livro SET vl_livro = 55.00
WHERE cd_editora = 2;

#⦁	Suponha que você deseja excluir o livro com o título 'Livro 4' da tabela livro.
#deletei primeiro na minha tabela de relação, se nao, não consigo deletar na minha tabela livro 
DELETE FROM autor_livro
WHERE cd_livro = (SELECT cd_livro FROM livro WHERE nm_titulo = 'Livro 4');
#agora deletei na minha tabela livro 
DELETE FROM livro
 WHERE nm_titulo = 'Livro 4';

#⦁	Selecione todos os livros publicados após o ano de 2015.
SELECT nm_titulo FROM livro 
WHERE ano_publicado >= '2015-00-00';

#⦁	Apresente a média dos preços, o valor do mais caro e do mais barato dos livros.
#média dos precos dos livros
SELECT AVG(vl_livro) FROM livro;

#valor mais barato
#Criei mais um select no meu WHERE para ele poder me retornar qual é o nome do livro com valor mais barato
SELECT nm_titulo, vl_livro FROM livro
WHERE vl_livro = (SELECT MIN(vl_livro) FROM livro);


#⦁	Calcule o total de livros publicados por cada editora e ordene pelo nome da editora.
SELECT e.nm_editora, COUNT(l.cd_livro) AS total_livros
FROM editora AS e JOIN livro AS l
WHERE e.cd_editora = l.cd_editora  
GROUP BY (e.nm_editora)
ORDER BY (e.nm_editora);


#⦁	Conte quantos autores contribuíram para cada livro.
SELECT l.nm_titulo, COUNT(al.cd_autor) AS total_autores_contribuentes
FROM livro AS l JOIN autor_livro AS al
ON l.cd_livro = al.cd_autor
GROUP BY (l.nm_titulo);


#⦁	Encontre o ano mais antigo e mais recente de publicação entre todos os livros.
SELECT nm_titulo, ano_publicado
FROM livro
WHERE ano_publicado =(SELECT MAX(ano_publicado) FROM livro)
OR ano_publicado = (SELECT MIN(ano_publicado) FROM livro);

#Outra forma
SELECT MIN(ano_publicado) AS ano_mais_antigo,
MAX(ano_publicado) AS ano_mais_recente
FROM livro;

#⦁	Selecione os autores nascidos antes de 1990.
SELECT nm_autor, dt_nascimento
FROM autor
WHERE dt_nascimento < '1990-00-00';


#⦁	Selecione os livros da Editora B.
#Só o nome da editora e do livro
SELECT e.nm_editora, l.nm_titulo
FROM editora AS e JOIN livro AS l
ON e.cd_editora = l.cd_livro
WHERE e.nm_editora = 'Editora B';

#Ou com todas as informações
SELECT *
FROM editora AS e JOIN livro AS l
ON e.cd_editora = l.cd_livro
WHERE e.nm_editora = 'Editora B';

#Outra forma 
SELECT *
FROM livro
WHERE cd_editora = (SELECT cd_editora FROM editora WHERE nm_editora = 'Editora B');

#⦁	Selecione os autores que contribuíram para o livro com o título 'Livro 3'.
SELECT a.*
FROM autor AS a JOIN autor_livro AS al 
ON a.cd_autor = al.cd_autor
JOIN livro AS l
ON l.cd_livro = al.cd_livro
WHERE l.nm_titulo = 'Livro 3';
