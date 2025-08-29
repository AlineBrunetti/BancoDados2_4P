CREATE DATABASE IF NOT EXISTS bibliotecaDB;
USE bibliotecaDB;

CREATE TABLE IF NOT EXISTS Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    saldo DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Livro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    disponivel BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS Emprestimo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    livro_id INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (livro_id) REFERENCES Livro(id)
);

INSERT INTO Usuario (nome, saldo) VALUES
('Ana', 50.00),
('Carlos', 30.00);

INSERT INTO Livro (titulo, disponivel) VALUES
('Dom Casmurro', TRUE),
('O Senhor dos Anéis', TRUE),
('1984', TRUE);
