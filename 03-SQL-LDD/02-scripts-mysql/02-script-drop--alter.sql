##CREAR EMPRESA PATITO
CREATE DATABASE empresapatito;

##usar la base de datos
use empresapatito;


##crear tabla empleados
CREATE TABLE empleados(
Idempleado INT  not null,
Nombre VARCHAR (100) not null,
Puesto Varchar (50),
FechaIngreso DATE,
Salario DECIMAL (10,2),
CONSTRAINT pk_empleados
PRIMARY KEY (Idempleado)
);




##Agregar una columna en la tabla empleados
ALTER TABLE empleados
ADD COLUMN CorreoElectronico VARCHAR (100);


##Modificar el tipo de dato de un campo
ALTER TABLE empleados
MODIFY COLUMN Salario 
DECIMAL (12,2)not null;


##Renombrar un campo
ALTER TABLE empleados 
RENAME COLUMN CorreoElectronico TO Email;


##Crear tabla departamentos
CREATE TABLE departamentos(
IdDepartamento int not null auto_increment primary key,
NombreDepto varchar(100)
);


##Agregar un campo a la tabla empleados,
##para que sea una foreign key
ALTER TABLE empleados
ADD COLUMN IdDepartamento int not null;


##Agregar llave foranea
ALTER TABLE empleados  
ADD CONSTRAINT fk_empleados_departamentos
FOREIGN KEY(IdDepartamento)
REFERENCES departamentos(IdDepartamento);


##Eliminar la clave primaria de empleados

ALTER TABLE empleados 
DROP PRIMARY KEY;



##Eliminar la foregin key de la tabla empleados

ALTER TABLE empleados
DROP FOREIGN KEY fk_empleados_departamentos;

##ELIMINAR EL AUTO INCREMENT
ALTER TABLE departamentos 
MODIFY COLUMN IdDepartamento INT NOT NULL;


##ELININAR LA PK DE DEPARTAMENTOS
ALTER TABLE departamentos
DROP PRIMARY KEY;


##CREAR UN CONSTRAINT DE VERIFICACION
##EN SALARIO
ALTER TABLE empleados
ADD CONSTRAINT chk_Salario
CHECK (Salario > 0.0);




CREATE TABLE categoria(
Id int not null primary key DEFAULT -1 ,
Nombre varchar(20),
estatus char(1) default 'A'
);

INSERT INTO categoria
VALUES (1,'Carnes','D');

INSERT INTO categoria
VALUES (DEFAULT,'Carnes',DEFAULT);


##ELIMINAR LA COLUMNA EMAIL

ALTER TABLE   empleados
DROP COLUMN email;


##AGREGAR CONSTRAINT 
ALTER TABLE empleados
ADD CONSTRAINT pk_empleados
PRIMARY KEY  (Idempleado);


ALTER TABLE departamentos
ADD CONSTRAINT pk_departamentos
PRIMARY KEY  (IdDepartamento);




##ELININAR TABLA

DROP TABLE empleados
DROP TABLE departamentos
DROP TABLE categoria


##ELIMINAR BASE DE DATOS
DROP DATABASE empresapatito;


