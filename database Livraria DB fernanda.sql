create database LIvraria;
USE Livraria;

CREATE TABLE Autores (
id_autor INT AUTO_INCREMENT PRIMARY KEY,
nome_autor varchar(80) not null,
nacionalidade_autor varchar(80) not null
);

CREATE TABLE Livros (
id_livro INT AUTO_INCREMENT PRIMARY KEY,
titulo_livro VARCHAR(80) NOT NULL,
preco_livro decimal (10, 2) not null,
qtde_em_estoque INT not null,
id_autor int not null,
foreign key (id_autor) references Autores(id_autor)
);

CREATE TABLE Vendas (
id_venda INT PRIMARY KEY AUTO_INCREMENT,
id_livro INT NOT NULL,
FOREIGN KEY (id_livro) REFERENCES Livros(id_livro),
qtde_venda INT NOT NULL,
data_venda DATE not null
);
INSERT INTO Livros (titulo_livro, preco_livro, qtde_em_estoque, id_autor)
VALUES
('Harry Potter e o Cálice de Fogo', 39.90, 30, 1),
('Harry Potter e a Ordem da Fênix', 39.90, 28, 1),
('A Dance with Dragons', 69.90, 15, 2),
('O Guarani', 34.90, 40, 3),
('O Cortiço', 29.90, 25, 3),
('A Estrategista', 49.90, 20, 4),
('A Última Fronteira', 22.90, 50, 4),
('Harry Potter e a Câmara Secreta', 39.90, 40, 1),
('Harry Potter e o Prisioneiro de Azkaban', 39.90, 35, 1),
('A Clash of Kings', 59.90, 20, 2),
('A Storm of Swords', 59.90, 25, 2),
('Memórias Póstumas de Brás Cubas', 24.90, 50, 3),
('O Alienista', 19.90, 30, 3),
('Como Evitar um Casamento Arranjado', 29.90, 15, 4),
(1, 'J.K. Rowling', 'Reino Unido'),
(2,'Georgie R. R. Martin', 'EUA'),
(3, 'Machado de Assis', 'Brasil'),
(4, 'Bill Gates', 'EUA');

INSERT INTO Livros (id_livro, titulo_livro, preco_livro, qtde_em_estoque, id_autor)
VALUES
(1, 'Harry Potter e a Pedra Filosofal', 39.90, 50, 1),
(2, 'A Guerra dos Tronos', 50.90, 30, 2),
(3, 'Dom Casmurro', 29.90, 15, 3),
(4, 'Guia SQL inicial', 59.90, 10, 4);

INSERT INTO Vendas (id_venda, id_livro, qtde_venda, data_venda)
VALUES
(1, 2, 3,'2024-10-10'),
(2,3,2, '2024-08-10'),
(3,1,1, '2024-10-09');

UPDATE Livros
SET preco_livro = 39.90
WHERE id_livro = 2;

DELETE FROM Livros 
where id_livro = 4;

SELECT *
FROM Livros
WHERE id_autor = 1;

select * from Livros