CREATE TABLE endereco (
#tabela que nao possui a chave estrangeira (FK)
id INTEGER PRIMARY KEY,
nm_municipio VARCHAR(50),
nm_bairro VARCHAR(50)
);

#deletei a tabela "cliente", pois estava no arquivo "aula01", e dá problema 2 tabelas com o mesmo nome, pois os atributos puxados serão da "aula01"
DROP TABLE cliente;

#criei a tabela "cliente" novamente, mas com os atributos que serão usados para armazenar tais informações necessárias
CREATE TABLE cliente (
id INTEGER PRIMARY KEY,
nm_cliente VARCHAR(150),
ds_cpf CHAR(11),
bl_cooperado BOOLEAN,
dt_nascimento DATE,
#tabela que possui chave estrangeira (FK)
cd_endereco INTEGER REFERENCES endereco (id)
);

#deletei a tabela "categoria", pois estava no arquivo "aula01", e dá problema 2 tabelas com o mesmo nome, pois os atributos puxados serão da "aula01"
DROP TABLE categoria;

#criei a tabela "categoria" novamente, mas com os atributos que serão usados para armazenar tais informações necessárias
CREATE TABLE categoria (
id INTEGER PRIMARY KEY,
nm_categoria VARCHAR(50),
ds_categoria VARCHAR(150)
);

CREATE TABLE produto (
id INTEGER PRIMARY KEY,
nm_produto VARCHAR(50),
qt_estoque INTEGER,
vl_produto DECIMAL,
cd_categoria INTEGER REFERENCES categoria (id)
);

#deletei a tabela "pessoa", pois estava no arquivo "aula01", e dá problema 2 tabelas com o mesmo nome, pois os atributos puxados serão da "aula01"
DROP TABLE pessoa;

#criei a tabela "pessoa" novamente, mas com os atributos que serão usados para armazenar tais informações necessárias
CREATE TABLE pessoa (
id INTEGER PRIMARY KEY,
nm_pessoa VARCHAR(50),
ds_cpf CHAR(11),
bl_gerente BOOLEAN,
bl_empregado BOOLEAN
);

CREATE TABLE empresa (
id INTEGER PRIMARY KEY,
ds_cnpj CHAR(18),
qtd_funcionarios INTEGER
);

CREATE TABLE pessoa_empresa (
cd_pessoa INTEGER REFERENCES pessoa (id),
cd_empresa INTEGER REFERENCES empresa (id)
);