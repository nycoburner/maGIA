DROP TABLE Cliente;
CREATE TABLE Cliente 
( 
 ID INT PRIMARY KEY AUTO_INCREMENT,  
 Nome VARCHAR (100) NOT NULL,  
 CPF CHAR (14) UNIQUE,   
 Email VARCHAR (200) NOT NULL UNIQUE,  
 Senha VARCHAR(255) NOT NULL,  
 Celular CHAR(11)
); 

CREATE TABLE Compra 
( 
 idcliente INT,  
 idendereço INT,  
 data DATE NOT NULL,  
 forma_pagamente VARCHAR (200) NOT NULL,  
 valor_total FLOAT NOT NULL,  
 UNIQUE (idendereço)
); 

CREATE TABLE Endereço 
( 
 idcliente INT,  
 Rua VARCHAR (300) NOT NULL,  
 Numero INT,  
 Bairro VARCHAR (200) NOT NULL,  
 Cidade VARCHAR (100) NOT NULL,  
 Estado VARCHAR (100) NOT NULL,  
 UNIQUE (numero)
); 
CREATE TABLE Produto (
  id INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(100) NOT NULL,
  Descricao VARCHAR(200) NOT NULL,
  Categoria VARCHAR(200) NOT NULL,
  Valor_do_produto DECIMAL(10,2) NOT NULL,
  Caminho_IMG VARCHAR(400) NOT NULL,
  Quantidade_IMG INT NOT NULL
);
CREATE TABLE Possui (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_compra INT NOT NULL,
  id_produto INT NOT NULL,
  Quantidade INT NOT NULL,
  Valor_unitario DECIMAL(10,2) NOT NULL,
  UNIQUE (id_compra, id_produto),
  FOREIGN KEY (id_compra) REFERENCES compra(id),
  FOREIGN KEY (id_produto) REFERENCES produto(id)
);
ALTER TABLE compra ADD FOREIGN KEY(idcliente) REFERENCES cliente (idcliente)
ALTER TABLE compra ADD FOREIGN KEY(idendereço) REFERENCES endereço (idendereço)
ALTER TABLE endereço ADD FOREIGN KEY(idcliente) REFERENCES cliente (idcliente)
ALTER TABLE possui ADD FOREIGN KEY(id) REFERENCES compra (id)
ALTER TABLE possui ADD FOREIGN KEY(id) REFERENCES produto (id)
