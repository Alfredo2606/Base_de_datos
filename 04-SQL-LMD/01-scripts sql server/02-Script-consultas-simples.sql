--consultas simples
USE NORTHWND;
--sELECCIONAR TODOS LOS CLIENTES
SELECT * FROM Customers;

--SELECCIONAR TODOS LOS CLIENTES PERO SOLAMENTE MOSTRANDO ,
--LA CLAVE,NOMBRE DEL CLIENTE, LA CIUDAD Y EL PAIS (PROYECCION)

SELECT CustomerID,CompanyName,City,Country
FROM Customers;

--ALIAS DE COLUMNAS

SELECT CustomerID AS NumeroCliente ,CompanyName AS 'Nombre Cliente' ,City  Ciudad ,Country AS [Ciudad chida]
FROM Customers;

--Campos calculados

--Seleccionar las ordenes de compra mostrando los productos, la cantidad vendida
--precio de venta , el descuento y el total

SELECT  ProductID AS [Nombre Producto], UnitPrice as [Precio],
	Quantity as [Cantidad], Discount AS [Descuento],
	(UnitPrice* Quantity)*(1- Discount) as [IMPORTE]
FROM [Order Details]


SELECT  ProductID AS [Nombre Producto], UnitPrice as [Precio],
	Quantity as [Cantidad], Discount AS [Descuento],
	(UnitPrice* Quantity) as [Importe sin Descuento],
	
	(UnitPrice* Quantity *(1- Discount)) as [IMPORTE]
FROM [Order Details]

--SELECCIONAR LAS ORDENES DE COMPRAS MOSTRANDO  EL CLIENTE
--AL QUE SE LE VENDIO,EL EMPLEADO QUE LA REALIZO, LA FECHA DE LA ORDEN, EL TRANSPORTISTA Y 
--LA FECHA DE LA ORDEN HAY QUE DIVIDIRLA EN AÑO, MES , DIA, TRIMESTRE

SELECT OrderID AS [Numero de orden],OrderDate AS [FECHA DE ORDEN],
CustomerID AS [CLIENTE], EmployeeID
as [EMPLEADO],ShipVia AS [TRANSPORTISTA],
year(OrderDate) as [AÑO DE LA COMPRA],
MONTH (OrderDate) as [MES DE LA COMPRA],
DAY(OrderDate) AS [DIA DE LA COMPRA]
FROM Orders;

SELECT OrderID AS [Numero de orden],OrderDate AS [FECHA DE ORDEN],
CustomerID AS [CLIENTE], EmployeeID
as [EMPLEADO],ShipVia AS [TRANSPORTISTA],
DATEPART(YEAR, OrderDate) as [AÑO DE LA COMPRA],
DATEPART (mm, OrderDate) as [MES DE LA COMPRA],
DATEPART(d, OrderDate) AS [DIA DE LA COMPRA],
DATEPART(qq,OrderDate) AS [TRIMESTRE], 
DATEPART(week, OrderDate) AS [SEMANA],
DATEPART(WEEKDAY, OrderDate) AS [DIA SEMANA],
DATENAME(WEEKDAY, OrderDate) AS [NOMBRE DIA]
FROM Orders

ORDER BY 9;

--SELECCIONAR TODOS LOS PRODUCTOS QUE SU PRECIO 
--SEA MAYOR A 40.3 (MOSTRAR EL NUMERO DEL PRODUCTO,NOMBRE DEL PRODUCTO
--NUMERO DEL PRODUCTO,Y PRECIO UNITARIO)

SELECT ProductID AS [NUMERO DEL PRODUCTO],
	ProductName AS [NOMBRE DEL PRODUCTO],
	UnitPrice AS [PRECIO]
FROM Products
WHERE UnitPrice > 40.3
;
--------------------------------------------
SELECT ProductID AS [NUMERO DEL PRODUCTO],
	ProductName AS [NOMBRE DEL PRODUCTO],
	UnitPrice AS [PRECIO]
FROM Products
WHERE UnitPrice >= 40.3
;

--------------------------------------------
SELECT ProductID AS [NUMERO DEL PRODUCTO],
	ProductName AS [NOMBRE DEL PRODUCTO],
	UnitPrice AS [PRECIO]
FROM Products
WHERE ProductName = 'Carnarvon Tigers'
;

--------------------------------------------
SELECT ProductID AS [NUMERO DEL PRODUCTO],
	ProductName AS [NOMBRE DEL PRODUCTO],
	UnitPrice AS [PRECIO]
FROM Products
WHERE ProductName <> 'Carnarvon Tigers'
;
-------------------------------------------
SELECT ProductID AS [NUMERO DEL PRODUCTO],
	ProductName AS [NOMBRE DEL PRODUCTO],
	UnitPrice AS [PRECIO]
FROM Products
WHERE ProductName != 'Carnarvon Tigers'
;
------------------------------------------
SELECT ProductID AS [NUMERO DEL PRODUCTO],
	ProductName AS [NOMBRE DEL PRODUCTO],
	UnitPrice AS [PRECIO]
FROM Products
WHERE ProductName = 'Carnarvon Tigers'
;

--------------------------------------------

--SELECCIONAR TODAS LAS ORDENES QUE SEAN DE BRAZIL
---RIO DE JANEIRO MOSTRANDO SOLO EL NUMERO DE 
--ORDEN LA FECHA DE ORDEN,PAIS DE ENVIO,
--CIUDAD Y TRANSPORTISTA

SELECT  OrderID AS [NUMERO DE ORDEN],
	OrderDate AS [FECHA DE ORDEN],
	ShipCountry AS [PAIS DE ENVIO],
	ShipCity AS [CIUDAD DE ENVIO],
	ShipVia AS [TRANSPORTISTA]
	
FROM Orders

;
-----------------------------------------------
SELECT  OrderID AS [NUMERO DE ORDEN],
	OrderDate AS [FECHA DE ORDEN],
	ShipCountry AS [PAIS DE ENVIO],
	ShipCity AS [CIUDAD DE ENVIO],
	ShipVia AS [TRANSPORTISTA]
	
FROM Orders
WHERE ShipCity = 'Rio de Janeiro' and ShipCountry = 'Brazil'
;
------------------------------------------------
-- INNER JOIN
SELECT  o.OrderID AS [NUMERO DE ORDEN],
	o.OrderDate AS [FECHA DE ORDEN],
	o.ShipCountry AS [PAIS DE ENVIO],
	o.ShipCity AS [CIUDAD DE ENVIO],
	s.ShipperID AS [NUMERO DEL TRANSPORTISTA],
	s.CompanyName AS [TRANSPORTISTA]


	
FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia
WHERE ShipCity = 'Rio de Janeiro' 
;
----------------------------------------------------
--SELECCIONAR TODAS LAS ORDENES MOSTRANDO LO MISMO QUE LA CONSULTA ANTERIOR
--PERO TODAS AQUELLAR QUE NO TENGAN REGION DE ENVIO
SELECT  o.OrderID AS [NUMERO DE ORDEN],
	o.OrderDate AS [FECHA DE ORDEN],
	o.ShipCountry AS [PAIS DE ENVIO],
	o.ShipCity AS [CIUDAD DE ENVIO],
	s.ShipperID AS [NUMERO DEL TRANSPORTISTA],
	s.CompanyName AS [TRANSPORTISTA]


FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia
WHERE ShipRegion is null; 

--------------------------------------------------------
SELECT  o.OrderID AS [NUMERO DE ORDEN],
	o.OrderDate AS [FECHA DE ORDEN],
	o.ShipCountry AS [PAIS DE ENVIO],
	o.ShipCity AS [CIUDAD DE ENVIO],
	s.ShipperID AS [NUMERO DEL TRANSPORTISTA],
	s.CompanyName AS [TRANSPORTISTA]


FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia
WHERE ShipRegion is not null; 

----------------------------------------------------
--SELECCIONAR TODAS LAS ORDENES ENVIADAS A BRAZIL,ALEMANIA y MEXICO Y QUE TENGAN REGION
--ORDENAR DE FORMA DESENDENTE POR SHIP COUNTRY
SELECT  o.OrderID AS [NUMERO DE ORDEN],
	o.OrderDate AS [FECHA DE ORDEN],
	o.ShipCountry AS [PAIS DE ENVIO],
	o.ShipCity AS [CIUDAD DE ENVIO],
	s.ShipperID AS [NUMERO DEL TRANSPORTISTA],
	s.CompanyName AS [TRANSPORTISTA],
	o.ShipRegion AS [REGION]

FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia
WHERE (ShipCountry = 'Brazil' 
	OR ShipCountry = 'Alemania'
	OR ShipCountry = 'Brazil')
	and shipRegion is not null
	order by ShipRegion DESC ;
--------------------------------------------------------------

--ORDER BY -> ORDENAR LOS DATO DE FORMA ASCENDENTE Y DESENDENTE
--SELECCIONAR LOS EMPREADOS ORDENADOS POR SU PAIS
SELECT (TitleOfCourtesy + '' + FirstName + '' + LastName) AS [Nombre completo],
Country AS [PAIS], City AS [CIUDAD]
FROM Employees;
-------------------------------------------------------------
SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre completo],
Country AS [PAIS], City AS [CIUDAD]
FROM Employees;
-------------------------------------------------------------
SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre completo],
Country AS [PAIS], City AS [CIUDAD]
FROM Employees
ORDER BY Country ASC;
-------------------------------------------------------------
SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre completo],
Country AS [PAIS], City AS [CIUDAD]
FROM Employees
ORDER BY Country DESC;
-------------------------------------------------------------
SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre completo],
Country AS [PAIS], City AS [CIUDAD]
FROM Employees
ORDER BY 2 DESC;
-------------------------------------------------------------
SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre completo],
Country AS [PAIS], City AS [CIUDAD]
FROM Employees
ORDER BY CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName)  DESC;
-------------------------------------------------------------
SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre completo],
Country AS [PAIS], City AS [CIUDAD]
FROM Employees
ORDER BY [Nombre completo] DESC;
-------------------------------------------------------------
SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre completo],
Country AS [PAIS], City AS [CIUDAD]
FROM Employees
ORDER BY Country,City;
-------------------------------------------------------------
SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre completo],
Country AS [PAIS], City AS [CIUDAD]
FROM Employees
ORDER BY Country desc,City;
-------------------------------------------------------------
SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre completo],
Country AS [PAIS], City AS [CIUDAD]
FROM Employees
ORDER BY Country desc,City desc;
-------------------------------------------------------------
SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre completo],
Country AS [PAIS], City AS [CIUDAD]
FROM Employees
ORDER BY 2 desc,3 desc;
-------------------------------------------------------------
SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre completo],
Country AS [PAIS], City AS [CIUDAD]
FROM Employees
ORDER BY 1 asc,Country desc,3 desc;

---------------------------------------------------------------------------------------------------
--CAMBIAR DE BD
USE BDEJEMPLO2;
--SELECCIONAR CUANTOS PUESTOS TIENEN LOS REPRESENTANTES
select DISTINCT Puesto
FROM Representantes;
-------------------------------------------------------------------
--SELECCIONAR TODOS LOS PAISES DIFERENTES DE MIS CLIENTES
SELECT DISTINCT  country, city
FROM customers;
-------------------------------------------------------------------
SELECT  country, city, companyName
FROM customers
order by 1 asc
;
-------------------------------------------------------------------
SELECT  country, city, companyName
FROM customers
where city = 'buenos aires';

----------------------------------------------------------
--CUANTOS PUESTOS DIFERENTES TIENEN LOS REPRESENTANTES 
SELECT COUNT (DISTINCT  Puesto) AS [Nombre de puesto]
FROM Representantes;
-------------------------------------------------------------------
--SELECCIONAR EL PRECIO MINIMO DE LOS PRODUCTOS
SELECT  MIN (precio) as [precio minimo]
FROM Productos;
-------------------------------------------------------------------
--LISTAR LAS OFICINAS QUE ESTAN POR DE BAJO DEL 80% DE SUS OBJETIVOS
SELECT Ciudad,Ventas,Objetivo,(8 * Objetivo) AS [80% DEL Objetivo]
FROM Oficinas
where Ventas <(.8 * Objetivo)
;
-------------------------------------------------------------------
--SELECCIONAR LOS 3 PRIMEROS REGISTRIOS DE MIS PEDIDOS
SELECT TOP 5 Num_Pedido, Fecha_Pedido,Producto,Cantidad, Importe
FROM Pedidos
order by 5 desc
;
-------------------------------------------------------------------
--TEST DE RANGO (BETWEEN)
--HALLAR LOS PEDIDOS DEL ULTIMO TRIMESTRE DE 1989
SELECT Num_Pedido,Fecha_Pedido,Fab,Producto,Importe
from Pedidos
WHERE Fecha_Pedido >='1989-10-01' and Fecha_Pedido <= '1989-12-31'
order by Fecha_Pedido desc;
------------------------------------------------------------------
SELECT Num_Pedido,Fecha_Pedido,Fab,Producto,Importe
from Pedidos
WHERE Fecha_Pedido between '1989-10-01' and  '1989-12-31'
order by Fecha_Pedido desc;
------------------------------------------------------------------
SELECT Num_Pedido,Fecha_Pedido,Fab,Producto,Importe
from Pedidos
WHERE DATEPART(QUARTER, Fecha_Pedido) = 4
order by Fecha_Pedido desc;
-------------------------------------------------------------------
--hallar los pedidios que tienen un importa entre 30000 y 39999.99

SELECT Num_Pedido,Fecha_Pedido,Fab,Producto,Importe
from Pedidos
WHERE Importe between '30000' and  '39999.99'
order by Importe desc;
------------------------------------------------------------------
SELECT Num_Pedido,Fecha_Pedido,Fab,Producto,Importe
from Pedidos
WHERE importe >='30000' and Importe <= '39999.99'
order by importe desc;
------------------------------------------------------------------
SELECT Num_Empl,Nombre,Puesto,Cuota,Ventas
from  Representantes
WHERE ventas not between (cuota * .8) and (cuota * 1.2);
----------------------------------------------------------------------
SELECT Num_Empl,Nombre,Puesto,Cuota,Ventas
from  Representantes
WHERE NOT (ventas>=(cuota * .8)AND ventas <= (cuota * 1.2));

----------------------------------------------------------------------
--HALLAR LOS PEDIDOS DE CUATRO REPRESENTANTES DE CUATRO PEDIDOS

SELECT Num_Pedido,Fecha_Pedido,Importe, rep
from pedidos
Where REP IN (107,109,101,103);
----------------------------------------------------------------------

SELECT Num_Pedido,Fecha_Pedido,Importe, rep
from pedidos
Where REP = 107 OR
	REP = 109 OR
	REP = 101 OR 
	REP = 103;
----------------------------------------------------------------------

--TEST DE ENCAJE DE PATRONES (LIKE)
SELECT *
FROM Clientes
where Empresa like 'Ac%';
----------------------------------------------------------------------
SELECT *
FROM Clientes
where Empresa like '%L';
----------------------------------------------------------------------
SELECT *
FROM Clientes
where Empresa like '%er%';
----------------------------------------------------------------------
SELECT *
FROM Clientes
WHERE Empresa LIKE '[A-D]%';

SELECT *
FROM Clientes
WHERE Empresa LIKE '[ADf]%';

SELECT *
FROM Clientes
WHERE Empresa LIKE '_ilas';

SELECT *
FROM Clientes
WHERE Empresa LIKE '____';

SELECT *
FROM Clientes
WHERE Empresa LIKE '_____';

 SELECT *
FROM Clientes
WHERE Empresa LIKE '[^ADf]%';

-------------------------------------------------------
--HALLAR TODOS LO REPRESENTANTATES DE  QUE O BIEN:
--A)TRABAJAN EN DAIMIEL,NAVARRA,O CASTELLON O BIEN 
--B)NO TIENEN JEFE Y ESTAN CONTRATADOS DESDE JUNIO A 1988; O 
--C)SUPERAN SU CUOTA PERO TIENEN VENTAS DE 600000 O MENOS;
select  Nombre,Fecha_Contrato,Puesto
from Representantes
WHERE Oficina_Rep IN (11,12,22) OR
		Jefe IS NULL AND Fecha_Contrato >= '1988-06-01' OR
		Ventas > Cuota AND Ventas <= 600000;

---------------------------------------------------------------
SELECT R.Num_Empl AS [NUMERO DE EMPLEADO],
		R.Nombre AS [NOMBRE EMPLEADO],
		R.Fecha_Contrato AS [FECHA DE CONTRATO],
		R.Cuota AS [CUOTA VENTAS],
		R.Ventas AS [VENTAS TOTALES],
		O.Ciudad AS [CIUDAD DE LA OFICINA]
FROM Representantes AS R
INNER JOIN Oficinas AS O
ON O.Oficina = R.Oficina_Rep
WHERE O.Ciudad IN ('Daimiel','Navarra','Castellón') OR
		Jefe IS NULL AND Fecha_Contrato >= '1988-06-01' OR
		R.Ventas > Cuota AND R.Ventas <= 600000;
;
------------------------------------------------------------------
SELECT R.Num_Empl AS [NUMERO DE EMPLEADO],
		R.Nombre AS [NOMBRE EMPLEADO],
		R.Fecha_Contrato AS [FECHA DE CONTRATO],
		R.Cuota AS [CUOTA VENTAS],
		R.Ventas AS [VENTAS TOTALES],
		O.Ciudad AS [CIUDAD DE LA OFICINA],
		R.Jefe AS [NUMERO DE JEFE]
FROM Representantes AS R
INNER JOIN Oficinas AS O
ON O.Oficina = R.Oficina_Rep
WHERE O.Ciudad IN ('Daimiel','Navarra','Castellón') OR
		Jefe IS NULL AND Fecha_Contrato >= '1988-06-01' OR
		R.Ventas > Cuota AND R.Ventas <= 600000;
;