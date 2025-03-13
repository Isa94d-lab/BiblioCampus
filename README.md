# BiblioCampus

CREATE DATABASE IF NOT EXISTS Bibliocampus;

USE Bibliocampus;

CREATE TABLE IF NOT EXISTS libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    isbn VARCHAR(20) UNIQUE,
    estado VARCHAR(15),
    genero VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    apellido VARCHAR(20),
    pais_origen VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS libroAutor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_autor INT,
    id_libro INT,
    FOREIGN KEY (id_autor) REFERENCES autores(id),
    FOREIGN KEY (id_libro) REFERENCES libros(id)
);

CREATE TABLE IF NOT EXISTS editor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS edicionLibro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_libroAutor INT,
    id_editor INT,
    fecha DATE,
    FOREIGN KEY (id_libroAutor) REFERENCES libroAutor(id),
    FOREIGN KEY (id_editor) REFERENCES editor(id)
  
);

CREATE TABLE IF NOT EXISTS usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    apellido VARCHAR(20),
    identificacion INT UNIQUE,
    email VARCHAR(30) UNIQUE
);

CREATE TABLE IF NOT EXISTS prestamo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT,
    id_usuario INT,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    fecha_prestamo DATETIME
);

CREATE TABLE IF NOT EXISTS detallePrestamo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_prestamo INT,
    id_libro INT,
    FOREIGN KEY (id_prestamo) REFERENCES prestamo(id),
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    librosSocilicitados INT
);

CREATE TABLE IF NOT EXISTS devolucion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    Fecha_devolucion DATETIME 
);

CREATE TABLE IF NOT EXISTS transaccion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_detallePrestamo INT,
    id_devolucion INT,
    FOREIGN KEY (id_detallePrestamo) REFERENCES detallePrestamo(id),
    FOREIGN KEY (id_devolucion) REFERENCES devolucion(id)
);



* MODELO CONCEPTUAL *
<img src="https://github.com/user-attachments/assets/870c3a06-7767-4791-9a56-6e79236540bf">

* MODELO LOGICO *
<img src= "https://github.com/user-attachments/assets/10abc68c-0bba-4669-afc5-c6e20f2fc925">


## CONSULTAS

Listar todos los libros disponibles:

SELECT id, nombre
from libros;

Buscar libros por genero:

SELECT nombre, genero 
FROM libros where genero like 'accion'; 

Obtener informacionde un libro por ISBN; 

SELECT nombre, estado, genero 
FROM libros where isbn in (2);

Contar el numero de libros en la biblioteca:

SELECT COUNT(*) as Totallibros
FROM libros;

Listar todos los autores:

SELECT id, nombre, apellido, pais_origen 
FROM autores;

Buscar autores por nombre: 

SELECT nombre, apellido, pais_origen 
FROM autores where nombre like 'Isa%';

Listar todas las ediciones de un libro:

SELECT libros.name, edicionLibro.fecha from
INNER JOIN libros on edicionLibro.id = libros.id_libro;

Obtener libros prestados actualmente:

SELECT nombre, genero 
FROM libros where estado like 0;



## Incerts Opcionales

INSERT INTO libros(nombre, isbn, estado, genero) VALUES ('God Of War', 001, TRUE, 'accion');


INTO autores(nombre, apellido, pais_origen) VALUES ('Isabella', 'Galvis', 'Colombia');









