
USE Livraria;

CREATE TABLE Livros ( 
    ISBN INT NOT NULL,  
    Autor VARCHAR(50) NOT NULL,
    Título VARCHAR(80) NOT NULL,
    Editora VARCHAR(80) NOT NULL,
    Palavras_Chave VARCHAR(80),
    Local_edicao VARCHAR(50),
    PRIMARY KEY (ISBN) 
);

CREATE TABLE Associados (
    IDAssociado INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(80) NOT NULL,
    Endereco VARCHAR(80),
    EmprestimosEmAndamento INT  
);

CREATE TABLE Emprestimo (
    IDAssociado INT,
    dataEmprestimo TIMESTAMP NOT NULL,
    prazoDevolucao DATE NOT NULL,
    PRIMARY KEY (IDAssociado, dataEmprestimo),  
    FOREIGN KEY (IDAssociado) REFERENCES Associados(IDAssociado)
);

CREATE TABLE Exemplares (
    ISBN INT, 
    IDExemplar INT PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY (ISBN) REFERENCES Livros(ISBN)  
);
