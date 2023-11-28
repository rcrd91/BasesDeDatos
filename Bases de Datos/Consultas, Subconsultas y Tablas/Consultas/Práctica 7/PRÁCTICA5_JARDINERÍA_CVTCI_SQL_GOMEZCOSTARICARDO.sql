USE jardineria;

#1. ¿Cuántos empleados hay en la compañía?
SELECT COUNT(codigo_empleado)
FROM empleado;

#2. ¿Cuántos clientes tiene cada país?
SELECT COUNT(codigo_cliente), pais
FROM cliente
GROUP BY pais;

#3. ¿Cuál fue el pago medio en 2009?
SELECT AVG(total)
FROM pago
WHERE fecha_pago LIKE"2009-%-%";

#4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
SELECT COUNT(codigo_pedido)
FROM pedido
ORDER BY codigo_pedido DESC;

#5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.
SELECT MAX(precio_venta), MIN(precio_venta)
FROM producto;

#6. Calcula el número de clientes que tiene la empresa.
SELECT COUNT(codigo_cliente) AS "Número de clientes"
FROM cliente;

#7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
SELECT COUNT(codigo_cliente)
FROM cliente
WHERE ciudad="Madrid";

#8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
SELECT COUNT(codigo_cliente)
FROM cliente
WHERE ciudad LIKE "M%";

#9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
SELECT empleado.nombre, COUNT(codigo_cliente)
FROM empleado,cliente
WHERE cliente.codigo_empleado_rep_ventas=empleado.codigo_empleado
GROUP BY empleado.nombre;

#10. Calcula el número de clientes que no tiene asignado representante de ventas.
SELECT COUNT(codigo_cliente), puesto
FROM cliente, empleado
WHERE cliente.codigo_cliente=empleado.codigo_empleado AND NOT puesto="Representante Ventas"
GROUP BY puesto;

#11. Calcula el número de productos diferentes que hay en cada uno de los pedidos.
SELECT COUNT(codigo_producto) as "Productos en pedido", codigo_pedido as "Número de pedido"
FROM detalle_pedido
GROUP BY codigo_pedido;
