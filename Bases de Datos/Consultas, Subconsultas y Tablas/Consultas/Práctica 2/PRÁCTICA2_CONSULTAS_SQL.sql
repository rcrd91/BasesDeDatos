#Consultas simples en MySQL: CREACIÓN DE UNA BASE DE DATOS PARA TIENDA DE INFORMATICA



#CREACIÓN DE LAS TABLAS FABRICANTE Y PRODUCTO:

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);


#INSERTAR DATOS EN LAS TABLAS:

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


#ACTIVIDADE:

#1. Lista el nombre de todos los productos que hay en la tabla producto.

#2. Lista los nombres y los precios de todos los productos de la tabla producto.

#3. Lista todas las columnas de la tabla producto.

#4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).

#5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.

#6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

#7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

#8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.

#9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.

#10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.

#11. Lista el código de los fabricantes que tienen productos en la tabla producto.

#12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.

#13. Lista los nombres de los fabricantes ordenados de forma ascendente.

#14. Lista los nombres de los fabricantes ordenados de forma descendente.

#15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.

#16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.

#17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.

#18. Lista el nombre y el precio del producto más barato. 

#19. Lista el nombre y el precio del producto más caro. 

#20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.

#21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.

#22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.

#23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.

#24. Lista todos los productos que tengan un precio entre 80€ y 300€. 

#25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.

#26. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.

#27. Lista todos los productos donde el código de fabricante sea 1, 3 o 5.

#28. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.

#29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.

#29. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.

#30. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.

#31. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.

#32. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

#33. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

#34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.

#35. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).