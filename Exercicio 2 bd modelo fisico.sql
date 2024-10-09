CREATE DATABASE CONSULTORIO;
CREATE TABLE Medicos (
    CRM VARCHAR(10) PRIMARY KEY,    
    Nome_Completo VARCHAR(100) NOT NULL,   
    Endereco VARCHAR(255) NOT NULL,        
    Especialidade VARCHAR(100) NOT NULL,   
    Residencial VARCHAR(15),               
    Comercial VARCHAR(15),                
    Celular VARCHAR(15)                    
);

CREATE TABLE Pacientes (
    CPF VARCHAR(11) PRIMARY KEY,          
    RG VARCHAR(15),                       
    Nome VARCHAR(100) NOT NULL,           
    Endereco VARCHAR(255) NOT NULL,     
    Data_de_Nascimento DATE,              
    Sexo CHAR(1),                       
    Nome_Convenio VARCHAR(100),        
    Matricula_Convenio VARCHAR(50)      
);

CREATE TABLE Telefones (
    CPF_Paciente VARCHAR(11),             
    Residencial VARCHAR(15),             
    Comercial VARCHAR(15),                
    Celular VARCHAR(15),                  
    PRIMARY KEY (CPF_Paciente),           
    FOREIGN KEY (CPF_Paciente) REFERENCES Pacientes(CPF)  
);

CREATE TABLE Consulta (
    ID_Medico VARCHAR(10),                
    ID_Paciente VARCHAR(11),              
    Especialidade VARCHAR(100),           
    Data_Consulta DATE NOT NULL,       
    Hora_Consulta TIME NOT NULL,       
    PRIMARY KEY (ID_Medico, ID_Paciente, Data_Consulta),  
    FOREIGN KEY (ID_Medico) REFERENCES Medicos(CRM),      
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(CPF)   
);


