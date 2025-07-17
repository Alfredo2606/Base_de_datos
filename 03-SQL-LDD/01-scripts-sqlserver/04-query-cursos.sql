--Crear la base de datos Escuela
CREATE DATABASE Escuela;
GO

--Usar la base de datos creada
USE Escuela;
GO

--Crear la tabla Estudiante
CREATE TABLE Estudiante(
NumEstudiante int primary key,
Matricula int not null,
Nombre varchar(50) not null,
ApPaterno varchar(50) not null,
ApMaterno varchar(50) not null
);
GO


--Crear la tabla Curso
CREATE TABLE Curso(
NumCurso int primary key,
Codigo int not null,
Nombre varchar(50) not null
);
GO

--Crear la tabla Inscripcion
CREATE TABLE Inscripcion(
NumEstudiante int not null,
NumCurso int not null,
FechaInscripcion Date not null,
primary key(NumEstudiante,NumCurso),
FOREIGN KEY(NumEstudiante)
references Estudiante(NumEstudiante),
FOREIGN KEY(NumCurso)
references Curso(NumCurso)
);
GO