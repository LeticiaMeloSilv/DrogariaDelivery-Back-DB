drop database if exists db_delivery_remedio;
CREATE DATABASE db_delivery_remedio;
USE db_delivery_remedio;

CREATE TABLE tbl_produtos(
id_produto INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE KEY,
nome VARCHAR(50) NOT NULL,
descricao TEXT,
preco FLOAT NOT NULL,
quantidade INT NOT NULL,
gramatura FLOAT,
foto VARCHAR(200),
prescricao BOOLEAN NOT NULL DEFAULT 0
);

CREATE TABLE tbl_clientes(
id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE KEY,
nome VARCHAR(50) NOT NULL,
data_nascimento DATE NOT NULL,
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
email  VARCHAR(255) NOT NULL,
senha  VARCHAR(255) NOT NULL,
cpf  VARCHAR(20) NOT NULL,
rg  VARCHAR(20) 
);
CREATE TABLE tbl_entregadores(
id_entregador INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE KEY,
nome VARCHAR(50) NOT NULL,
data_nascimento DATE NOT NULL,
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
email  VARCHAR(255) NOT NULL,
senha  VARCHAR(255) NOT NULL,
cpf  VARCHAR(20) NOT NULL,
rg  VARCHAR(20) NOT NULL,
cnh VARCHAR(20) NOT NULL,
foto_documento_automovel varchar(255) NOT NULL,
marca VARCHAR(20),
cor VARCHAR(20),
placa VARCHAR(10) NOT NULL
);

CREATE TABLE tbl_pedidos(
id_pedido INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE KEY,
    id_cliente INT NOT NULL,
	status_pedido ENUM('Pedido recebido', 'Pedido aceito', 'Pedido separado', 'A caminho', 'Entregue', 'Pedido cancelado') NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_entregador INT NOT NULL,
    FOREIGN KEY (id_entregador)
        REFERENCES tbl_entregadores (id_entregador),
    FOREIGN KEY (id_cliente)
        REFERENCES tbl_clientes (id_cliente)
);
CREATE TABLE tbl_laudos (
    id_laudo INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE KEY,
    descricao TEXT,
    foto_laudo VARCHAR(255) NOT NULL,
    data_laudo DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);
CREATE TABLE tbl_pagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE KEY,
    metodo_pagamento VARCHAR(50) NOT NULL,
    status_pagamento ENUM('Pago', 'Cancelado', 'Pendente') NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    frete DECIMAL(10,2),
    data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE tbl_pedido_produtos (
    id_pedido_produto INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    id_laudo INT,
    id_pagamento INT NOT NULL,
    FOREIGN KEY (id_laudo)
        REFERENCES tbl_laudos (id_laudo),
    FOREIGN KEY (id_pagamento)
        REFERENCES tbl_pagamentos (id_pagamento),
    FOREIGN KEY (id_pedido)
        REFERENCES tbl_pedidos (id_pedido),
    FOREIGN KEY (id_produto)
        REFERENCES tbl_produtos (id_produto)
);

INSERT INTO tbl_clientes (nome, data_nascimento, email, senha, cpf, rg) VALUES
('Marcela Duarte', '1974-06-07', 'ana-vitoria54@yahoo.com.br', 'fdYvvL_v!5', '93614207552', 1662884),
('Sr. Enzo Caldeira', '1956-07-31', 'rteixeira@bol.com.br', '(hFfkCTIo9', '57498021323', 9188064),
('Fabiana Ribeiro', '1958-08-17', 'jose.lorenzo@hotmail.com', '17IG+zv5QX', '16093735771', 6973281),
('Adriano Barros', '1996-03-14', 'emilly72@terra.com.br', 'NkEzvS++lw', '32690537695', 8315449),
('Matheus Fogaça', '1984-09-11', 'matheus13@bol.com.br', 'sKR9RUZ%g5', '87206945445', 2193244);

INSERT INTO tbl_entregadores (nome, data_nascimento, email, senha, cpf, rg, cnh, foto_documento_automovel, marca, cor, placa) VALUES
('Isabel Jesus', '2006-10-22', 'ana-sophia26@vieira.net', 'c7g5F7Cj)&', '95817204649', 1546930, 57265899945, 55752172897, 'Harley', 'Preto', 'UMB-1410'),
('Sra. Caroline Pereira', '1997-01-12', 'knascimento@uol.com.br', 'HE!2Tt1jf_', '30471658235', 7861038, 51749560510, 30206816733, 'Honda', 'Azul', 'YZX-9252'),
('Maria Eduarda Castro', '1988-04-03', 'eduardacastro@gmail.com', '5r^UGuzL$1', '12345678900', 4567890, 77889966555, 99887766555, 'Suzuki', 'Cinza', 'ABC-1234'),
('Lucas Souza', '1985-07-15', 'lucas.souza@exemplo.com', 'a1B2c3D4e5', '98765432100', 6543210, 12312312300, 32132132100, 'BMW', 'Branco', 'XYZ-5678'),
('Camila Rocha', '1991-11-02', 'camila.rocha@exemplo.com', 'ZxY!23@#', '19283746500', 7894561, 45612378900, 32178965400, 'Yamaha', 'Vermelho', 'JKL-9087');

INSERT INTO tbl_produtos (nome, descricao, preco, quantidade, gramatura, foto, prescricao) VALUES
('Animi', 'At eius itaque est at ipsum reiciendis.', 75.26, 45, 1.55, 'img/produto3.jpg', 1),
('Aspernatur', 'Quod assumenda suscipit magni placeat porro.', 190.33, 28, 0.95, 'img/produto7.jpg', 0),
('Dolorem', 'Ullam eos atque amet voluptas quasi fugit.', 132.10, 12, 1.2, 'img/produto2.jpg', 1),
('Eligendi', 'Sint mollitia dignissimos consequatur fugiat.', 25.99, 35, 0.8, 'img/produto5.jpg', 0),
('Voluptas', 'Pariatur tempore unde corrupti dolorem.', 99.99, 20, 1.0, 'img/produto9.jpg', 1);


INSERT INTO tbl_pedidos (id_cliente, status_pedido, id_entregador) VALUES
(1, 'Pedido aceito', 1),
(2, 'Pedido aceito',3),
(3, 'A caminho',2),
(4, 'Entregue',1),
(5, 'Pedido recebido', 3);
INSERT INTO tbl_laudos (descricao, foto_laudo) VALUES
('Non itaque minima possimus perferendis vel laboriosam.', 'uploads/laudos/laudo7.jpg'),
('Officia suscipit perspiciatis iste quaerat inventore necessitatibus facere sit quam.', 'uploads/laudos/laudo2.jpg'),
('Consequatur quo laboriosam sed fugiat alias non.', 'uploads/laudos/laudo4.jpg'),
('Ea tenetur illum vitae debitis impedit error quos.', 'uploads/laudos/laudo9.jpg'),
('Nesciunt laborum adipisci alias nihil minima repellat.', 'uploads/laudos/laudo1.jpg');
INSERT INTO tbl_pagamentos (metodo_pagamento, status_pagamento, total, frete) VALUES
('Pix', 'Pendente', 283.88, 15.13),
('Débito', 'Pago', 35.28, 19.42),
('Cartão de crédito', 'Pago', 120.00, 12.00),
('Boleto', 'Cancelado', 87.50, 10.50),
('Pix', 'Pago', 59.90, 9.00);
INSERT INTO tbl_pedido_produtos (id_pedido, id_produto, quantidade, id_laudo, id_pagamento) VALUES
(1, 1, 2, 1, 1),
(2, 2, 3, 2, 2),
(3, 3, 1, 3, 3),
(4, 4, 2, 4, 4),
(5, 5, 1, 5, 5);


-- Total gasto por cliente
SELECT 
    c.id_cliente,
    c.nome,
    COUNT(DISTINCT p.id_pedido) AS total_pedidos,
    SUM(pg.total) AS total_gasto
FROM 
    tbl_clientes c
JOIN 
    tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN 
    tbl_pedido_produtos pp ON p.id_pedido = pp.id_pedido
JOIN 
    tbl_pagamentos pg ON pp.id_pagamento = pg.id_pagamento
WHERE 
    pg.status_pagamento = 'Pago'
GROUP BY 
    c.id_cliente, c.nome
ORDER BY 
    total_gasto DESC;


-- Produtos mais vendidos
SELECT 
    pr.nome AS produto,
    SUM(pp.quantidade) AS total_vendido,
    SUM(pp.quantidade * pr.preco) AS total_arrecadado
FROM 
    tbl_pedido_produtos pp
JOIN 
    tbl_produtos pr ON pp.id_produto = pr.id_produto
JOIN 
    tbl_pagamentos pg ON pp.id_pagamento = pg.id_pagamento
WHERE 
    pg.status_pagamento = 'Pago'
GROUP BY 
    pr.id_produto, pr.nome
ORDER BY 
    total_vendido DESC;

-- Pedidos com produtos que exigem prescrição
SELECT 
    c.nome AS cliente,
    pr.nome AS produto,
    pp.id_pedido,
    pr.prescricao,
    l.foto_laudo
FROM 
    tbl_pedido_produtos pp
JOIN 
    tbl_produtos pr ON pp.id_produto = pr.id_produto
JOIN 
    tbl_pedidos pd ON pp.id_pedido = pd.id_pedido
JOIN 
    tbl_clientes c ON pd.id_cliente = c.id_cliente
LEFT JOIN 
    tbl_laudos l ON pp.id_laudo = l.id_laudo
WHERE 
    pr.prescricao = TRUE;


