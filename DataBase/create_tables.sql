CREATE DATABASE IF NOT EXISTS Bibliocampus;

USE Bibliocampus;

CREATE TABLE IF NOT EXISTS libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    isbn VARCHAR(20) UNIQUE,
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