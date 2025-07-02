```sql
--Lenguaje SQL-LDD (create ,alter, drop)
--Crear base de datos empresa

CREATE DATABASE empresa;
Go

--Utilizar la base de datos creada
USE empresa;
Go

--Crear la tabla empleados
CREATE TABLE Empleados(
IdEmpleado int not null,
Nombre varchar(100) not null,
Puesto varchar(50) not null,
FechaIngreso date,
Salario money not null,
CONSTRAINT pk_empleados
PRIMARY KEY (IdEmpleado)
);
Go

CREATE TABLE Productos(
ProductoId int primary key,
NombreProducto nvarchar(50) not null,
Existencia int not null,
PrecioUnitario money not null

);
Go


CREATE TABLE Productos2(
	ProductoId INT not null IDENTITY(1,1),
	NombreProducto NVARCHAR(50) not null,
	Existencia INT not null,
	Precio MONEY not null,
	CONSTRAINT pk_productos2
	PRIMARY KEY(ProductoId),
	CONSTRAINT unique_nombreproducto
	UNIQUE(NombreProducto),
	CONSTRAINT chkexistencia
	CHECK (Existencia > 0 AND Existencia <= 1000),
	CONSTRAINT chk_precio
	CHECK (Precio>0.0)

);
GO
 

 --insertar un producto
 INSERT INTO Productos(ProductoId,
NombreProducto ,Existencia ,PrecioUnitario)


VALUES(1,'Burritos de frijoles',65,20.99);
GO

 INSERT INTO Productos2(NombreProducto ,Existencia ,Precio)

VALUES('Burritos de chorizo verde',100,21.0);
GO

INSERT INTO Productos2(NombreProducto ,Existencia ,Precio)
VALUES('Burritos de chorizo grueso',450,459.12);
GO
INSERT INTO Productos2(NombreProducto ,Existencia ,Precio)
VALUES('Burritos de chorizo grueso2',450,459.12);
GO


INSERT INTO Productos2(NombreProducto ,Existencia ,Precio)
VALUES('Burritos de frijol ',999,60);
GO


SELECT * FROM Productos2
Go

```
