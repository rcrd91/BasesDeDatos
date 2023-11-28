USE ventas;


#1. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT SUM(total)
FROM pedido;


#2. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(total)
FROM pedido;


#3. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
SELECT DISTINCT(id_comercial)
FROM pedido;


#4. Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT COUNT(id)
FROM cliente;


#5. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT MAX(total)
FROM pedido;


#6. Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT MIN(total)
FROM pedido;


#7. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
SELECT MAX(categoría), ciudad
FROM cliente
GROUP BY ciudad;


#8. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. 
#Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. 
#Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. 
#Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
SELECT MAX(pedido.total) AS "Máximo valor pedido", pedido.id_cliente, pedido.fecha, cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2, pedido.fecha, TRUNCATE(SUM(pedido.total),3) AS "Valor de la cantidad"
FROM pedido, cliente
WHERE pedido.id_cliente=cliente.id
GROUP BY pedido.id_cliente;

#revisar


#9. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
SELECT MAX(pedido.total), cliente.nombre
FROM pedido, cliente
WHERE pedido.id_cliente=cliente.id AND pedido.total>2000
GROUP BY cliente.nombre;


#10. Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
SELECT MAX(pedido.total) AS Total, comercial.id, comercial.nombre, comercial.apellido1, comercial.apellido2
FROM pedido, comercial
WHERE pedido.id_comercial=comercial.id AND pedido.fecha="2016-08-17"
GROUP BY comercial.nombre;


#11. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes.
#Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
SELECT cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2, COUNT(pedido.id) AS "Número total de Pedidos"
FROM pedido RIGHT JOIN cliente
ON pedido.id_cliente=cliente.id
GROUP BY cliente.nombre;


#12. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
SELECT cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2, COUNT(pedido.total) AS "Total de Pedidos realizados durante 2017"
FROM cliente, pedido
WHERE cliente.id=pedido.id_cliente AND pedido.fecha LIKE("2017-%-%")
GROUP BY cliente.id;


#14. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT DISTINCT YEAR(pedido.fecha), MAX(pedido.total)
FROM pedido
GROUP BY YEAR(pedido.fecha);

SELECT DISTINCT YEAR(pedido.fecha), MAX(pedido.total)
FROM pedido
GROUP BY 1;


#15. Devuelve el número total de pedidos que se han realizado cada año.
SELECT COUNT(pedido.id) AS "Número total de pedidos", YEAR(pedido.fecha) AS "Fecha Pedido"
FROM pedido
GROUP BY YEAR(pedido.fecha);

SELECT COUNT(pedido.id) AS "Número total de pedidos", YEAR(pedido.fecha) AS "Fecha Pedido"
FROM pedido
GROUP BY 2;
