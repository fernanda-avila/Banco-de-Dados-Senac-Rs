create DATABASE BIBLIOTECA;
CREATE TABLE Autor (
    CPF VARCHAR(11) PRIMARY KEY,   
    Nome VARCHAR(100) NOT NULL,    
    Nacionalidade VARCHAR(50)    
);

CREATE TABLE Editora (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(80) NOT NULL
);

CREATE TABLE Livro (
    ISBN VARCHAR(13) PRIMARY KEY, 
    Titulo VARCHAR(255) NOT NULL,  
    Ano VARCHAR(4) NOT NULL        
);

CREATE TABLE Categoria (
    codigoCategoria INT PRIMARY KEY AUTO_INCREMENT,  
    Nome VARCHAR(100) NOT NULL,                       
    Descricao TEXT                                
);

CREATE TABLE Possui (
    codigoCategoria INT,     
    ISBN VARCHAR(13),    
    PRIMARY KEY (codigoCategoria, ISBN),  
    FOREIGN KEY (codigoCategoria) REFERENCES Categoria(codigoCategoria),
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN)
);

CREATE TABLE Escrito (
    CPF VARCHAR(11),
    ISBN VARCHAR(13),  
    PRIMARY KEY (CPF, ISBN),  
    FOREIGN KEY (CPF) REFERENCES Autor(CPF),
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN)
);

CREATE TABLE Publicado (
    ISBN VARCHAR(13),  
    ID INT AUTO_INCREMENT,
    PRIMARY KEY (ISBN, ID),  
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN),
    FOREIGN KEY (ID) REFERENCES Editora(ID)
);





