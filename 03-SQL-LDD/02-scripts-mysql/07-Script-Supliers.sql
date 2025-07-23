#CREAR BASE DE DATOS
CREATE DATABASE Suppliers;

#USAR LA BD CREADA
USE Suppliers;


#CREAR LA TABLA SUPLIERS
CREATE TABLE Suppliers(
SupplierID int primary key,
fax int not null,
Address Varchar(50) not null,
HomPage Varchar(50) null,
City Varchar(50) not null,
Region Varchar(30) not null,
CompanyName varchar(50)not null
);


#CREAR TABLA MULTIVALOR CONTACT
CREATE TABLE Contac(
ContacID int primary key,
SupplierID int not null,
contacs int  null,
FOREIGN KEY (SupplierID)
REFERENCES Suppliers(SupplierID)
);

#CREAR TABLA PRODUCS
CREATE TABLE Producs(
ProductID int PRIMARY KEY,
QuantlyPerUnit int not null,
UnitPrice numeric not null,
UnitStock int not null,
CategoriID int not null,
SupplierID int not null,
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
FOREIGN KEY (CategoriID) REFERENCES Categories(CategoriID)

);

#CREAR TABLA CATEGORIES
CREATE TABLE Categories(
CategoriID int PRIMARY KEY,
CategoryName varchar(50) not null,
Descripcion varchar (100) null
);


#CREAR TABLA DETAILS
CREATE TABLE Details(
ProductID int not null,
OrderID int not null,
Quanty numeric null,
UnitPrice numeric null,
Discount int null,
PRIMARY KEY(ProductID,OrderID ),
FOREIGN KEY (ProductID)
REFERENCES Producs (ProductID),
FOREIGN KEY (OrderID) 
REFERENCES Orders(OrderID)
);


#CREAR TABLA ORDERS 
CREATE TABLE Orders(
OrderID int PRIMARY KEY,
ShipRegion varchar(50) not null,
Code  varchar(50)not null,
RequireDate DATE null,
OrderDate date null,
Region varchar(50)

);

#CREAR TABLA EMPLOYEES
CREATE TABLE Employees (
EmployeeID int PRIMARY KEY,
FirsName VARCHAR(50) not null,
LastName VARCHAR(50) not null,
BirthDate Date null,
City varchar(50) null
);

#AGREGAR CAMPO 
ALTER TABLE Orders
add EmployeeID int not null;

#AGREGAR FOREIGN KEY DE EMPLOYEES A ORDERS

ALTER TABLE Orders
ADD CONSTRAINT fk_Orders_Employees
FOREIGN KEY(EmployeeID )
REFERENCES Employees (EmployeeID );

#crear tabla CUSTOMERS
CREATE TABLE Customers(
CustomersID int PRIMARY KEY,
City varchar (50)  null,
Region varchar(50) null,
Phone varchar (12) null,
CompanyName varchar(50) not null
);


#crear tabla multivalor de contactname
CREATE TABLE ContacName(
ContacNameID int PRIMARY KEY,
CustomersID int not null,
ContacName nVarchar(12) null,
FOREIGN KEY (CustomersID)
REFERENCES Customers (CustomersID)
);

#AGREGAR CAMPO A LA TABLA ORDERS Y PK
ALTER TABLE Orders
add CustomersID int not null;


#asignar PK
ALTER TABLE Orders
ADD CONSTRAINT fk_Orders_Customers
FOREIGN KEY (CustomersID)
REFERENCES Customers(CustomersID);


#CREAR TABLA ADDRESS 
CREATE TABLE Address(
AdressID int PRIMARY KEY,
City varchar(50) null,
AddressLine1 varchar(50) not null,
AddressLine2 varchar(50) not null,
PostalCode int null,
CustomersID int not null,
FOREIGN KEY (CustomersID)
REFERENCES Customers(CustomersID)
);


#CREAR TABLA SHIPPERS

CREATE TABLE Shippers(
ShipperID int PRIMARY KEY,
CompanyName varchar(50) null
);

#crear tabla multivalor de phone
CREATE TABLE Phone(
PhoneID int PRIMARY KEY,
ShipperID int not null,
Phone  varchar(50),
FOREIGN KEY (ShipperID)
REFERENCES Shippers(ShipperID)
);


#agregar FK A LA TABLA ORDERS
ALTER TABLE Orders
ADD ShipperID int not null;


#asignarla como FK
ALTER TABLE Orders 
ADD CONSTRAINT fk_Orders_Shippers
FOREIGN KEY (ShipperID)
REFERENCES ShipperS(ShipperID);
