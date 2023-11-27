#Explicação INSERT
INSERT INTO sala_de_aula (
id_sala_aula,
qt_alunos,
nm_professor,
ds_periodo
#Adiciono os valores das colunas/atributos
) VALUES (
 1, 20, 'Maju', 'N' 
 );
 
 INSERT INTO sala_de_aula (
id_sala_aula,
qt_alunos,
nm_professor,
ds_periodo
#Adiciono os valores das colunas/atributos
) VALUES (
 2, 45, 'Henrique', 'V' 
 );
 
 INSERT INTO sala_de_aula (
id_sala_aula,
qt_alunos,
nm_professor,
ds_periodo
#Adiciono os valores das colunas/atributos
) VALUES (
 3, 23, 'Dalton', 'M' 
 );
 
UPDATE sala_de_aula SET qt_alunos = 60 
WHERE id_sala_aula = 1
OR id_sala_aula = 1;

UPDATE sala_de_aula SET qt_alunos = 50 
WHERE id_sala_aula = 1
AND nm_professor = 'Henrique';


 #deletou todas as informações da minha tabela "sala_de_aula"
 DELETE FROM sala_de_aula;
 
 #Exercício 01
 #Alterando o valor da coluna "ds_categoria" para que comporte mais caracteres 
    ALTER TABLE categoria MODIFY ds_categoria VARCHAR(300);

#inserindo os valores dos atributos 
 INSERT INTO categoria (
 id,
 nm_categoria,
 ds_categoria
 ) VALUES ( 1, categoria,'Eletronicos', 'Dispositivos eletrônicos, como smartphones, laptops e tablets');
 
 INSERT INTO categoria (
 id,
 nm_categoria,
 ds_categoria
 ) VALUES ( 2, 'Moda', 'Roupas e acessórios de moda para homens e mulheres');
 
  INSERT INTO categoria (
 id,
 nm_categoria,
 ds_categoria
 ) VALUES ( 3, 'Livros', 'Diversos gêneros de livros, incluindo ficção, não ficção e literatura clássica');
 
 INSERT INTO categoria (
 id,
 nm_categoria,
 ds_categoria
 ) VALUES ( 4, 'Casa e Jardim', 'Produtos para decoração, móveis e itens de jardinagem');
 
  INSERT INTO categoria (
 id,
 nm_categoria,
 ds_categoria
 ) VALUES ( 5, 'Esportes e Outdoor', 'Equipamentos esportivos, roupas esportivas e acessórios para atividades ao ar livre'
 );
 
 INSERT INTO produto (
id,
nm_produto,
qt_estoque,
vl_produto,
cd_categoria 
) VALUES ( 1, 'Smartphone XYZ', 50, 899.99, 1
);

#UPDATE
#Suponha que o preço do "Smartphone XYZ" foi reduzido para 799.99. Atualize o valor na tabela de produtos.
 UPDATE produto SET vl_produto = 799.99
 WHERE id = 1;
 
  INSERT INTO produto (
id,
nm_produto,
qt_estoque,
vl_produto,
cd_categoria 
) VALUES ( 2, 'Camiseta Casual', 100, 29.99, 2
);

#DELETE
#Remova da tabela de produtos todos os produtos que têm uma quantidade em estoque inferior a 15 unidades.
 DELETE FROM produto
 WHERE qt_estoque < 15;

#UPDATE com SET
#Suponha que a descrição da categoria "Moda" foi atualizada para
 #"Roupas e acessórios de moda para homens, mulheres e crianças". 
 #Utilize o comando SET para fazer essa atualização na tabela de categorias.
 UPDATE categoria SET ds_categoria = 'Roupas e acessórios de moda para homens, mulheres e crianças'
 WHERE id = 2;
 
  INSERT INTO produto (
id,
nm_produto,
qt_estoque,
vl_produto,
cd_categoria 
) VALUES ( 3, 'Aventuras Fantásticas', 30, 15.50, 3
);

 INSERT INTO produto (
id,
nm_produto,
qt_estoque,
vl_produto,
cd_categoria 
) VALUES ( 4, 'Conjunto de Sofá Moderno', 10, 799.99, 4
);

INSERT INTO produto (
id,
nm_produto,
qt_estoque,
vl_produto,
cd_categoria 
) VALUES ( 5, 'Bicicleta de Montanha', 20, 349.99, 5
);

#Explicação UPDATE
#Seleciona a tabela e a coluna 

#Mudei o nome do professor que dá aula no período noturno, de "Maju" para "Henrique"
UPDATE sala_de_aula SET nm_professor = 'Henrique'
WHERE id_sala_aula = 1;

#Mudei o nome do professor que dá aula no período vespertino, de "Henrique" para "Maju"produto
UPDATE sala_de_aula SET nm_professor = 'Maju'
WHERE id_sala_aula = 2;

INSERT INTO endereco (id, ds_municipio, ds_bairro) VALUES 
(1, 'Cidade A', 'Centro'),
(2, 'Cidade B', 'Novo Bairro'),
(3,'Cidade A', 'Subúrdio');

INSERT INTO cliente (id, nm_cliente, ds_cpf, bl_cooperado, dt_nascimento, cd_endereco) VALUES 
(1, 'João Silva', '12345678901', TRUE, '1985-03-10', 1),
(2, 'Maria Oliveira', '98765432101', FALSE, '1992-07-22', 2),
(3, 'Carlos Santos', '45678901234', TRUE, '1978-11-05',3),
(4, 'Ana Rocha', '87654321098', FALSE, '1989-05-15', 2),
(5, 'Paula Souza', '23456789012',TRUE, '1995-09-30', 1);

#A) Suponha que o cliente com id 1 mudou de endereço
# e agora mora em um novo bairro chamado "Novo Bairro".
# Atualize o endereço na tabela de clientes.
UPDATE cliente SET cd_endereco = 2
WHERE id = 1; 

#B) Remova da tabela de clientes todos os clientes que não são cooperados.
DELETE FROM cliente 
WHERE bl_cooperado = FALSE;

#C) Adicione um novo cliente chamado "Maria Silva" à tabela de clientes. 
#Maria não é cooperada
#nasceu em '1990-05-15'
# possui CPF '12345678901' 
#mora em um bairro chamado "Centro" no município de "Cidade A".

INSERT INTO cliente (id, nm_cliente, ds_cpf, bl_cooperado, dt_nascimento, cd_endereco) VALUE
(6, 'Maria Silva', '12345678901', FALSE, '1990-05-15', 1);