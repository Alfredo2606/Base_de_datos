-- CREAR EMPRESA PATITO
CREATE DATABASE empresapatito;
go
--usar la base de datos
use empresapatito;
go

--crear tabla empleados
CREATE TABLE empleados(
Idempleado INT  not null,
Nombre VARCHAR (100) not null,
Puesto Varchar (50),
FechaIngreso DATE,
Salario DECIMAL (10,2),
CONSTRAINT pk_empleados
PRIMARY KEY (Idempleado)
);
GO



--Agregar una columna en la tabla empleados
ALTER TABLE empleados
ADD CorreoElectronico VARCHAR (100);
GO

--Modificar el tipo de dato de un campo
ALTER TABLE empleados
ALTER COLUMN Salario MONEY not null;
GO

--Renombrar un campo
EXEC sp_rename'empleados.CorreoElectronico', 'Email','COLUMN';
GO

--Crear tabla departamentos
CREATE TABLE departamentos(
IdDepartamento int not null identity(1,1) primary key,
NombreDepto varchar(100)
);
GO

--Agregar un campo a la tabla empleados,
--para que sea una foreign key
ALTER TABLE empleados
ADD IdDepartamento int not null;
go

--Agregar llave foranea
ALTER TABLE empleados  
ADD CONSTRAINT fk_empleados_departamentos
FOREIGN KEY(IdDepartamento)
REFERENCES departamentos(IdDepartamento);
GO
--Eliminar la clave primaria de empleados
ALTER TABLE empleados 
DROP CONSTRAINT pk_empleados;
GO

---Eliminar la foregin key de la tabla empleados
ALTER TABLE empleados
DROP CONSTRAINT  fk_empleados_departamentos;

--ELININAR LA PK DE DEPARTAMENTOS
ALTER TABLE departamentos
DROP CONSTRAINT PK__departam__787A433DB4AA04B9;


--CREAR UN CONSTRAINT DE VERIFICACION
--EN SALARIO
ALTER TABLE empleados
ADD CONSTRAINT chk_Salario
CHECK (Salario > 0.0);
GO



CREATE TABLE categoria(
Id int not null primary key DEFAULT -1 ,
Nombre varchar(20),
estatus char(1) default 'A'
);
Go
INSERT INTO categoria
VALUES (1,'Carnes','D');

INSERT INTO categoria
VALUES (DEFAULT,'Carnes',DEFAULT);


---ELIMINAR LA COLUMNA EMAIL

ALTER TABLE   empleados
DROP COLUMN email;


--AGREGAR CONSTRAINT 
ALTER TABLE empleados
ADD CONSTRAINT pk_empleados
PRIMARY KEY  (Idempleado);
GO

ALTER TABLE departamentos
ADD CONSTRAINT pk_departamentos
PRIMARY KEY  (IdDepartamento);
GO



--ELININAR TABLA

DROP TABLE empleados
DROP TABLE departamentos
DROP TABLE categoria
use master;
go
--ELIMINAR BASE DE DATOS
DROP DATABASE empresapatito;
go


SELECT * FROM empleados;
SELECT * FROM categoria;