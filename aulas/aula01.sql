CREATE TABLE pessoa (
	cd_pessoa INTEGER, #isso são colunas
	nm_pessoa VARCHAR(150), #colunas == atributos
	fl_estado_civil CHAR(1)
); #Precisa de ponto e virgula para separar cada comando

#CREATE TABLE é o comando
#Coloco em CAPSLOCK o comando da SQL
#"pessoa" é o nome da variável que eu dei
#coloco tudo minúsculo o nome da variável criada por mim

#Alterei na tabela pessoa a coluna "nm_pessoa" para um VARCHAR que comporta 100 caracteres, e não mais 150 caracteres 
ALTER TABLE pessoa MODIFY nm_pessoa VARCHAR(100);

CREATE TABLE sala_de_aula (
id_sala_aula INTEGER,
qt_alunos INTEGER,
nm_professor VARCHAR(150),
cnt_media DECIMAL,
ds_periodo CHAR(1)
);
 
 #Aqui eu adicionei uma coluna a mais na minha tabela chamada "sala_de_aula" chamada "fl_monitor"
ALTER TABLE sala_de_aula 
ADD COLUMN fl_monitor INTEGER;

#Aqui eu to deletando essa coluna que eu acabei de criar chamada "fl_monitor" na minha tabela chamada "sala_de_aula"
ALTER TABLE sala_de_aula
DROP COLUMN fl_monitor;

CREATE TABLE categoria (
id_categoria INTEGER,
nm_categoria VARCHAR(50),
ds_categoria VARCHAR(150)
);

#Aqui eu adiciono uma coluna a mais na minha tabela de "categoria" chamada "coluna_exemplo"
ALTER TABLE categoria 
ADD COLUMN coluna_exemplo INTEGER;

#Aqui eu to deletando essa coluna que eu acabei de criar na minha tabela de "categoria" 
ALTER TABLE categoria 
DROP COLUMN coluna_exemplo;

CREATE TABLE cliente (
id_cliente INTEGER,
nm_cliente VARCHAR(150),
ds_cpf CHAR(11),
bl_cooperado BOOLEAN,
dt_nascimento DATE
);

#Adicionei na tabela "cliente" novas colunas 
ALTER TABLE cliente ADD COLUMN nmr_telefone CHAR(14);
ALTER TABLE cliente ADD COLUMN ds_descricao VARCHAR(200);
ALTER TABLE cliente ADD COLUMN ds_email VARCHAR(150);

#Deletei da tabela "cliente" colunas existentes
ALTER TABLE cliente DROP COLUMN dt_nascimento;
ALTER TABLE cliente DROP COLUMN bl_cooperado;


CREATE TABLE voo (
nr_numero INTEGER,
qnt_passagens INTEGER,
hr_decolagem DATETIME,
hr_prevista DATETIME
);

#Aqui eu to deletando a minha tabela INTEIRA chamada "voo"
DROP TABLE voo;

CREATE TABLE departamento (
#o primeiro atributo tem que ser a PK (primary key)aulas
id INTEGER PRIMARY KEY, #PRIMARY KEY --> Define que é a PK
ds_departamentocliente VARCHAR(150)
);

CREATE TABLE chefe (
id INTEGER PRIMARY KEY,
ds_nome VARCHAR(50),
#no final eu crio meus atributos(colunas) estrangeiros 

#chamo referencia "REFERENCES" --> chama a tabela "departamento" especifico a coluna que possui o PK (id(PK))
cd_departamento INTEGER REFERENCES departamento (id)
);

ALTER TABLE voo 
ADD COLUMN fl_monitor INTEGER;
ALTER TABLE voo 
ADD COLUMN ds_destino VARCHAR(150);
ALTER TABLE voo 
ADD COLUMN preco_passagem DECIMAL;