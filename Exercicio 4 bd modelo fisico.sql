create database videos;

CREATE TABLE Atores (
    IDAtores INT AUTO_INCREMENT PRIMARY KEY,  
    Nome VARCHAR(100) NOT NULL,              
    DataNascimento DATE                      
);

CREATE TABLE Filmes (
    IDFilmes INT AUTO_INCREMENT PRIMARY KEY,  
    Titulo VARCHAR(100) NOT NULL              
);

CREATE TABLE Atuacoes (
    ID INT AUTO_INCREMENT PRIMARY KEY,        
    IDFilmes INT,                             
    IDAtores INT,                             
    FOREIGN KEY (IDFilmes) REFERENCES Filmes(IDFilmes),   
    FOREIGN KEY (IDAtores) REFERENCES Atores(IDAtores)    
);

CREATE TABLE Categorias (
    IDCategoria INT AUTO_INCREMENT PRIMARY KEY,  
    NomeCategoria VARCHAR(50)                    
);

CREATE TABLE Fitas (
    IDFita INT AUTO_INCREMENT PRIMARY KEY,     
    IDFilmes INT,                              
    Formato VARCHAR(50),                      
    FOREIGN KEY (IDFilmes) REFERENCES Filmes(IDFilmes)  
);

CREATE TABLE Clientes (
    IDCliente INT AUTO_INCREMENT PRIMARY KEY,  
    NomeCompleto VARCHAR(100) NOT NULL,        
    Endereco VARCHAR(255),                     
    Telefone VARCHAR(15)                     
);

CREATE TABLE Alugueis (
    IDAluguel INT AUTO_INCREMENT PRIMARY KEY,  
    IDCliente INT,                          
    IDFita INT,                              
    DataAluguel DATE,                        
    FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente), 
    FOREIGN KEY (IDFita) REFERENCES Fitas(IDFita)          
);




