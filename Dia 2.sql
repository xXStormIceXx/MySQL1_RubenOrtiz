-- #################################
-- # DIA # 2 - Comandos Generales #
--#################################

-- Comando general para revision de bases de datos creadas
show databases;

-- Crear base de datos 

create database Dia2;

-- utilizar BBDD Dia2

use Dia2;

-- Crear tabla Departamento
create table Departamento (
id int auto_increment primary key,
nombre varchar(50) not null
);

-- Crear tabla Persona
create table Persona(
id int auto_increment primary key,
nif varchar(9),
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50),
ciudad varchar(25) not null,
direccion varchar(50) not null,
telefono varchar(9), 
fecha_nacimiento DATE not null,
sexo enum('H','M') not null,
tipo enum('profesor','alumno') not null);

-- Crear la tabla de profesor
create table profesor(
    id_profesor int primary key,
    id_departamento int not null,
    foreign key (id_profesor) references persona(id),
    foreign key (id_departamento) references departamento(id)
);

-- Desarrolado por Ruben Ortiz / ID.1098810726