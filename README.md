# BiblioCampus


CREATE DATABASE IF NOT EXISTS Bibliocampus;

USE Bibliocampus;

CREATE TABLE IF NOT EXISTS libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    isbn VARCHAR(20),
    estado BOOLEAN,
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
    FOREIGN KEY (id_autor) REFERENCES autores(id),
    FOREIGN KEY (id_libro) REFERENCES libros(id),
);

CREATE TABLE IF NOT EXISTS editor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS edicionLibro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_editor INT,
    fecha DATE,
    FOREIGN KEY (id_libroAutor) REFERENCES libroAutor(id),
    FOREIGN KEY (id_editor) REFERENCES editor(id)
  
);

CREATE TABLE IF NOT EXISTS usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    apellido VARCHAR(20),
    identificacion INT,
    email VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS prestamo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    fecha_prestamo DATETIME
);

CREATE TABLE IF NOT EXISTS detallePrestamo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_prestamo INT,
    FOREIGN KEY (id_prestamo) REFERENCES prestamo(id),
    LibrosSocilicitados INT
);

CREATE TABLE IF NOT EXISTS transaccion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_prestamo INT,
    id_devolucion INT
);

CREATE TABLE IF NOT EXISTS devolucion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT,
    FOREIGN KEY (id_libros) REFERENCES prestamo(id),
);




