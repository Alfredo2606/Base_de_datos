--CREAMOS LA BASE DE DATOS
CREATE DATABASE TEACHES;
---USAMOS LA BD
 USE TEACHES;

 --CREAMOS TABLAS INTRUCTOR
 CREATE TABLE Instructor(
 
 SSN INT  PRIMARY KEY,
 LName varchar(50) not null,
 FName varchar (50) not null
 
 );


 ---CREAMOS TABLA CLASS
 CREATE TABLE Class(
 CourseNum int,
 year int ,
 Term int,
 Seccion int,
 CONSTRAINT primaryKey_Class
PRIMARY KEY (CourseNum,year, Term, Seccion)
 
 );


 --CREAMOS TABLA  TEAHES
 CREATE TABLE TEACHES(
  SSN INT,
 CourseNum int,
 year int,
 Term int,
 Seccion int,
 CONSTRAINT fk_intructor
 FOREIGN KEY (SSN )
 REFERENCES Instructor  (SSN),
 CONSTRAINT fk_Class
 FOREIGN KEY (CourseNum,year, Term, Seccion)
 REFERENCES Class (CourseNum,year, Term, Seccion)
 
 );

 