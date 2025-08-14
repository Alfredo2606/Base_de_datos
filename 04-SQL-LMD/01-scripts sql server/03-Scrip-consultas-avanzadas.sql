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

SELECT P.Num_Pedido , P.Importe, R.Nombre,
		C.EMPRESA
FROM Pedidos AS P
INNER JOIN Representantes AS R 
ON R.Num_Empl 

--Listar los pedidos superiores a 25000 mostrando el numero de pedido, el nombre del cliente que lo encargo 
--y el nombre del representante asignado al cliente, y el importe

