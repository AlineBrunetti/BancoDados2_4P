-- Criar banco de dados
CREATE DATABASE SistemaPedidos;
USE SistemaPedidos;

-- ============================
-- Tabela Consumidor
-- ============================
CREATE TABLE Consumidor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    email VARCHAR(30) NOT NULL,
    telefone VARCHAR(11) NOT NULL
);

INSERT INTO Consumidor (nome, sobrenome, email, telefone) VALUES
("Ana", "Souza", "ana.souza@gmail.com", "99911111111"),
("Bruno", "Silva", "bruno.silva@gmail.com", "99922222222"),
("Carlos", "Pereira", "carlos.pereira@gmail.com", "99933333333"),
("Daniela", "Almeida", "daniela.almeida@gmail.com", "99944444444"),
("Eduardo", "Oliveira", "eduardo.oliveira@gmail.com", "99955555555"),
("Fernanda", "Martins", "fernanda.martins@gmail.com", "99966666666"),
("Gabriel", "Costa", "gabriel.costa@gmail.com", "99977777777"),
("Helena", "Lima", "helena.lima@gmail.com", "99988888888"),
("Igor", "Ribeiro", "igor.ribeiro@gmail.com", "99900000000"),
("Juliana", "Fernandes", "juliana.fernandes@gmail.com", "98811112222"),
("Kleber", "Rodrigues", "kleber.rodrigues@gmail.com", "98833334444"),
("Larissa", "Moura", "larissa.moura@gmail.com", "98855556666"),
("Marcelo", "Nascimento", "marcelo.nascimento@gmail.com", "98877778888"),
("Natalia", "Barbosa", "natalia.barbosa@gmail.com", "98899990000"),
("Otávio", "Dias", "otavio.dias@gmail.com", "97711112222"),
("Patrícia", "Cardoso", "patricia.cardoso@gmail.com", "97733334444"),
("Ricardo", "Mendes", "ricardo.mendes@gmail.com", "97755556666"),
("Sabrina", "Teixeira", "sabrina.teixeira@gmail.com", "97777778888"),
("Thiago", "Vieira", "thiago.vieira@gmail.com", "97799990000"),
("Vanessa", "Gomes", "vanessa.gomes@gmail.com", "96611112222");

-- ============================
-- Tabela Categoria
-- ============================
CREATE TABLE Categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL
);

INSERT INTO Categoria (nome_categoria) VALUES
("Eletrônicos"),
("Eletrodomésticos"),
("Roupas Masculinas"),
("Roupas Femininas"),
("Calçados"),
("Livros"),
("Esportes"),
("Beleza"),
("Saúde"),
("Informática"),
("Móveis"),
("Decoração"),
("Brinquedos"),
("Papelaria"),
("Automotivo"),
("Pet Shop"),
("Jardinagem"),
("Suplementos"),
("Games"),
("Cozinha");

-- ============================
-- Tabela Produto
-- ============================
CREATE TABLE Produto(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY(id_categoria) REFERENCES Categoria(id)
);

INSERT INTO Produto (id_categoria, nome, preco) VALUES
(1, "Smartphone Samsung Galaxy", 1999.99),
(1, "TV LED 55\"", 2500.00),
(2, "Geladeira Frost Free", 3200.50),
(2, "Micro-ondas", 450.00),
(3, "Camisa Polo Masculina", 89.90),
(3, "Calça Jeans Masculina", 120.00),
(4, "Vestido Feminino", 150.75),
(4, "Blusa Feminina", 80.00),
(5, "Tênis Esportivo", 199.99),
(5, "Sandália Feminina", 79.90),
(6, "Livro de Ficção", 39.90),
(6, "Livro Didático", 60.00),
(7, "Bola de Futebol", 120.00),
(7, "Raquete de Tênis", 300.00),
(8, "Perfume", 250.00),
(8, "Maquiagem", 150.00),
(9, "Vitaminas", 80.00),
(9, "Kit de Primeiros Socorros", 60.00),
(10, "Notebook Dell", 3500.00),
(10, "Mouse Gamer", 150.00);

-- ============================
-- Tabela Pedido
-- ============================
CREATE TABLE Pedido(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_consumidor INT,
    data_hora_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(id_consumidor) REFERENCES Consumidor(id)
);

INSERT INTO Pedido (id_consumidor, data_hora_pedido) VALUES
(1, '2025-07-01 10:30:00'),
(2, '2025-07-01 11:00:00'),
(3, '2025-07-02 09:15:00'),
(4, '2025-07-02 14:45:00'),
(5, '2025-07-03 16:20:00'),
(6, '2025-07-04 12:00:00'),
(7, '2025-07-05 13:30:00'),
(8, '2025-07-05 15:10:00'),
(9, '2025-07-06 08:50:00'),
(10, '2025-07-06 17:00:00'),
(11, '2025-07-07 10:00:00'),
(12, '2025-07-07 11:30:00'),
(13, '2025-07-08 09:00:00'),
(14, '2025-07-08 16:45:00'),
(15, '2025-07-09 14:15:00'),
(16, '2025-07-10 13:00:00'),
(17, '2025-07-10 18:20:00'),
(18, '2025-07-11 10:10:00'),
(19, '2025-07-11 15:40:00'),
(20, '2025-07-12 09:30:00');

-- ============================
-- Tabela DetalhePedido
-- ============================
CREATE TABLE DetalhePedido(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade_comprada INT,
    FOREIGN KEY(id_pedido) REFERENCES Pedido(id),
    FOREIGN KEY(id_produto) REFERENCES Produto(id)
);

INSERT INTO DetalhePedido (id_pedido, id_produto, quantidade_comprada) VALUES
(1, 1, 2),
(1, 5, 1),
(2, 3, 1),
(2, 10, 3),
(3, 7, 2),
(4, 2, 1),
(4, 14, 1),
(5, 6, 2),
(6, 4, 1),
(7, 8, 1),
(8, 9, 2),
(9, 11, 3),
(10, 12, 1),
(11, 13, 1),
(12, 15, 2),
(13, 16, 1),
(14, 17, 1),
(15, 18, 4),
(16, 19, 1),
(17, 20, 2);
