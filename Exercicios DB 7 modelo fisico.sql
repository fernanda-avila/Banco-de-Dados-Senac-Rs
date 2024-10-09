CREATE DATABASE CDS;
USE CDS;

CREATE TABLE CD (
Nome varchar(80) not null,
Lancamento date not null
);

CREATE TABLE Numeracao_cd (
NumeracaoID int primary key auto_increment,
Duracao int not null,
Titulo varchar(80) not null
);

CREATE TABLE Interprete (
IDInterprete int primary key auto_increment 
);

CREATE TABLE Compositor (
IDCompositor int primary key auto_increment
);

CREATE TABLE musicaInterprete (
    IDMusica INT PRIMARY KEY AUTO_INCREMENT, 
    IDInterprete INT,                        
    NumeracaoID INT,                         
    FOREIGN KEY (IDInterprete) REFERENCES Interprete(IDInterprete),
    FOREIGN KEY (NumeracaoID) REFERENCES Numeracao_cd(NumeracaoID)
);

CREATE TABLE musicaCompositor (
IDMusica INT PRIMARY KEY AUTO_INCREMENT,
IDCompositor INT,
NumeracaoID int,
foreign key (IDCompositor) references Compositor(IDCompositor),
foreign key (NumeracaoID) references Numeracao_cd(NumeracaoID)
);


