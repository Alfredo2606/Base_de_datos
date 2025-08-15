--- CONSULTAS AVANZADAS
--HALLAR TODOS LO REPRESENTANTATES DE  QUE O BIEN:
--A)TRABAJAN EN DAIMIEL,NAVARRA,O CASTELLON O BIEN 
--B)NO TIENEN JEFE Y ESTAN CONTRATADOS DESDE JUNIO A 1988; O 
--C)SUPERAN SU CUOTA PERO TIENEN VENTAS DE 600000 O MENOS;
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

--LISTAR TODOS LOS PEDIDOS, MOSTRANDO EL NUMERO DE PEDIDO
--SU IMPORTE Y EL NOMBRE Y LIMITE DE CREDITO DEL CLIENTE
SELECT P.Num_Pedido AS [NUMERO DE PEDIDO],
		P.Importe AS[IMPORTE DEL PEDIDO],
		C.Empresa AS [NOMBRE DEL CLIENTE],
		C.Limite_Credito
		
FROM Clientes AS C
INNER JOIN Pedidos AS P
ON C.Num_Cli = P.Cliente


--LISTAR LAS OFICINAS CON UN OBJETIVO SUPERIOR A 600000
--MOSTRANDO EL NOMBRE DE LA CIUDAD, EL NOMBRE DEL REPRESENTANTE
--Y SU PUESTO

SELECT O.Ciudad AS [OFICIONA],
		R.Nombre [REPRESENTANTE],
		R.Puesto [PUESTO], O.Objetivo AS [OBJETICO DE VENTAS]
FROM Oficinas  AS O
INNER JOIN Representantes AS R
ON O.Jef = R.Num_Empl
WHERE O.Objetivo > 600000
;

--LISTAR TODOS LOS PEDIDOS MOSTRANDO EL NUMERO DE PEDIDO 
--EL IMPORTE , EL NOMBRE Y EL LIMITE DEL CLIENTE

SELECT pe.Num_Pedido AS [NUMERO PEDIDO],
		pe.Importe as [IMPORTE],
		clien.Empresa as [Cliente],
		clien.Limite_Credito as [LIMITE DE CREDITO]
FROM Pedidos as [pe]
INNER JOIN Clientes as [clien]
on pe.Cliente =clien.Num_Cli;


SELECT *
FROM Pedidos as [pe]
INNER JOIN Clientes as [clien]
on pe.Cliente =clien.Num_Cli;


--LISTAR CADA REPRESENTANTE MOSTRANDO SU NOMBRE ,LA CIUDAD
--Y LA REGION EN QUE TRABAJAN
SELECT r.Nombre AS [Representante],
		o.Ciudad as [OFICINA],
		o.Region AS [REGION]
FROM Representantes as r
inner join Oficinas as o
on r.Oficina_Rep = o.Oficina;

--LISTAR LAS OFICINAS (CIUDAD), NOMBRES Y PUESTOS DE SUS JEFES 
SELECT r.Nombre AS [Representante],
		o.Ciudad as [OFICINA],
		o.Region AS [REGION]
FROM Representantes as r
inner join Oficinas as o
on r.Num_Empl  = o.jef;

--listar los pedidos mostrando el umero de pedido el importe y la cantidad de cada producto
SELECT p.Num_Pedido as [Numero de pedido],
	p.Importe as [importe],
	pr.Descripcion AS [DESCRIPCION],
	pr.Stock AS [CANTIDAD]
FROM Pedidos as p
inner join Productos as pr
on pr.Id_fab = p.Fab
AND pr.Id_producto = p.Producto;
--
SELECT E.Nombre AS [ EMPLEADO] , J.Nombre AS [JEFE]
FROM Representantes AS J
INNER JOIN Representantes AS E
ON J.Num_Empl = E.Jefe;

--LISTAR LOS PEDIDOS CON UN IMPORTE SUPERIOR A 25000
--INCLUYENDO EÑ NUMERO DE PEDIDIO,EL IMPORTE , EL NOMBRE DEL REPRESENTANTE
--QUE TOMO NOTA DEL PEDIDO Y EL NOMBRE DEL CLIENTE 

Select p.Num_Pedido, p.Importe, r.Nombre, c.Empresa
From Pedidos AS p
INNER JOIN Representantes AS r
ON r.Num_Empl = p.Rep
INNER JOIN Clientes AS c
ON c.Num_Cli = p.Cliente
WHERE p.Importe > 25000;

--Listar los pedidos superiores a 25000 mostrando el numero de pedido, el nombre del cliente que lo encargo 
--y el nombre del representante asignado al cliente, y el importe

SELECT p.Num_Pedido AS [Número de Pedido],
	   c.Empresa AS [Cliente],
	   r.Nombre AS [Representante Cliente],
	   p.Importe AS [Importe]
FROM Representantes AS r
INNER JOIN Clientes AS c
ON r.Num_Empl = c.Rep_Cli
INNER JOIN Pedidos AS p
ON c.Num_Cli = p.Cliente
WHERE importe>25000
;

use BDG1JOINS;
SELECT *
FROM Categoría;
SELECT *
FROM Producto;

/*
INNER JOIN
*/
SELECT *
FROM Categoría AS C
JOIN Producto AS p
ON c.categoriaId = p.categoria;


/*
LEFT JOIN o LEFT OUTER JOIN

La primera tabla que aparece en la lista es la tabla izquierda 
*/
SELECT *
FROM Categoría AS C
LEFT JOIN Producto AS p
ON c.categoriaId = p.categoria;

--Mostrar todas las categorías que no tengas productos asignados
SELECT *
FROM Categoría AS C
LEFT JOIN Producto AS p
ON c.categoriaId = p.categoria
WHERE p.categoria is null
;


/*
RIGHT JOIN 
Toma todos los datos de la tabla derecha y los que coinciden con la tabla izquierda, y los que no coinciden los pone en null
*/

SELECT *
FROM Categoría AS c
RIGHT JOIN Producto AS p
ON c.categoriaId = p.categoria;

--Selecciona todos aquellos productos que no tienen categoría asignada
SELECT p.nombre AS [Nombre del producto],
	   p.precio AS [Precio]
FROM Categoría AS c
RIGHT JOIN Producto AS p
ON c.categoriaId = p.categoria
WHERE categoria is null
;


/*
FULL JOIN 
Obtiene los datos de la tabla izquierda, los datos de la tabla derecha y todas las coincidencias entre las dos
*/
SELECT *
FROM Categoría AS C
FULL JOIN Producto AS p
ON c.categoriaId = p.categoria;


SELECT *
FROM Categoría AS C
CROSS JOIN Producto AS p;


SELECT *
From Categoría AS c,
Producto AS p
WHERE c.categoriaId = p.categoria;


/*
Agregación

count(*) - Cuenta las filas,
count(campo) - Cuenta las filas pero no cuenta los null,
min() - Obtiene el valor mínimo de un campo,
max() - Obtiene el valor máximo de un campo,
avg() - Obtiene la media aritmética o el promedio de un campo,
sum() - Obtiene el total o la sumatoria
*/

use NORTHWND;


--Cuantos clientes hay
SELECT count(*) AS [Número de clientes]
FROM Customers;

--Cuantas ventas se han realizado
SELECT count(*)
FROM Orders;

--Cuantas ventas se realizaron en 1996

SELECT count(*)
FROM Orders
WHERE datepart(year, OrderDate) = 1996;

--Seleccionar la venta de la fecha más antigua que se hizo
SELECT MIN(OrderDate) AS [Fecha de primera venta] FROM
Orders;

--Seleccionar el total que se ha vendido
SELECT SUM(UnitPrice * Quantity) AS [Total de Ventas]
from[Order Details]; 

--Seleccionar el total de ventas entre 1996 y 1997
SELECT SUM(UnitPrice * Quantity) AS [Total de Ventas]
from[Order Details] AS od
INNER JOIN Orders AS o
ON o.OrderID = od.OrderID
WHERE DATEPART(yy, o.OrderDate) between 1996 and 1997
AND o.CustomerID = 'AROUT'
;

--Seleccionar las ventas totales hechas a cada uno de los clientes
SELECT c.CompanyName AS [Cliente],
SUM(UnitPrice * Quantity) AS [Total de Ventas]
from[Order Details] AS od
INNER JOIN Orders AS o
ON o.OrderID = od.OrderID
INNER JOIN Customers AS c
ON c.CustomerID = o.CustomerID
WHERE DATEPART(yy, o.OrderDate) between 1996 and 1997
GROUP BY c.CompanyName
;


