USE ventas;

#Con operadores básicos de comparación
    
#1. Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
SELECT *
FROM pedido
WHERE id_cliente=(
	SELECT id
	FROM cliente
	WHERE CONCAT(nombre,' ',apellido1,' ',apellido2)='Adela Salas Díaz');


#2. Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN).
SELECT COUNT(id)
FROM pedido
WHERE id_comercial=(
	SELECT id
	FROM comercial
	WHERE CONCAT(nombre,' ',apellido1,' ',apellido2)='Daniel Sáez Vega');


#3. Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN).
SELECT *
FROM cliente
WHERE id=(
	SELECT id_cliente
	FROM pedido
	WHERE total =(
		SELECT MAX(total)
		FROM pedido
		#WHERE fecha LIKE "2019-%-%"
		WHERE YEAR(fecha)=2019));
    
    
#4. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT fecha,MIN(total)
FROM pedido
WHERE id_cliente=(
	SELECT id
    FROM cliente
	WHERE CONCAT(nombre,' ',apellido1,' ',apellido2)='Pepe Ruiz Santana');
    
    
#5. Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 
# con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
SELECT cliente.*, pedido.*
FROM cliente, pedido
WHERE cliente.id = pedido.id_cliente AND total>=(
	SELECT AVG(total)
	FROM pedido
	WHERE YEAR(fecha)=2017) AND YEAR(fecha)=2017;


#Subconsultas con ALL y ANY
#6. Devuelve el pedido más caro que existe en la tabla pedido sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT id, total
FROM pedido
WHERE total >=ALL(
	SELECT total
    FROM pedido);


#7. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).
SELECT *
FROM cliente
WHERE id !=ALL(
	SELECT id_cliente
    FROM pedido);


#8. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).
SELECT *
FROM comercial
WHERE id !=ALL(
	SELECT id_comercial
    FROM pedido);


#Subconsultas con IN y NOT IN
#9. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT *
FROM cliente
WHERE id NOT IN(
	SELECT id_cliente
    FROM pedido);
  
  
#10. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT *
FROM comercial
WHERE id NOT IN(
	SELECT id_comercial
    FROM pedido);


#Subconsultas con EXISTS y NOT EXISTS
#11. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT *
FROM cliente
WHERE EXISTS(
	SELECT id_cliente
    FROM pedido
    WHERE cliente.id=pedido.id_cliente);
    

#12. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT *
FROM comercial
WHERE NOT EXISTS(
	SELECT id_comercial
    FROM pedido
    WHERE comercial.id=pedido.id_comercial);