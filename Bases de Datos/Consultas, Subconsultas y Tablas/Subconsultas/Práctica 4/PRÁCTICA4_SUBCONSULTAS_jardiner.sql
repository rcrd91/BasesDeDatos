#Consultas simples en MySQL
CREACIÓN DE UNA BASE DE DATOS PARA EL ERP DE UNA EMPRESA DE JARDINERÍA
CREACIÓN DE LAS TABLAS OFICINA, EMPLEADO, GAMA_PRODUCTO, CLIENTE, PEDIDO, PRODUCTO, DETALLE_PEDIDO, PAGO
INSETAR DATOS

Acceder al script SQL para la creación de la base de datos y la inserción de datos: jardineria.sql.
https://gist.githubusercontent.com/josejuansanchez/c408725e848afd64dd9a20ab37fba8c9/raw/94f317604fda43e5dc7b5e859be82307c62c4488/jardineria.sql


#SUBCONSULTAS RELACIONALES

#1. Mostrar el codigo de los pedidos donde se haya vendido el producto de la gama 'Aromáticas' mas caro.

#2. Mostrar el codigo de los pedidos donde se hayan vendido mas de 6 productos.

#3. Mostrar el codigo de los pedidos donde el precio del pedido sea superior a la media de todos los pedidos

----SOLUCIÓN: https://youtu.be/AcUBTp9nNRo (Solo hay que cambiar los nombres de los campos ejemplo codigopedido=codigo_pedido)

#VISTAS

#1. Realiza una vista que muestre los datos de un empleado (nombre, apellidos, ciudad de la oficina) y lo mismo para su jefe (en la misma fila).

#2. Realiza una vista que muestre el codigo de pedido y su total en euros.

#3. Realiza una vista con la información del pedido (codigo, fechapedido, fechaesperada, fechaentrega, nombre cliente y total en euros) ordenado por total de forma descendente

----SOLUCIÓN: https://youtu.be/EREb6M1Y8D4 (Solo hay que cambiar los nombres de los campos ejemplo codigopedido=codigo_pedido)

#VISTAS y SUBCONSULTAS


#1. Devolver la gama de productos mas vendida. Sin vistas

#2. Devolver la gama de productos mas vendida. Usa vistas 
 
#3. Muestra el pais(cliente) donde menos pedidos se hacen. Usa una vista.

----SOLUCIÓN: https://youtu.be/FHEXnm2OmKI (Solo hay que cambiar los nombres de los campos ejemplo codigopedido=codigo_pedido)


