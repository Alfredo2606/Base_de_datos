--SQ-LDD
--crea una base de datos
CREATE DATABASE bdpruebag1;
--cambiar de base de datos
USE bdpruebag1;
--crear una tabla
CREATE TABLE categoria(
idcategoria int not null identity(1,1),
categorianombre nvarchar(20)not null,
constraint  pk_categoria
primary key(idcategoria)
);

CREATE TABLE  producto(
idproducto int not null,
nombreproducto varchar(20) not null,
descripcion varchar(100) null,
existencia int not null,
precio money not null,
idcategoria int not null,
constraint pk_producto
primary key(idproducto),
constraint fk_producto_categoria
foreign key (idcategoria)
references categoria(idcategoria)
);

--SQL -LMD
--insertar en la tabla categoria
insert into categoria(categorianombre)
values ('vinos y licores');
select * from categoria;
insert into categoria(categorianombre)
values ('carnes frias'),
('Linea blanca'),
('lacteos');
select * from categoria;
update  categoria
set categorianombre = 'Carnes Re-Frias'
where idcategoria = 2;
select * from categoria;


