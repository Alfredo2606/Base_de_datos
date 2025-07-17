--Crear base de datos Doctores
CREATE DATABASE Doctores;
GO

--Usar la base de datos 
USE Doctores;
GO

--Crear la tabla Doctor
CREATE TABLE Doctor(
IdDoctor int primary key,
Nombre varchar(50) not null,
ApPaterno varchar(50) not null,
ApMaterno varchar(50) not null,
Especialidad varchar(50) not null
);
GO

--Crear la tabla Paciente
CREATE TABLE Paciente(
IdPaciente int primary key,
Nombre varchar(50) not null,
ApPaterno varchar(50) not null,
ApMaterno varchar(50) not null,
Enfermedad varchar(50) not null
);
GO

--Crear la tabla Atiende
CREATE TABLE Atiende(
IdDoctor int not null,
IdPaciente int not null,
FechaAtiende date not null,
PRIMARY KEY(IdDoctor,IdPaciente),
FOREIGN KEY(IdDoctor)
REFERENCES Doctor(IdDoctor),
FOREIGN KEY(IdPaciente)
REFERENCES Paciente(IdPaciente)
);
GO