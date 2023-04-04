CREATE DATABASE MeuBancoDeDados;

USE MeuBancoDeDados;

CREATE TABLE Aluno (
  Id INT PRIMARY KEY IDENTITY(1,1),
  Nome VARCHAR(100) NOT NULL,
  CPF VARCHAR(11) NOT NULL,
  Email VARCHAR(100) NOT NULL
);

CREATE TABLE Turma (
  Id INT PRIMARY KEY IDENTITY(1,1),
  Numero INT NOT NULL,
  AnoLetivo INT NOT NULL
);
