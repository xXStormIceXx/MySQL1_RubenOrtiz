-- #####################
-- ### EJERCICIO # 1 ###
-- #####################
-- Creacion de la base de datos "tienda"
CREATE DATABASE tienda;

-- Usar base de datos "tienda"
uSE tienda;

-- Crear tabla fabricante
create table fabricante(
id int auto_increment primary key,
nombre varchar(100)
);

-- Mostrar tablas
show tables;

-- Crear tabla "producto"
create table producto(
id int auto_increment primary key,
nombre varchar(100),
precio decimal(10,2),
id_fabricante int,
foreign key (id_fabricante) references fabricante(id)
);

-- Desarrollado por Ruben Ortiz / ID.1.xxx.xxx.xxx
insert into Fabricante values (0, "Mac");
insert into Fabricante values (1, "Toyota");
insert into Fabricante values (2, "Mitsubishi");
insert into Fabricante values (3, "Subaru");
insert into Fabricante values (4, "Mercedez");
insert into Fabricante values (5, "Audi");
insert into Fabricante values (6, "Nissan");
insert into Fabricante values (7, "Renault");
insert into Fabricante values (8, "Chevrolet");
insert into Fabricante values (9, "Mazda");
insert into Fabricante values (10, "Peugeot");


-- Insertar Productos a la Tabla
insert into Producto values(0, "Disco duro Sata3 1TB", 85.99,0);
insert into Producto values(1, "Fortuner", 10.000,1);
insert into Producto values(2, "Montero Sport Takai", 96.69,2);
insert into Producto values(3,"WRX", 80.99,3);
insert into Producto values(4, "A200", 85.99,4);
insert into Producto values(5, "A8", 85.99,5);
insert into Producto values(6, "Nissan Shark", 85.99,6);
insert into Producto values(7, "Logan", 85.99,7);
insert into Producto values(8, "Triblazer", 85.99,8);
insert into Producto values(9, "CX-30", 85.99,9);
insert into Producto values(10, "Peugeot", 85.99,10);

-- Revisar todos los datos x Tabla
select * from Fabricante;

-- Revisar x columna de los datos creados de tablas
select nombre from Producto;

-- Actualizar datos por columna 
update producto set nombre='Campuslands' where id=10;
select * from Producto;

-- Actualizar Todas las Filas a un Nuevo nombre (no Funciona en WorkBench)
update Producto set nombre='Campuslands';

-- eliminar un dato de la tabla
delete from Producto where id=10;
