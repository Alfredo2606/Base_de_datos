CREATE DATABASE ejercicio1999;
go

USE ejercicio1999;
go

CREATE TABLE Empleado(
EmpleadoID int not null identity (1,1),
Nombre varchar (15) not null,
Apellido1 varchar(15) not null,
Apellido2 varchar (15)null,
Direccion varchar(50) not null,
Salario Decimal (10,2) not null,
Jefe int, 
Departamento int not null,
CONSTRAINT pk_empleado
PRIMARY KEY (EmpleadoID),
CONSTRAINT chk_salario
CHECK (Salario between 200 and 500000),
CONSTRAINT fk_empleado_jefe
FOREIGN KEY (Jefe)
REFERENCES Empleado(EmpleadoID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
go

CREATE TABLE Departamento (
DepartamentoID int not null identity (1,1),
NombreDepto varchar(15) not null,
Estatus char (2) not null,
Administrador int not null
CONSTRAINT pk_departamento
PRIMARY KEY (DepartamentoID),
CONSTRAINT unique_NombreDepto
UNIQUE (NombreDepto),
CONSTRAINT chk_Estatus
CHECK (Estatus IN ('SI', 'NO')),
CONSTRAINT fk_Empleado_Departamento
FOREIGN KEY (Administrador)
REFERENCES Empleado(EmpleadoID)
);
go

ALTER TABLE Empleado
ADD CONSTRAINT fk_Empleado_Derpartamento1
FOREIGN KEY (Departamento)
REFERENCES Departamento(DepartamentoID);
GO

CREATE TABLE Ubicacion(
UbicacionID int not null identity (1,1),
Ubicacion varchar (15) not null,
DeptoID int not null,
CONSTRAINT pk_ubicaion
PRIMARY KEY (UbicacionID),
CONSTRAINT unique_deptoid
UNIQUE (DeptoID),
CONSTRAINT fk_ubicacion_depto
FOREIGN KEY (DeptoID)
REFERENCES Departamento (DepartamentoID)


);
