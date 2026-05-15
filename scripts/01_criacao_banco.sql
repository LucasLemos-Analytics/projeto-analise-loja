CREATE DATABASE loja;

USE loja;

/* CRIAÇÃO DAS TABELAS  */ 

CREATE TABLE clientes (
    id_cliente INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE produtos (
    id_produto INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE enderecos (
    id_endereco INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_cliente INTEGER,
    rua VARCHAR(100),
    numero VARCHAR(10),
    cidade VARCHAR(100),
    cep VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE telefones (
    id_telefone INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_cliente INTEGER,
    numero VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


CREATE TABLE pedidos (
    id_pedido INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_cliente INTEGER,
    id_produto INTEGER,
    data DATE,
    quantidade INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

