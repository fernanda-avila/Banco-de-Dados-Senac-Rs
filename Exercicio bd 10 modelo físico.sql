CREATE DATABASE Empresa;

USE Empresa;

CREATE TABLE Supervisao (
    ID_supervisor VARCHAR(80) PRIMARY KEY,
    possui_ID_supervisor VARCHAR(80),
    CPF VARCHAR(80) UNIQUE NOT NULL,
    FOREIGN KEY (possui_ID_supervisor) REFERENCES Supervisao(ID_supervisor)
);

CREATE TABLE Departamentos_Funcionarios (
    ID_departamento INT PRIMARY KEY,
    Nome TEXT NOT NULL,
    ID_supervisor VARCHAR(80),
    Nome_completo TEXT NOT NULL,
    Salario TEXT NOT NULL,
    CPF VARCHAR(80) NOT NULL,
    Endereco_completo TEXT,
    data_inicio TEXT,
    FOREIGN KEY (ID_supervisor) REFERENCES Supervisao(ID_supervisor)
);

CREATE TABLE Projetos (
    Nome_do_projeto varchar(30) NOT NULL,
    numero_do_projeto varchar(30) PRIMARY KEY,
    Localizacao TEXT,
    ID_departamento INT,
    FOREIGN KEY (ID_departamento) REFERENCES Departamentos_Funcionarios(ID_departamento)
);

CREATE TABLE Emprega (
    ID_supervisor VARCHAR(80),
    CPF VARCHAR(80) NOT NULL,
    ID_departamento INT,
    PRIMARY KEY (ID_supervisor, CPF),
    FOREIGN KEY (ID_supervisor) REFERENCES Supervisao(ID_supervisor),
    FOREIGN KEY (ID_departamento) REFERENCES Departamentos_Funcionarios(ID_departamento)
);

CREATE TABLE Trabalham (
    horas TEXT,
    Nome_do_projeto TEXT,
    numero_do_projeto TEXT,
    ID_supervisor VARCHAR(80),
    CPF VARCHAR(80),
    PRIMARY KEY (numero_do_projeto, CPF),
    FOREIGN KEY (numero_do_projeto) REFERENCES Projetos(numero_do_projeto),
    FOREIGN KEY (CPF) REFERENCES Emprega(CPF),
    FOREIGN KEY (ID_supervisor) REFERENCES Supervisao(ID_supervisor)
);