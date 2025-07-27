#crear base de datos de rh
CREATE DATABASE RHumanos;
Use RHumanos;

#Crear Tabla Usuario
CREATE TABLE Usuarios (
IdUsuario INT NOT NULL,
IdEmpleado INT NOT NULL,
Usuario varchar(50) NOT NULL,
ContraseñaHash varchar(255) NOT NULL,
Rol varchar (20) NOT NULL,
CONSTRAINT uni_usuario
UNIQUE (Usuario),
CONSTRAINT chk_Rol
CHECK (Rol IN ('Admin', 'RRHH', 'Consulta'))
);

#Crear Tabla Departmentos
CREATE TABLE Departamentos(
IdDepartamento INT NOT NULL,
Nombre varchar(100) not null,
CONSTRAINT Uni_Nombre
UNIQUE (Nombre)
);

#Crear Tabla Puestos 
CREATE TABLE Puestos(
IdPuesto INT NOT NULL,
Nombre varchar(100) not null,
SueldoBase decimal(10,2) not null,
constraint uni_Nombre
UNIQUE(Nombre),
CONSTRAINT chk_SueldoB
CHECK (SueldoBase > 0)
);

#CREAR TABLA Empleados
CREATE TABLE Empleados(
IdEmpleado int  not null,
Nombre varchar(100) not null,
ApellidoPaterno Varchar(100) not null,
ApellidoMaterno varchar (100) null,
CURP char(18) not null,
FechaNacimiento date not null,
FechaIngreso date not null,
IdDepartamento int not null,
IdPuesto int not null,
Genero char(1) null,
EstadoEmpleado varchar(20)
);

#Crear Tabla Asistencias
CREATE TABLE Asistencia(
IdAsistencia int not null,
IdEmpleado int not null,
Fecha date not null,
HoraEntrada date  null,
HoraSali date  not null
);




