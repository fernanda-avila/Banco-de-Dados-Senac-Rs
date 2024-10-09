CREATE DATABASE CURSOS;

CREATE TABLE Alunos (
    IDAlunos VARCHAR(10) PRIMARY KEY,    
    Nome VARCHAR(100) NOT NULL,          
    Telefone VARCHAR(15)                 
);

CREATE TABLE Instrutor (
    IDInstrutor VARCHAR(10) PRIMARY KEY,  
    Nome VARCHAR(100) NOT NULL,           
    Telefone VARCHAR(15)                
);

CREATE TABLE Curso (
    IDCurso VARCHAR(10) PRIMARY KEY,      
    Nome VARCHAR(100) NOT NULL,         
    Preco DECIMAL(10)               
);

CREATE TABLE Matriculam_se (
    IDCurso VARCHAR(10),                  
    IDAlunos VARCHAR(10),                 
    PRIMARY KEY (IDCurso, IDAlunos),     
    FOREIGN KEY (IDCurso) REFERENCES Curso(IDCurso),  
    FOREIGN KEY (IDAlunos) REFERENCES Alunos(IDAlunos) 
);

CREATE TABLE Leciona (
    IDCurso VARCHAR(10),                  
    IDInstrutor VARCHAR(10),              
    PRIMARY KEY (IDCurso, IDInstrutor),   
    FOREIGN KEY (IDCurso) REFERENCES Curso(IDCurso),  
    FOREIGN KEY (IDInstrutor) REFERENCES Instrutor(IDInstrutor) 
);

CREATE TABLE Sao_Alunos (
    IDInstrutor VARCHAR(10),              
    IDAlunos VARCHAR(10),                
    PRIMARY KEY (IDInstrutor, IDAlunos),  
    FOREIGN KEY (IDInstrutor) REFERENCES Instrutor(IDInstrutor),  
    FOREIGN KEY (IDAlunos) REFERENCES Alunos(IDAlunos)           
);






