--Crear base de datos biblioteca 
CREATE DATABASE Biblioteca;
GO
--Usar la base de datos
USE Biblioteca;
Go
--Crear tabla Lector
CREATE TABLE Lector(
numLector int primary key,
numeroMen int not null,
Nombre varchar(50) not null,
ApPaterno varchar(50) not null,
ApMaterno varchar(50) not null,
);
GO

--Crear tabla Libro
CREATE TABLE Libro(
NumLibro int primary key,
numICEN int not null,
Autor varchar(50) not null,
CantidadL int not null
);
GO

--Crear tabla Presta
CREATE TABLE Presta(
numLector int not null,
NumLibro int not null,
primary key (numLector, NumLibro),
FOREIGN KEY(numLector)
REFERENCES Lector(numLector),
FOREIGN KEY(NumLibro)
REFERENCES Libro(NumLibro)
);
GO