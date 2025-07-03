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

--crear dos tablas con razon de cardinalidad de 1:N con participacion total, 
--esto quiere decir que la foreing key es not null
CREATE TABLE categoria (
categoriaId int not null identity (1,2),
NombreCategoria nvarchar (20) not null,
CONSTRAINT pk_categoria 
PRIMARY KEY (categoriaId),
CONSTRAINT unique_nombrecategoria
UNIQUE (NombreCategoria)
);
GO

CREATE TABLE productos3(
ProductoId int not null identity(1,1),
NombreProducto nvarchar (20) not null,
Existencia int not null,
PrecioUnitario  money not null,
categoriaId  int not null,
CONSTRAINT pk_productos3
PRIMARY KEY (ProductoId),
CONSTRAINT chk_existencia3 
CHECK (Existencia >0 and Existencia <=1000),
CONSTRAINT chk_preciounitario
CHECK(PrecioUnitario>0),
CONSTRAINT unique_nombreproducto3
UNIQUE(NombreProducto),
CONSTRAINT fk_Productos3_categoria
FOREIGN KEY (CategoriaId)
REFERENCES categoria (CategoriaId)
);
GO
----------
CREATE TABLE categoria2 (
Id int not null identity (1,2),
NombreCategoria nvarchar (20) not null,
CONSTRAINT pk_categoria2
PRIMARY KEY (Id),
CONSTRAINT unique_nombrecategoria2
UNIQUE (NombreCategoria)
);
GO

CREATE TABLE productos4(
ProductoId int not null identity(1,1),
NombreProducto nvarchar (20) not null,
Existencia int not null,
PrecioUnitario  money not null,
categoriaId  int not null,
CONSTRAINT pk_productos4
PRIMARY KEY (ProductoId),
CONSTRAINT chk_existencia4
CHECK (Existencia >0 and Existencia <=1000),
CONSTRAINT chk_preciounitario4
CHECK(PrecioUnitario>0),
CONSTRAINT unique_nombreproducto4
UNIQUE(NombreProducto),
CONSTRAINT fk_Productos4_categoria
FOREIGN KEY (CategoriaId)
REFERENCES categoria2 (Id)
);
GO
------------ PK COMPUESTA
CREATE TABLE tabla1(
Tabla1Id  int not null identity(1,2),
Tabla1Id2 int not null ,
Nombre nvarchar (20) not null,
CONSTRAINT pk_tabla1
PRIMARY KEY (Tabla1Id , Tabla1Id2),
);
go

CREATE TABLE tabla2(
IdTabla2 int not null identity (1,1),
nombre nvarchar (20),
Tabla1Id int,
Tabla1Id2 int,
CONSTRAINT pk_tabla2
PRIMARY KEY (IdTabla2),
CONSTRAINT fk_tabla2_tabla1
FOREIGN KEY (Tabla1Id , Tabla1Id2)
REFERENCES tabla1(Tabla1Id , Tabla1Id2)
);
GO

---CREAR TABLA CON UNA RAZON DE CARDINALIDAD 1:1
CREATE TABLE employee (
id int not null identity (1,1),
nombre nvarchar (20) not null,
ap1 nvarchar (20) not null,
ap2 nvarchar (20) not null,
sex char (1) not null,
salario money not null,
CONSTRAINT pk_employee
PRIMARY KEY (id)
);
go

CREATE TABLE departement
(id int not null identity(1,1),
Nombre nvarchar (20) not null,
ubicacion nvarchar (20) not null,
employeeId int not null,
CONSTRAINT pk_depertement
PRIMARY KEY (id),
CONSTRAINT fk_departament_employee
FOREIGN KEY(employeeId)
REFERENCES employee(id),
CONSTRAINT unique_employeeId
UNIQUE (employeeId)
);
GO
```
