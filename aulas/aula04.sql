# * --> Representa todos os campos
SELECT * FROM categoria;

#Especificamos as colunas que queremos apresentar pro usuário, tiramos o ID para ser mostrado ao usuário;
SELECT nm_categoria, ds_categoria FROM categoria;

#Selecionei para aparecer todos os atributos da tabela "categoria" e tabela "produto"
SELECT * FROM categoria;
SELECT * FROM produto;

#Listei para aparecer somende o ID da tabela categoria
SELECT id FROM categoria;

#listar apenas o nome e a data de nascimento de todos os clientes
SELECT nm_cliente, dt_nascimento FROM cliente;

#Listar apenas o nome "João Silva" ou "Carlos Santos"
SELECT * FROM cliente
WHERE nm_cliente = 'João Silva' OR 
nm_cliente ='Carlos Santos';

#Exercício de SELEÇÃO

#Listagem de cliente 2 vezes utilizando o nome 
#1) Uma de forma crescente 
SELECT * FROM cliente
ORDER BY nm_cliente ASC;

#2) E outra de forma descrescente 
SELECT * FROM cliente
ORDER BY nm_cliente DESC;

#Listagem de produtos 2 vezes utilizando o valor 
#1) Uma de forma crescente 
SELECT * FROM produto
ORDER BY vl_produto ASC;

#2) E outra de forma descrescente 
SELECT * FROM produto
ORDER BY vl_produto DESC;


#======== TABELA CLIENTE ===========

#1) Selecione todos os clientes cooperados.
SELECT * FROM cliente
WHERE bl_cooperado = TRUE;

#2) Selecione o nome e o CPF dos clientes que nasceram depois de 1990.
SELECT nm_cliente, ds_cpf FROM cliente
WHERE dt_nascimento > '1990-01-01';

#3) Selecione o nome, CPF e endereço dos clientes que moram no "Novo Bairro".
SELECT nm_cliente, ds_cpf, cd_endereco FROM cliente
WHERE cd_endereco = 2;

#4) Selecione o nome e a data de nascimento dos clientes ordenados por data de nascimento, do mais novo para o mais velho.
SELECT nm_cliente, dt_nascimento FROM cliente
ORDER BY dt_nascimento DESC;

#5) Selecione o nome, CPF e município dos clientes que são cooperados e moram no "Centro".
SELECT nm_cliente, ds_cpf, cd_endereco FROM cliente
WHERE bl_cooperado = TRUE AND 
cd_endereco = 1;

#======== TABELA PRODUTO ===========

#1) Selecione todos os produtos com um preço superior a 100.
SELECT * FROM produto
WHERE vl_produto > 100;

#2) Selecione o nome e a quantidade em estoque dos produtos na categoria "Eletrônicos".
SELECT nm_produto, qt_estoque, cd_categoria FROM produto
WHERE cd_categoria = 1;

#3) Selecione o nome, valor e categoria dos produtos com um valor entre 50 e 200.
SELECT nm_produto, vl_produto, cd_categoria FROM produto 
WHERE vl_produto > 10 AND vl_produto < 50;

#4) Selecione o nome e a descrição da categoria dos produtos que possuem menos de 10 unidades em estoque.
SELECT nm_produto, cd_categoria FROM produto
WHERE qt_estoque < 10; #Não aparece nada pois não tem nenhum produto com menos de 10 unidades em estoque.

#5) Selecione o nome e a quantidade em estoque dos produtos que pertencem à categoria "Livros" e têm um valor inferior a 30.
SELECT nm_produto, qt_estoque FROM produto
WHERE cd_categoria = 3 AND vl_produto < 30;

#Fazendo JOIN
#Separando a tabeela "cliente" e "endereco" por vírgula
#c --> Apelido para "cliente"
#e --> apelido para "endereco"
# AS --> Usado para minimizar o nome de alguma tabela 

#Aqui eu to fazendo com o que apareça as duas tabelas, dos clientes e do endereço mas usando WHERE
SELECT * FROM cliente AS c, endereco AS e
WHERE c.cd_endereco = e.id;

#Aqui to fazendo com o que apareça as duas tabelas, dos clientes e do endereço mas usando JOIN
SELECT * FROM cliente AS c JOIN endereco AS e
ON c.cd_endereco = e.id
#Coloquei para aparecer apenas os clientes cooperados
WHERE c.bl_cooperado = TRUE;


# ======== Apresentar dados da TABELA CLIENTE e seus ENDEREÇOS ===========
SELECT * FROM cliente AS c JOIN endereco AS e 
ON c.cd_endereco = e.id;

# ======== Apresentar dados da TABELA PRODUTO e suas CATEGORIAS ===========

SELECT * FROM produto AS p JOIN categoria AS c 
ON p.cd_categoria = c.id;


#1) Selecione o nome do cliente, o CPF e o bairro do endereço para todos os clientes que moram no município de "Cidade A".
SELECT c.nm_cliente, c.ds_cpf, e.nm_bairro FROM cliente AS c JOIN endereco AS e
ON c.cd_endereco = e.id
WHERE e.nm_municipio = 'Cidade A';


#2) Selecione o nome do cliente, a data de nascimento e o município do endereço para todos os clientes, ordenados por município em ordem alfabética.
SELECT c.nm_cliente, c.dt_nascimento, e.nm_municipio FROM cliente AS c JOIN endereco AS e 
ON  c.cd_endereco = e.id
ORDER BY e.nm_municipio ASC;


#3) Selecione o nome do cliente, o CPF e o bairro do endereço para clientes que são cooperados e moram no bairro "Centro".
SELECT c.nm_cliente, c.ds_cpf, e.nm_bairro FROM cliente AS c JOIN endereco AS e 
ON c.cd_endereco = e.id
WHERE c.bl_cooperado = TRUE AND e.nm_bairro = 'Centro';


#4) Selecione o nome do cliente, a data de nascimento, o município e o bairro do endereço para clientes que nasceram depois de 1990, ordenados por data de nascimento.
SELECT c.nm_cliente, c.dt_nascimento, e.nm_municipio, e.nm_bairro FROM cliente AS c JOIN endereco AS e 
ON c.cd_endereco = e.id
WHERE c.dt_nascimento > '1990-01-01'
ORDER BY c.dt_nascimento;


#5) Selecione o nome do cliente, o CPF e o município do endereço para clientes que não são cooperados, ordenados por município e nome do cliente.
SELECT c.nm_cliente, c.ds_cpf, e.nm_municipio FROM cliente AS c JOIN endereco AS e 
ON c.cd_endereco = e.id 
WHERE c.bl_cooperado = FALSE
ORDER BY e.nm_municipio AND c.nm_cliente;


#6) Selecione o nome do produto, a quantidade em estoque e o valor para todos os produtos que pertencem à categoria "Eletrônicos".
SELECT p.nm_produto, p.qt_estoque, p.vl_produto, c.nm_categoria FROM produto AS p JOIN categoria AS c
ON p.cd_categoria = c.id
WHERE c.nm_categoria = 'Eletronicos';


#7) Selecione o nome do produto, o valor e a descrição da categoria para todos os produtos, ordenados por valor em ordem decrescente.
SELECT p.nm_produto, p.vl_produto, c.ds_categoria
FROM produto AS p JOIN categoria AS c 
ON p.cd_categoria = c.id
ORDER BY p.vl_produto DESC;


#8) Selecione o nome do produto, a quantidade em estoque e a descrição da categoria para produtos que têm menos de 20 unidades em estoque, ordenados por quantidade em estoque em ordem crescente.
SELECT p.nm_produto, p.qt_estoque, c.ds_categoria
FROM produto AS p JOIN categoria AS c 
ON p.cd_categoria = c.id
WHERE p.qt_estoque < 20 #Não aparece nada, pois não tem um produto com menos de 20 unidades em estoque 
ORDER BY p.qt_estoque;


#9) Selecione o nome do produto, o valor e a quantidade em estoque para produtos que pertencem à categoria "Livros" e têm um valor superior a 15.
SELECT p.nm_produto, p.vl_produto, p.qt_estoque, c.nm_categoria
FROM produto AS p JOIN categoria AS c 
ON p.cd_categoria = c.id 
WHERE c.nm_categoria = 'Livros' AND p.vl_produto > 15;


#10) Selecione o nome do produto, a quantidade em estoque e a descrição da categoria para produtos que têm mais de 50 unidades em estoque e pertencem à categoria "Moda", ordenados por quantidade em estoque em ordem decrescente.
SELECT p.nm_produto, p.qt_estoque, c.ds_categoria
FROM produto AS p JOIN categoria AS c 
ON p.cd_categoria = c.id
WHERE p.qt_estoque > 50 AND c.nm_categoria = 'Moda'
ORDER BY p.qt_estoque DESC;