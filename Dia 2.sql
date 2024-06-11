-- #####################################
-- ### DIA # 2 - Comandos Generales ###
-- ####################################

-- Comando general para revisión de bases de datos creadas
show databases;

-- Crear base de datos

create database dia2;

-- Utilizar BBDD dia2

use dia2;

-- Crear tabla departamento
create table departamento (
    id int auto_increment primary key,
    nombre varchar(50) not null
);

-- Crear tabla persona
create table persona(
    id int auto_increment primary key,
    nif varchar(9),
    nombre varchar(25) not null,
    apellido1 varchar(50) not null,
    apellido2 varchar (50),
    ciudad varchar(25) not null,
    direccion varchar(50) not null,
    telefono varchar(9),
    fecha_nacimiento DATE not null,
    sexo enum('H','M') not null,
    tipo enum('profesor','alumno') not null
);

-- Crear la tabla de profesor
create table profesor(
    id_profesor int primary key,
    id_departamento int not null,
    foreign key (id_profesor) references persona(id),
    foreign key (id_departamento) references departamento(id)
);

-- Crear Tabla Asignatura
create table asignatura(
id int auto_increment primary key,
nombre varchar(100) not null,
creditos FLOAT not null,
tipo enum('Basica','obligatoria','optativa') not null,
curso tinyint(3) not null,
cuatrimestre tinyint(3) not null,
id_profesor int null,
id_grado int not null,
foreign key (id_grado) references grado(id),
foreign key (id_profesor) references profesor(id_profesor)
);

-- Crear tabla grago
create table grado(
    id int auto_increment primary key,
    nombre varchar(100) not null,
    foreign key (id_grado) references Asignatura(id_grado)
);

-- Crear tabla Curso_ Escolar
create table curso_escolar(
id int auto_increment primary key,
anyo_inicio YEAR(4) not null,
anyo_fin YEAR(4) not null
);

-- Crear tabla alumno_se_matricula_asignatura
create table alumno_se_matricula_asignatura(
id_alumno int,
id_asignatura int,
id_curso_escolar int,
foreign key (id_alumno) references persona(id),
foreign key (id_asignatura) references asignatura(id),
foreign key (id_curso_escolar) references curso_escolar(id)
);

-- Desarrollado por Ruben Ortiz / ID.1098810726
