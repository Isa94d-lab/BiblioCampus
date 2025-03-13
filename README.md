# BiblioCampus

* MODELO CONCEPTUAL 
<img src="https://github.com/user-attachments/assets/870c3a06-7767-4791-9a56-6e79236540bf">

* MODELO LOGICO 
<img src= "https://github.com/user-attachments/assets/10abc68c-0bba-4669-afc5-c6e20f2fc925">


## CONSULTAS

Listar todos los libros disponibles:

```sql
SELECT id, nombre
from libros;
```

Buscar libros por genero:

```sql
SELECT nombre, genero 
FROM libros where genero like 'accion'; 
```

Obtener informacionde un libro por ISBN; 

```sql
SELECT nombre, estado, genero 
FROM libros where isbn in (2);
```

Contar el numero de libros en la biblioteca:

```sql
SELECT COUNT(*) as Totallibros
FROM libros;
```

Listar todos los autores:

```sql
SELECT id, nombre, apellido, pais_origen 
FROM autores;
```

Buscar autores por nombre: 

```sql
SELECT nombre, apellido, pais_origen 
FROM autores where nombre like 'Isa%';
```

Listar todas las ediciones de un libro:

```sql
SELECT libros.name, edicionLibro.fecha from
INNER JOIN libros on edicionLibro.id = libros.id_libro;
```

Obtener libros prestados actualmente:

```sql
SELECT nombre, genero 
FROM libros where estado like 0;
```

Listar todos los miembros de la biblioteca:

```sql
SELECT id, nombre, apellido, identificacion, email
FROM usuario;
```
Buscar un miembro por nombre: 

```sql
SELECT nombre, apellido, identificacion, email 
FROM usuario where nombre like 'Mariana%';
```

Listar todos los libros y sus autores:

```sql
SELECT l.nombre AS libro, a.nombre AS autor, a.apellido FROM libros l JOIN libroAutor la ON l.id = la.id_libro JOIN autores a ON la.id_autor = a.id;
```


## Incerts Opcionales

INSERT INTO libros(nombre, isbn, estado, genero) VALUES ('God Of War', 001, TRUE, 'accion');


INSERT INTO autores(nombre, apellido, pais_origen) VALUES ('Isabella', 'Galvis', 'Colombia');

INSERT INTO usuarios(nombre, apellido, identificacion, email) VALUES ('Mariana', 'Vargas', '1293488321', 'amrae@gmail.com');

INSERT INTO edicionLibro (id_libroAutor, id_editor, fecha) VALUES (1, 1, '2024-02-11');

INSERT INTO libroAutor (id_autor, id_libro) VALUES (1, 1);








