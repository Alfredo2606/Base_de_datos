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
