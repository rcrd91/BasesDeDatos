/* 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. 
El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos. */

#SQL1
SELECT DISTINCT cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2
FROM cliente,pedido
WHERE cliente.id=pedido.id_cliente
ORDER BY cliente.nombre, cliente.apellido1, cliente.apellido2;

#SQL2
SELECT DISTINCT cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2
FROM cliente INNER JOIN pedido
ON cliente.id=pedido.id_cliente
ORDER BY cliente.nombre, cliente.apellido1, cliente.apellido2;



#2. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. 
#El resultado debe mostrar todos los datos de los pedidos y del cliente.
#El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

#SQL1
SELECT pedido.*, cliente.*
FROM cliente,pedido
WHERE cliente.id=pedido.id_cliente
ORDER BY cliente.nombre;

#SQL2
SELECT pedido.*, cliente.*
FROM cliente INNER JOIN pedido
ON cliente.id=pedido.id_cliente
ORDER BY cliente.nombre;



/*3. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. 
El resultado debe mostrar todos los datos de los pedidos y de los comerciales. 
El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.*/

#SQL1
SELECT comercial.*, pedido.*
FROM comercial, pedido
WHERE comercial.id=pedido.id_cliente
ORDER BY comercial.nombre;

#SQL2
SELECT comercial.*, pedido.*
FROM comercial INNER JOIN pedido
ON comercial.id=pedido.id_cliente
ORDER BY comercial.nombre;



#4. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.

#SQL1
SELECT *
FROM comercial, pedido, cliente
WHERE comercial.id=pedido.id_comercial AND cliente.id=pedido.id_cliente;

#SQL1
SELECT *
FROM pedido, comercial, cliente
WHERE pedido.id_comercial = comercial.id AND pedido.id_cliente = cliente.id;

#SQL2
SELECT * 
FROM pedido INNER JOIN comercial ON comercial.id = pedido.id_comercial 
INNER JOIN cliente ON cliente.id = pedido.id_cliente;



#5. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.

#SQL1
SELECT *
FROM cliente, pedido
WHERE cliente.id=pedido.id_cliente AND pedido.fecha LIKE "2017-%-%" AND pedido.total BETWEEN 300 AND 1000;

#SQL2
SELECT *
FROM cliente INNER JOIN pedido
ON cliente.id=pedido.id_cliente AND pedido.fecha LIKE "2017-%-%" AND pedido.total BETWEEN 300 AND 1000;



#6. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.

#SQL1
SELECT comercial.nombre, comercial.apellido1, comercial.apellido2
FROM comercial, cliente, pedido
WHERE pedido.id_comercial=comercial.id AND pedido.id_cliente=cliente.id 
AND cliente.nombre="María" AND cliente.apellido1="Santana" AND cliente.apellido2="Moreno";

#SQL2
SELECT comercial.nombre, comercial.apellido1, comercial.apellido2
FROM pedido INNER JOIN comercial ON comercial.id=pedido.id_comercial INNER JOIN cliente
ON pedido.id_comercial=comercial.id AND pedido.id_cliente=cliente.id 
AND cliente.nombre="María" AND cliente.apellido1="Santana" AND cliente.apellido2="Moreno";



#7. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.

#SQL1
SELECT DISTINCT cliente.nombre, cliente.apellido1, cliente.apellido2
FROM comercial, cliente, pedido
WHERE pedido.id_comercial=comercial.id AND pedido.id_cliente=cliente.id 
AND comercial.nombre="Daniel" AND comercial.apellido1="Sáez" AND comercial.apellido2="Vega";

#SQL2
SELECT DISTINCT cliente.nombre, cliente.apellido1, cliente.apellido2
FROM pedido INNER JOIN comercial ON comercial.id=pedido.id_comercial INNER JOIN cliente
ON pedido.id_comercial=comercial.id AND pedido.id_cliente=cliente.id
AND comercial.nombre="Daniel" AND comercial.apellido1="Sáez" AND comercial.apellido2="Vega";