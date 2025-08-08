create database SistemaPedidos;

use SistemaPedidos;

create table Consumidor (
	id integer auto_increment primary key,
    nome varchar(100) not null,
    sobrenome varchar(100) not null,
    email varchar(30) not null,
    telefone varchar(11) not null
);

INSERT INTO Consumidor (id, nome, sobrenome, email, telefone) VALUES
(2, "Ana", "Souza", "ana.souza@gmail.com", "99911111111"),
(3, "Bruno", "Silva", "bruno.silva@gmail.com", "99922222222"),
(4, "Carlos", "Pereira", "carlos.pereira@gmail.com", "99933333333"),
(5, "Daniela", "Almeida", "daniela.almeida@gmail.com", "99944444444"),
(6, "Eduardo", "Oliveira", "eduardo.oliveira@gmail.com", "99955555555"),
(7, "Fernanda", "Martins", "fernanda.martins@gmail.com", "99966666666"),
(8, "Gabriel", "Costa", "gabriel.costa@gmail.com", "99977777777"),
(9, "Helena", "Lima", "helena.lima@gmail.com", "99988888888"),
(10, "Igor", "Ribeiro", "igor.ribeiro@gmail.com", "99900000000"),
(11, "Juliana", "Fernandes", "juliana.fernandes@gmail.com", "98811112222"),
(12, "Kleber", "Rodrigues", "kleber.rodrigues@gmail.com", "98833334444"),
(13, "Larissa", "Moura", "larissa.moura@gmail.com", "98855556666"),
(14, "Marcelo", "Nascimento", "marcelo.nascimento@gmail.com", "98877778888"),
(15, "Natalia", "Barbosa", "natalia.barbosa@gmail.com", "98899990000"),
(16, "Otávio", "Dias", "otavio.dias@gmail.com", "97711112222"),
(17, "Patrícia", "Cardoso", "patricia.cardoso@gmail.com", "97733334444"),
(18, "Ricardo", "Mendes", "ricardo.mendes@gmail.com", "97755556666"),
(19, "Sabrina", "Teixeira", "sabrina.teixeira@gmail.com", "97777778888"),
(20, "Thiago", "Vieira", "thiago.vieira@gmail.com", "97799990000"),
(21, "Vanessa", "Gomes", "vanessa.gomes@gmail.com", "96611112222");




create table Categoria (
	id integer auto_increment primary key,
    nome_categoria varchar(100) not null
);


INSERT INTO Categoria (id, nome_categoria) VALUES
(1, "Eletrônicos"),
(2, "Eletrodomésticos"),
(3, "Roupas Masculinas"),
(4, "Roupas Femininas"),
(5, "Calçados"),
(6, "Livros"),
(7, "Esportes"),
(8, "Beleza"),
(9, "Saúde"),
(10, "Informática"),
(11, "Móveis"),
(12, "Decoração"),
(13, "Brinquedos"),
(14, "Papelaria"),
(15, "Automotivo"),
(16, "Pet Shop"),
(17, "Jardinagem"),
(18, "Suplementos"),
(19, "Games"),
(20, "Cozinha");



create table Produto(
	id integer auto_increment primary key,
    id_categoria integer not null,
    nome varchar(100) not null,
    preco decimal(10, 2) not null,

    foreign key(id_categoria) 
    references Categoria(id)
);

INSERT INTO Produto (id, id_categoria, nome, preco) VALUES
(1, 1, "Smartphone Samsung Galaxy", 1999.99),
(2, 1, "TV LED 55\"", 2500.00),
(3, 2, "Geladeira Frost Free", 3200.50),
(4, 2, "Micro-ondas", 450.00),
(5, 3, "Camisa Polo Masculina", 89.90),
(6, 3, "Calça Jeans Masculina", 120.00),
(7, 4, "Vestido Feminino", 150.75),
(8, 4, "Blusa Feminina", 80.00),
(9, 5, "Tênis Esportivo", 199.99),
(10, 5, "Sandália Feminina", 79.90),
(11, 6, "Livro de Ficção", 39.90),
(12, 6, "Livro Didático", 60.00),
(13, 7, "Bola de Futebol", 120.00),
(14, 7, "Raquete de Tênis", 300.00),
(15, 8, "Perfume", 250.00),
(16, 8, "Maquiagem", 150.00),
(17, 9, "Vitaminas", 80.00),
(18, 9, "Kit de Primeiros Socorros", 60.00),
(19, 10, "Notebook Dell", 3500.00),
(20, 10, "Mouse Gamer", 150.00);
