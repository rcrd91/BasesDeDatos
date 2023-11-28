#CONSULTAS MULTITABLA (Composición externa)

#Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

USE tienda;


#2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

SELECT *
FROM fabricante LEFT JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.codigo IS NULL;



#3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta
# Si, como vimos en la consulta #1, Xiaomi y Huawei no tienen productos relacionados (NULL).


#REPASO CONSULTAS SOBRE UNA TABLA, MULTITABLA (Composición Externa e Interna)

#1. Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(nombre)
FROM producto;


#2. Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(nombre)
FROM fabricante;


#3. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
SELECT DISTINCT COUNT(codigo_fabricante)
FROM producto; 


#4. Calcula la media del precio de todos los productos.
SELECT AVG(precio)
FROM producto;


#5. Calcula el precio más barato de todos los productos.
SELECT precio
FROM producto
ORDER BY precio ASC LIMIT 1;


#6. Calcula el precio más caro de todos los productos.
SELECT precio
FROM producto
ORDER BY precio DESC LIMIT 1;

SELECT MAX(precio)
FROM producto;


#7. Lista el nombre y el precio del producto más barato.
SELECT nombre, precio
FROM producto
ORDER BY precio ASC LIMIT 1;


#8. Lista el nombre y el precio del producto más caro.
SELECT nombre, precio
FROM producto
ORDER BY precio DESC LIMIT 1;


#9. Calcula la suma de los precios de todos los productos.
SELECT SUM(precio)
FROM producto;


#10. Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(producto.nombre)
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante AND fabricante.nombre="Asus";


#11. Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(producto.precio)
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante AND fabricante.nombre="Asus";


#12. Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT producto.precio
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante AND fabricante.nombre="Asus"
ORDER BY producto.precio ASC;


#13. Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT producto.precio
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante AND fabricante.nombre="Asus"
ORDER BY producto.precio DESC;


#14. Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(producto.precio)
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante AND fabricante.nombre="Asus" 


#15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(producto.precio), MIN(producto.precio), AVG(producto.precio), COUNT(producto.nombre)
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante AND fabricante.nombre="Crucial"  


#16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. 
#El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. 
#Ordene el resultado descendentemente por el número de productos.

SELECT fabricante.nombre, COUNT(producto.nombre)
FROM producto RIGHT JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre;


#17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. 
#El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.

SELECT fabricante.nombre, MAX(producto.precio), MIN(producto.precio), AVG(producto.precio)
FROM producto RIGHT JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre;


#18. Muestra el precio máximo, precio mínimo, precio medio 
#y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
#No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.


SELECT fabricante.codigo, MAX(producto.precio), MIN(producto.precio), AVG(producto.precio)>200
FROM producto RIGHT JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre;


#19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio
#y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.

SELECT fabricante.nombre, MAX(producto.precio), MIN(producto.precio), AVG(producto.precio)>200
FROM producto RIGHT JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre;

#20. Calcula el número de productos que tienen un precio mayor o igual a 180€.

SELECT COUNT(precio)
FROM producto
WHERE precio >= 180;


#21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.

SELECT COUNT(producto.codigo), fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante=fabricante.codigo AND producto.precio >= 180
GROUP BY fabricante.nombre;


#22. Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
SELECT AVG(producto.precio), fabricante.codigo
FROM producto, fabricante
WHERE producto.codigo_fabricante=fabricante.codigo
GROUP BY fabricante.nombre;


#23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT AVG(producto.precio), fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante=fabricante.codigo
GROUP BY fabricante.nombre;


#24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT AVG(producto.precio), fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante=fabricante.codigo
GROUP BY fabricante.nombre
HAVING AVG(producto.precio)>=150;


#25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT fabricante.nombre, COUNT(producto.codigo) AS Listado
FROM fabricante, producto
WHERE producto.codigo_fabricante=fabricante.codigo
GROUP BY fabricante.nombre
HAVING COUNT(producto.codigo)>=2;


#26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
#No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.

SELECT fabricante.nombre, COUNT(producto.nombre)
FROM fabricante, producto 
WHERE producto.codigo_fabricante=fabricante.codigo AND producto.precio>=220
GROUP BY fabricante.nombre;


#27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
#El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con 
#un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

#No se hace


#28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
SELECT fabricante.nombre, SUM(producto.precio)>1000
FROM fabricante, producto 
WHERE producto.codigo_fabricante=fabricante.codigo 
GROUP BY fabricante.nombre
HAVING SUM(producto.precio)>1000;

#29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.

#No se hace