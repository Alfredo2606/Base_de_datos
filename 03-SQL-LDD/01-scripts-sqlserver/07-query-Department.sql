--Crear la base de datos Department
CREATE DATABASE Department;
GO

--Usar la base de datos
USE Department;
GO


-- Tabla DEPARTMENT
CREATE TABLE Department (
    DepartmentId     INT PRIMARY KEY,
    numDepto         INT,
    NameDepto        NVARCHAR(20),
    Manager          NVARCHAR(15),
    StartDate        DATE
);

-- Tabla EMPLOYEE
CREATE TABLE Employee (
    EmployeeId       INT PRIMARY KEY,
    ssn              NVARCHAR(10),
    FirstName        NVARCHAR(50),
    LastName         NVARCHAR(50),
    Salary           INT,
    Birthdate        DATE,
    Sex              NVARCHAR(15),
    DepartmentId     INT,
    FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId)
);

-- Tabla DEPENDENT
CREATE TABLE Dependent (
    Name             NVARCHAR(30),
    EmployeeId       INT,
    Sex              NVARCHAR(15),
    Birthdate        DATE,
    Relationship     NVARCHAR(30),
    PRIMARY KEY (Name, EmployeeId),
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId)
);

-- Tabla PROJECT
CREATE TABLE Project (
    ProjectId        INT PRIMARY KEY,
    nameProject      NVARCHAR(50),
    numberProject    INT,
    Location         NVARCHAR(30),
    DepartmentId     INT,
    FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId)
);

-- Tabla WORK-ON (relación N:M entre Employee y Project)
CREATE TABLE WorkOn (
    EmployeeId       INT,
    ProjectId        INT,
    PRIMARY KEY (EmployeeId, ProjectId),
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId),
    FOREIGN KEY (ProjectId) REFERENCES Project(ProjectId)
);

-- Tabla LOCATIONS (ubicaciones de los departamentos)
CREATE TABLE Locations (
    LocationId       INT PRIMARY KEY,
    Location         NVARCHAR(30),
    DepartmentId     INT,
    FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId)
);
