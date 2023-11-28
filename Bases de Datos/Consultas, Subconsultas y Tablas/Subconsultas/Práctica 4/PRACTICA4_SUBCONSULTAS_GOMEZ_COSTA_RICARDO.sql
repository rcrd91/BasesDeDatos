USE jardineria;

#SUBCONSULTAS RELACIONALES

#1. Mostrar el codigo de los pedidos donde se haya vendido el producto de la gama 'Aromáticas' mas caro.
SELECT codigo_producto
FROM producto
WHERE precio_venta=(
	SELECT MAX(precio_venta)
    FROM producto, gama_producto
    WHERE producto.gama = gama_producto.gama AND gama_producto.gama LIKE "Aromáticas");


SELECT pedido.codigo_pedido
FROM pedido, detalle_pedido
WHERE pedido.codigo_pedido=detalle_pedido.codigo_pedido
AND detalle_pedido.codigo_producto IN (
	SELECT codigo_producto
	FROM producto
	WHERE precio_venta=(
		SELECT MAX(precio_venta)
		FROM producto, gama_producto
		WHERE producto.gama = gama_producto.gama AND gama_producto.gama LIKE "Aromáticas"));


#2. Mostrar el codigo de los pedidos donde se hayan vendido mas de 6 productos.
SELECT 	pedido.codigo_pedido, count(*)
FROM pedido, detalle_pedido
WHERE pedido.codigo_pedido=detalle_pedido.codigo_pedido
GROUP BY detalle_pedido.codigo_pedido
HAVING COUNT(*) >=6;

#3. Mostrar el codigo de los pedidos donde el precio del pedido sea superior a la media de todos los pedidos.

# REPASAR: como ejecutar una función() en la cláusula SELECT
SELECT pedido.codigo_pedido
FROM pedido
WHERE
(SELECT sum(detalle_pedido.cantidad * detalle_pedido.precio_unidad)
      FROM pedido , detalle_pedido
      WHERE pedido.codigo_pedido = detalle_pedido.codigo_pedido and pedido.codigo_pedido = pedido.codigo_pedido
      GROUP BY pedido.codigo_pedido)
>
(SELECT avg(t.total)
FROM (SELECT pedido.codigo_pedido, sum(detalle_pedido.cantidad * detalle_pedido.precio_unidad)
      FROM pedido, detalle_pedido
      WHERE pedido.codigo_pedido = detalle_pedido.codigo_pedido
	  GROUP BY pedido.codigo_pedido) t);


#VISTAS

#1. Realiza una vista que muestre los datos de un empleado (nombre, apellidos, ciudad de la oficina) y lo mismo para su jefe (en la misma fila).
CREATE VIEW Empleados AS
SELECT nombre, apellido1, apellido2, ciudad, codigo_jefe, puesto
FROM empleado, oficina
WHERE empleado.codigo_oficina=oficina.codigo_oficina;


#2. Realiza una vista que muestre el codigo de pedido y su total en euros.
CREATE VIEW PrecioTotalPorPedido AS
SELECT pedido.codigo_pedido, SUM(detalle_pedido.precio_unidad)
FROM pedido, detalle_pedido
WHERE pedido.codigo_pedido=detalle_pedido.codigo_pedido
GROUP BY codigo_pedido;


#3. Realiza una vista con la información del pedido (codigo, fechapedido, fechaesperada, fechaentrega, nombre cliente y total en euros) ordenado por total de forma descendente
SELECT detalle_pedido.codigo_pedido, pedido.fecha_pedido, pedido.fecha_esperada, pedido.fecha_entrega, cliente.nombre_cliente, SUM(detalle_pedido.precio_unidad)
FROM detalle_pedido, pedido, cliente
WHERE detalle_pedido.codigo_pedido=pedido.codigo_pedido AND pedido.codigo_cliente=cliente.codigo_cliente
GROUP BY codigo_pedido
ORDER BY SUM(detalle_pedido.precio_unidad) DESC;


#VISTAS y SUBCONSULTAS

#1. Devolver la gama de productos mas vendida. Sin vistas
CREATE VIEW gamaProductosMasVendida AS
SELECT producto.nombre, SUM(detalle_pedido.cantidad) AS CantidadTotal
FROM producto, detalle_pedido
WHERE producto.codigo_producto= detalle_pedido.codigo_producto
GROUP BY codigo_pedido
ORDER BY SUM(detalle_pedido.cantidad) DESC;


#2. Devolver la gama de productos mas vendida. Usa vistas 
SELECT *
FROM gamaproductosmasvendida;

 
#3. Muestra el pais(cliente) donde menos pedidos se hacen. Usa una vista.    
CREATE VIEW paisConMenosPedidos AS
SELECT pais
FROM cliente, pedido
WHERE pedido.codigo_cliente=cliente.codigo_cliente
GROUP BY pais
ORDER BY COUNT(pedido.codigo_cliente);
