#Crear la base de datos vehiculos
CREATE DATABASE Vehiculos;


#Usar la base de datos
USE Vehiculos;


#Crear la tabla Cliente
CREATE TABLE Clientes(
NumCli int PRIMARY KEY,
Nombre varchar(50) not null,
ApPaterno varchar(50) not null,
ApMaterno varchar(50) not null,
CURP varchar(50) not null,
Telefono int not null
);


#Crear la tabla Vehiculo
CREATE TABLE Vehiculos(
NumVehiculo int PRIMARY KEY,
Placa varchar(50) not null,
Modelo varchar(50) not null,
Año date not null,
IdSucursal int not null,
FOREIGN KEY(IdSucursal)
REFERENCES Sucursal(IdSucursal)
);

#Crear la tabla Sucursal
CREATE TABLE Sucursal(
IdSucursal int PRIMARY KEY,
Ubicacion varchar(50) not null,
Nombre varchar(50) not null
);

#Crear la tabla Renta
CREATE TABLE Renta(
NumCli int not null,
NumVehiculo int not null,
FechaInicio date not null,
FechaTermino date not null,
PRIMARY KEY(NumCli,NumVehiculo),
FOREIGN KEY(NumCli)
REFERENCES Clientes(NumCli),
FOREIGN KEY(NumVehiculo)
REFERENCES Vehiculos(NumVehiculo)
);