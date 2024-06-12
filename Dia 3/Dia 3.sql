-- ##############################################
-- #  DIA # 3 - GESTION DE DATOS E INSERCIONES  #
-- ##############################################
-- Comando general de revision de bases de Datos
Show databases;
-- Crear Base de Datos
create database Dia3;
-- Utilizar BBDD Dia 3
use Dia3;

-- Creacion tabla Gama Producto
create table gama_producto(
gama varchar(50) primary key,
descripcion_texto TEXT,
descripcion_html TEXT,
imagen varchar(256)
);

-- Creacion tabla Producto
create table producto(
codigo_producto varchar(15) primary key,
nombre varchar(70) not null,
gama varchar(50) not null,
dimensiones varchar(25),
proveedor varchar(50),
descripcion TEXT,
cantidad_en_stock SMALLINT(6) not null,
precio_venta DECIMAL(15,2) not null,
precio_proveedor DECIMAL(15,2) not null,

foreign key (gama) references gama_producto(gama)
);

-- Creacion tabla Cliente
create table cliente(
codigo_cliente int(11) auto_increment primary key,
nombre_cliente varchar(50) not null,
nombre_contacto varchar(30),
apellido_contacto varchar(30),
telefono varchar(15) not null,
fax varchar(15) not null,
linea_direccion1 varchar(50) not null,
linea_direccion2 varchar(50),
ciudad varchar(50) not null,
region varchar(50),
pais varchar(50),
codigo_postal varchar(10),
codigo_empleado_rep_ventas int(11),
limite_credito DECIMAL(15,2),

foreign key (codigo_empleado_rep_ventas) references empleado(codigo_empleado)
);

-- Creacion de tabla Detalle de Pedido
create table detalle_pedido(
codigo_pedido int(11),
codigo_producto varchar(15),
cantidad int(11) not null,
precio_unidad DECIMAL(15,2) not null,
numero_linea SMALLINT(6) not null,

foreign key (codigo_pedido) references pedido(codigo_pedido),
foreign key (codigo_producto) references producto(codigo_producto)
);

-- Creacion tabla Pedido
create table pedido(
codigo_pedido int(11) auto_increment primary key,
fecha_pedido DATE not null,
fecha_esperada DATE not null,
fecha_entrega DATE not null,
estado varchar(15) not null,
comentarios TEXT,
codigo_cliente int(11) not null,

foreign key (codigo_cliente) references cliente(codigo_cliente)
);

-- Creacion tabla Pago
create table Pago(
codigo_cliente int(11),
forma_pago varchar(40) not null,
id_transaccion varchar(50) primary key,
fecha_pago date not null,
total decimal(15,2),

foreign key (codigo_cliente) references cliente(codigo_cliente)
);

-- Creacion tabla Empleado
create table empleado(
codigo_empleado int(11) auto_increment primary key,
nombre varchar(50),
apellido1 varchar(50) not null,
apellido2 varchar(50),
extension varchar(10) not null,
email varchar(100) not null,
codigo_oficina varchar(10) not null,
codigo_jefe int(11),
puesto varchar(50),

foreign key (codigo_oficina) references oficina(codigo_oficina)
);

 -- Creacion tabla Oficina 
 create table Oficina(
 codigo_oficina varchar(10) primary key,
 ciudad varchar(30) not null,
 pais varchar(50) not null,
 region varchar(50),
 codigo_postal varchar(10),
 telefono varchar(20) not null,
 linea_de_direccion1 varchar(50) not null,
 linea_de_direccion2 varchar(50)
 );