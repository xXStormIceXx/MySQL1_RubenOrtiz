-- ###############################################
-- ### DIA # 4 - RELACIONAMIENTO DE CONSULTAS ###
-- ##############################################

show databases;

create database Dia_4;

use Dia_4;

select * from idioma_pais;

CREATE TABLE pais (
    id INT PRIMARY KEY,
    nombre VARCHAR(20),
    continente VARCHAR(50),
    poblacion INT
);

CREATE TABLE ciudad (
    id INT PRIMARY KEY,
    nombre VARCHAR(20),
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES pais(id)
);

CREATE TABLE idioma (
    id INT PRIMARY KEY,
    idioma VARCHAR(50)
);

CREATE TABLE idioma_pais (
    id_idioma INT,
    id_pais INT,
    es_oficial TINYINT(1),
    PRIMARY KEY (id_idioma, id_pais),
    FOREIGN KEY (id_idioma) REFERENCES idioma(id),
    FOREIGN KEY (id_pais) REFERENCES pais(id)
);

INSERT INTO pais (id, nombre, continente, poblacion) VALUES 
(1, 'España', 'Europa', 47000000),
(2, 'México', 'América', 126000000),
(3, 'Japón', 'Asia', 126300000);

INSERT INTO ciudad (id, nombre, id_pais) VALUES 
(1, 'Madrid', 1),
(2, 'Barcelona', 1),
(3, 'Ciudad de México', 2),
(4, 'Guadalajara', 2),
(5, 'Tokio', 3),
(6, 'Osaka', 3);

INSERT INTO idioma (id, idioma) VALUES 
(1, 'Español'),
(2, 'Catalán'),
(3, 'Inglés'),
(4, 'Japonés');


INSERT INTO idioma_pais (id_idioma, id_pais, es_oficial) VALUES 
(1, 1, 1), -- Español es oficial en España
(2, 1, 1), -- Catalán es oficial en España
(1, 2, 1), -- Español es oficial en México
(4, 3, 1), -- Japonés es oficial en Japón
(3, 1, 0), -- Inglés no es oficial en España
(3, 2, 0), -- Inglés no es oficial en México
(3, 3, 0); -- Inglés no es oficial en Japón

-- INNER JOIN
SELECT pais.nombre as Pais,
ciudad.nombre as Ciudad
from pais -- Pais es un conjunto A
inner join ciudad -- Ciudad es un conjunto B
on pais.id = ciudad.id_pais; -- Interseccion de A y B

-- ######### INGRESO ADICIONAL #########
INSERT INTO ciudad VALUES
(7, 'Ciudad Unknow', Null);
INSERT INTO pais VALUES
(4, 'Italia','Europa', 10000022);
-- Listar todas las ciudades con el nombre de su pais
-- si alguna ciudad no tiene pais asignado, aun aparecera
-- en la lista con null (LEFT JOIN)

SELECT pais.nombre as Pais,
ciudad.nombre as Ciudad
from pais -- Pais es un conjunto A
left join ciudad -- Ciudad es un conjunto B
on pais.id = ciudad.id_pais; -- Interseccion de A y B

-- Mostrar todos los paises y si tienen ciudades asociadas,
-- se muestran junto al nombre del pais. Si no hay ciudades
-- asociadas a un pais, el nombre de la ciudad aparecera
-- como null (RIGHT JOIN)

SELECT pais.nombre as Pais,
ciudad.nombre as Ciudad
from pais -- Pais es un conjunto A
right join ciudad -- Ciudad es un conjunto B
on pais.id = ciudad.id_pais; -- Interseccion de A y B

