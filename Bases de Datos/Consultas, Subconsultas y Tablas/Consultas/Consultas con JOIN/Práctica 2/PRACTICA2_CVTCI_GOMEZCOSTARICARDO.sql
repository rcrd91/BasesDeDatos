#Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

#1.Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

#SQL1
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante;

#SQL2
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante



#2.Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

#SQL1
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante
ORDER BY fabricante.nombre ASC;

#SQL2
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
ORDER BY fabricante.nombre ASC;



#3.Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante,
#de todos los productos de la base de datos.

#SQL1
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante;

#SQL2
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante;



#4.Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

#SQL1
SELECT producto.nombre, MIN(producto.precio), fabricante.nombre
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante;

#SQL2
SELECT producto.nombre, MIN(producto.precio), fabricante.nombre
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante;



#5.Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

#SQL1
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante
ORDER BY producto.precio DESC LIMIT 1;

#SQL2
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
ORDER BY producto.precio DESC LIMIT 1;



#6.Devuelve una lista de todos los productos del fabricante Lenovo.

#SQL1
SELECT fabricante.nombre, producto.nombre
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante AND fabricante.nombre="Lenovo";

#SQL1
SELECT fabricante.nombre, producto.nombre
FROM fabricante JOIN producto
ON fabricante.codigo = producto.codigo_fabricante AND fabricante.nombre="Lenovo";



#7.Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

#SQL1
SELECT fabricante.nombre, producto.nombre
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante AND fabricante.nombre="Crucial" AND producto.precio>"200";

#SQL2
SELECT fabricante.nombre, producto.nombre
FROM fabricante JOIN producto
ON fabricante.codigo = producto.codigo_fabricante AND fabricante.nombre="Crucial" AND producto.precio>"200";



#8.Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.

SELECT *
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante 
AND (fabricante.nombre="Asus" OR fabricante.nombre="Hewlett-Packard" OR fabricante.nombre="Seagate");

#SQL2
SELECT *
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante 
AND (fabricante.nombre="Asus" OR fabricante.nombre="Hewlett-Packard" OR fabricante.nombre="Seagate");



#9.Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT *
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante 
AND fabricante.nombre IN("Asus","Hewlett-Packard","Seagate");

#SQL2
SELECT *
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante 
AND fabricante.nombre IN("Asus","Hewlett-Packard","Seagate");



#10.Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

#SQL1
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM fabricante, producto
WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre LIKE "%e";

#SQL2

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre LIKE "%e";



#11.Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

#SQL1
SELECT producto.nombre, producto.precio
FROM fabricante, producto
WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre LIKE "%w%";

#SQL2
SELECT producto.nombre, producto.precio
FROM fabricante INNER JOIN producto
ON producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre LIKE "%w%";



#12.Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. 
#Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

#SQL1
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante AND producto.precio >=180
ORDER BY producto.precio DESC, producto.nombre;

#SQL2
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante AND producto.precio >=180
ORDER BY producto.precio DESC, producto.nombre;



#13.Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

#SQL1
SELECT DISTINCT fabricante.codigo, fabricante.nombre
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante;

#SQL2
SELECT DISTINCT fabricante.codigo, fabricante.nombre
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante;

