CREATE DATABASE IF NOT EXISTS DiskBebidas;
USE DiskBebidas;
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    ponto_referencia VARCHAR(100),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    nome_produto VARCHAR(100) NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    estoque_atual INT DEFAULT 0,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2),
    forma_pagamento ENUM('Dinheiro', 'Pix', 'Cartão Debito', 'Cartão Credito'),
    status_entrega ENUM('Pendente', 'Em Rota', 'Entregue', 'Cancelado'),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
INSERT INTO categorias (nome_categoria) VALUES 
('Cervejas'),
('Refrigerantes'),
('Energéticos'),
('Destilados'),
('Gelo e Conveniência');
INSERT INTO produtos (id_categoria, nome_produto, preco_unitario, estoque_atual) VALUES 
(1, 'Cerveja Brahma Duplo Malte 350ml', 3.89, 144),
(1, 'Cerveja Heineken Long Neck 330ml', 6.50, 72),
(2, 'Coca-Cola 2 Litros', 9.50, 40),
(2, 'Guaraná Antarctica 1.5L', 7.00, 30),
(4, 'Combo Whisky Red Label + 4 Red Bull', 180.00, 10),
(5, 'Saco de Gelo 5kg', 12.00, 20);
INSERT INTO clientes (nome, telefone, endereco, bairro, ponto_referencia) VALUES 
('Carlos Andrade', '11988887777', 'Rua das Palmeiras, 450', 'Jardim Planalto', 'Próximo ao Mercado Silva'),
('Mariana Souza', '11977776666', 'Av. Central, 1010', 'Centro', 'Apartamento 42'),
('Roberto Lima', '11955554444', 'Rua XV de Novembro, 88', 'Vila Nova', 'Em frente à Farmácia');
INSERT INTO pedidos (id_cliente, valor_total, forma_pagamento, status_entrega) VALUES 
(1, 45.50, 'Pix', 'Entregue');