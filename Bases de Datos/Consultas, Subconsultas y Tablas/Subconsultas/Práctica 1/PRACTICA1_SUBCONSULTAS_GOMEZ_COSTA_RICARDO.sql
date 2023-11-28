#Subconsultas 

USE tienda;
    
#1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * 
FROM producto
WHERE codigo_fabricante =( 
	SELECT codigo
	FROM fabricante
	WHERE nombre="Lenovo");
    

#2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT *
FROM producto
WHERE precio =(
	SELECT MAX(precio) 
	FROM producto
    WHERE codigo_fabricante =( 
		SELECT codigo
		FROM fabricante
		WHERE nombre="Lenovo") );
        

#3. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre
FROM producto
WHERE precio =(
	SELECT MAX(precio) 
	FROM producto
    WHERE codigo_fabricante =( 
		SELECT codigo
		FROM fabricante
		WHERE nombre="Lenovo") );
        


#4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT nombre
FROM producto
WHERE precio =(
	SELECT MIN(precio) 
	FROM producto
    WHERE codigo_fabricante =( 
		SELECT codigo
		FROM fabricante
		WHERE nombre="Hewlett-Packard") );
        

#5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT *
FROM producto
WHERE precio >=(
	SELECT MIN(precio) 
	FROM producto
    WHERE codigo_fabricante =( 
		SELECT codigo
		FROM fabricante
		WHERE nombre="Hewlett-Packard") );
        

#6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT *
FROM producto
WHERE codigo_fabricante =(
	SELECT codigo 
	FROM fabricante
    WHERE nombre= "Asus" AND precio >(
		SELECT AVG(precio)
        FROM producto
        WHERE codigo_fabricante =(
			SELECT codigo
            FROM fabricante
            WHERE nombre="Asus")));

    #Subconsultas con ALL y ANY
    
    
#7. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT nombre
FROM producto
WHERE precio >= ALL(
	SELECT precio
    FROM producto);
    

#8. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT nombre
FROM producto
WHERE precio <= ALL(
	SELECT precio
    FROM producto);
    

#9. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre
FROM fabricante
WHERE codigo= ANY(
	SELECT codigo_fabricante
    FROM producto);


#10. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre
FROM fabricante
WHERE codigo!= ALL(
	SELECT codigo_fabricante
    FROM producto);


    #Subconsultas con IN y NOT IN
    
#11. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre
FROM fabricante
WHERE codigo IN (
	SELECT codigo_fabricante
    FROM producto);
    

#12. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre
FROM fabricante
WHERE codigo NOT IN(
	SELECT codigo_fabricante
    FROM producto);
    

    #Subconsultas con EXISTS y NOT EXISTS
    
#13. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre
FROM fabricante
WHERE EXISTS(
	SELECT codigo_fabricante
    FROM producto);


#14. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre
FROM fabricante
WHERE NOT EXISTS(
	SELECT codigo_fabricante
    FROM producto);
    
    
    #Subconsultas correlacionada
    
#15. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT fabricante.nombre, producto.nombre, producto.precio
FROM fabricante, producto
where producto.precio = (
	SELECT MAX(precio)
    FROM producto
    WHERE fabricante.codigo = producto.codigo_fabricante);
    
    
#16. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
SELECT * 
FROM producto
WHERE precio >=(
	SELECT AVG(precio)
    FROM fabricante);
    

#17. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre
FROM producto
WHERE precio =(
	SELECT MAX(precio) 
	FROM producto
    WHERE codigo_fabricante =( 
		SELECT codigo
		FROM fabricante
		WHERE nombre="Lenovo") );

    #Subconsultas (En la cláusula HAVING)

	