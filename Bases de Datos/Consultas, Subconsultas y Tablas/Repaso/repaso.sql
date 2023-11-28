#CONSULTAS SIMPLES:      (LINEA 0004 a LINEA 1046)
#CONSULTAS CON JOIN:     (LINEA 1047 a LINEA 1904)
#SUBCONSULTAS:           (LINEA 1907 a LINEA 2395)
#CREACIÓN DE TABLAS:     (LINEA 2399 a LINEA 2902)

/* Tarefa 5.1 - Consultas simples en MySQL

ACTIVIDADE 1 (OBRIGATORIA)
Partindo do script de creación e inserción de datos fornecido, escribe nun novo ficheiro de script SQL as sentenzas conducentes á creación das seguintes consultas: */

USE tarefa51;

#1. Lista os nomes completos de todos os usuarios.
SELECT nome_completo
FROM usuarios;

#2. Calcula o saldo máximo dos usuarios nacionais.
SELECT MAX(saldo) 
FROM usuarios
WHERE nacional=1;

#3. Lista o nome completo e teléfono dos usuarios que posúan un Xiaomi, Huawei ou LG.
SELECT nome_completo , telefono
FROM usuarios
WHERE marca='Xiaomi' OR marca='Huawei' OR marca='LG';

#4. Conta os usuarios sen saldo ou inactivos.
SELECT COUNT(*)
FROM usuarios
WHERE saldo=0 OR activo=0;

#5. Lista o nome de usuario daqueles usuarios con nivel 1 ou 2.
SELECT usuario
FROM usuarios
WHERE nivel=1 OR nivel=2;


#6. Lista os números de teléfono dos usuarios con saldo menor o igual a 300.
SELECT telefono
FROM usuarios
WHERE saldo <= 300; 

#7. Calcula a suma dos saldos dos usuarios de Movistar.
SELECT SUM(saldo) 
FROM usuarios
WHERE companhia = 'Movistar';

#8. Conta o número de usuarios por compañía telefónica.
SELECT COUNT(usuario),companhia
FROM usuarios
GROUP BY companhia;

#9. Conta o número de usuarios por nivel.
SELECT COUNT(usuario),nivel
FROM usuarios
GROUP BY nivel;

#10. Lista o nome de usuario dos usuarios de 3.
SELECT usuario
FROM usuarios
WHERE nivel = 3;

#11. Amosa o email dos usuarios que empregan GMail.
SELECT email
FROM usuarios
WHERE email LIKE '%gmail.com';

#12. Lista o nome completo e teléfono dos usuarios con teléfono LG, SAMSUNG ou Huawei.
SELECT nome_completo,telefono
FROM usuarios
WHERE marca = 'LG' OR marca = 'Samsung' OR marca = 'Huawei';

#13. Lista o nome completo e teléfono dos usuarios cuxo teléfono non sexa un iPhone nin un Samsung.
SELECT nome_completo,telefono
FROM usuarios
WHERE NOT marca = 'iPhone' AND NOT marca = 'Samsung';
#WHERE marca NOT IN('iPhone', 'Samsung')


#14. Lista o nome de usuario e teléfono dos usuarios cuxa compañía sexa O2.
SELECT usuario,telefono
FROM usuarios
WHERE companhia = 'O2';

#15. Lista o nome de usuario e teléfono dos usuarios cuxa compañía non sexa Lowi.
SELECT usuario,telefono
FROM usuarios
WHERE NOT companhia = 'Lowi';
#WHERE companhia != 'Lowi';

#16. Calcula o saldo promedio daqueles usuarios cun teléfono Xiaomi.
SELECT AVG (saldo)
FROM usuarios
WHERE marca = 'Xiaomi';

#17. Lista o nome de usuario e teléfono dos usuarios cuxa compañía telefónica sexa Movistar ou Vodafone.
SELECT usuario,telefono
FROM usuarios
WHERE companhia = 'Movistar' OR companhia = 'Vodafone';

#18. Amosa o e-mail daqueles usuarios que non empregan yahoo.com coma servidor de correo.
SELECT email
FROM usuarios
WHERE email NOT LIKE '%yahoo.com';

#19. Lista o nome de usuario e teléfono dos usuarios con compañía telefónica que non sexa Yoigo nin Pepephone.
SELECT usuario,telefono
FROM usuarios
WHERE NOT companhia = 'Yoigo' OR NOT companhia = 'Pepephone';
#WHERE companhia NOT IN ('Yoigo', 'Pepephone');

#20. Lista o nome de usuario e teléfono dos usuarios cuxa compañía telefónica sexa Movistar.
SELECT nome_completo,telefono
FROM usuarios
WHERE companhia = 'Movistar';

#21. Lista as diferentes marcas de smartphone en orde alfabética.
SELECT marca
FROM usuarios
GROUP BY marca 
ORDER BY marca DESC;

#22. Lista as distintas compañías en orde aleatoria.
SELECT DISTINCT companhia
FROM usuarios
ORDER BY RAND();

#23. Lista o nome de usuario dos usuarios con nivel 0 ou 2.
SELECT usuario
FROM usuarios
WHERE nivel = 0 OR nivel = 2;

#24. Calcula o saldo promedio dos usuarios que teñen un teléfono de marca LG.
SELECT AVG (saldo)
FROM usuarios
WHERE marca = 'LG';

/*25. Lista o número de usuarios que hai en cada nivel cun saldo que estea no intervalo [50,250],pertencentes ás compañías Lowi, Movistar ou O2; 
ordeados descendentemente por nivel, pero só naqueles casos nos que ese número de usuarios sea maior ou igual a 3.*/
SELECT COUNT(usuario),nivel
FROM usuarios 
WHERE saldo BETWEEN 50 AND 250 AND companhia IN ('Lowi','Movistar','O2') 
GROUP BY nivel HAVING COUNT(usuario)>=3 
ORDER BY nivel DESC;


/* ACTIVIDADE 2 (OPTATIVA)
A entrega desta segunda actividade computará un máximo de 0,25 puntos adicionais sobre a nota do trimestre, 
os cales terán sido considerados só en caso de superar a avaliación previamente tal e coma está establecido na programación.*/

USE tarefa51;

#1. Lista o nome de usuario dos usuarios que non teñan nivel 1 nin 3 (supoñamos que no futuro pode mudar a escala de niveis actual).
SELECT usuario
FROM usuarios
WHERE NOT nivel = 1 AND NOT nivel = 3;

#2. Lista o nome completo e teléfono dos usuarios con teléfono que non sexa da marca iPhone.
SELECT nome_completo,telefono
FROM usuarios
WHERE NOT marca = 'iPhone';

#3. Lista o nome de usuario dos usuarios con nivel 3.
SELECT usuario
FROM usuarios
WHERE nivel = 3;

#4. Lista o nome de usuario dos usuarios con nivel distinto de 0.
SELECT usuario
FROM usuarios
WHERE nivel != 0;

#5. Lista o nome de usuario dos usuarios con nivel superior ou igual a 1.
SELECT usuario
FROM usuarios
WHERE nivel >= 1;

#6. Conta o número de usuarios por nacionais e non nacionais.
SELECT COUNT(*),nacional
FROM usuarios
GROUP BY nacional;

#7. Lista o nome de usuario e teléfono dos usuarios con Pepephone coma compañía telefónica.
SELECT usuario,telefono
FROM usuarios
WHERE companhia = 'Pepephone';

#8. Lista as diferentes compañías en orde alfabética descendente.
SELECT companhia
FROM usuarios
GROUP BY companhia ORDER BY companhia DESC;

#9. Lista o nome de usuario dos usuarios inactivos.
SELECT usuario
FROM usuarios
WHERE activo = 0;

#10. Lista os números de teléfono sen saldo.
SELECT telefono
FROM usuarios
WHERE saldo = 0;

#11. Calcula o saldo mínimo de entre os usuarios non nacionais.
SELECT MIN(saldo)
FROM usuarios
WHERE nacional = 0;

#12. Lista os números de teléfono con saldo maior a 300
SELECT telefono
FROM usuarios
WHERE saldo > 300;

#13. Conta o número de usuarios por marca de teléfono.
SELECT COUNT(*),marca
FROM usuarios
GROUP BY marca;

#14. Lista o nome completo e teléfono dos usuarios con teléfono que non sexa da marca LG.
SELECT nome_completo,telefono
FROM usuarios
WHERE marca != 'LG';

#15. Lista as diferentes compañías en orde alfabética ascendente.
SELECT companhia
FROM usuarios
GROUP BY companhia ORDER BY companhia ASC;

#16. Calcula a suma dos saldos dos usuarios da compañía telefónica Orange.
SELECT SUM(saldo)
FROM usuarios
WHERE companhia = 'Orange';

#17. Amosar o email dos usuarios que empregan hotmail.
SELECT email
FROM usuarios
WHERE email LIKE '%hotmail.com';

#18. Lista os nomes completo dos usuarios sen saldo ou inactivos
SELECT nome_completo
FROM usuarios
WHERE saldo = 0 OR activo = 0;

#19. Lista o nome de usuario e teléfono dos usuarios con compañía telefónica Movistar ou Lowi.
SELECT usuario,telefono
FROM usuarios
WHERE companhia = 'Movistar' OR companhia = 'Lowi';

#20. Lista as diferentes marcas de smartphone en orde alfabética descendente.
SELECT marca
FROM usuarios
GROUP BY marca ORDER BY marca DESC;

#21. Lista as diferentes marcas de smartphone en orde aleatoria.
SELECT marca
FROM usuarios
GROUP BY marca ORDER BY RAND();

#22. Lista o nome de usuario e teléfono dos usuarios con compañía telefónica Pepephone ou Orange.
SELECT usuario,telefono
FROM usuarios
WHERE companhia = 'Pepephone' OR companhia = 'Orange';

#23. Lista o nome completo e teléfono dos usuarios con teléfono que no sexa da marca Xiaomi ou Huawei.
SELECT nome_completo,telefono
FROM usuarios
WHERE marca != 'Xiaomi' AND marca != 'Huawei';

#24. Calcula a suma dos saldos dos usuarios da compañía telefónica O2.
SELECT SUM(saldo)
FROM usuarios
WHERE companhia = 'O2';

#25. Lista o número de usuarios que hai en cada compañía cun saldo maior ou igual a 400.
SELECT usuario,companhia
FROM usuarios
WHERE saldo >= 400;

________________________________


#1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre
FROM producto;

#2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio
FROM producto;

#3. Lista todas las columnas de la tabla producto.
SELECT *
FROM producto;

#4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio AS "Precio Euros" , precio*1.13 AS "Precio Dólares"
FROM producto;

#5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS "nombre de producto", precio AS "euros", precio* 1.13 AS "dólares"
FROM producto;

#6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER (nombre),precio
FROM producto;

#7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio
FROM producto;

#8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER (LEFT(nombre,2)) AS NOMBRE
FROM fabricante;

#9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio)
FROM producto ;

#10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio,0)
FROM producto;

#11. Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT codigo_fabricante
FROM producto;

#12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT codigo_fabricante
FROM producto
GROUP BY codigo_fabricante;

SELECT DISTINCT codigo_fabricante
FROM producto;

#13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre
FROM fabricante
ORDER BY nombre ASC;

#14. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre
FROM fabricante
ORDER BY nombre DESC;

#15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio 
FROM producto
ORDER BY nombre ASC, precio DESC;

#16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * 
FROM fabricante
LIMIT 5;

#17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT *
FROM fabricante
LIMIT 3,2;

#18. Lista el nombre y el precio del producto más barato. 
SELECT nombre, MIN(precio)
FROM producto;

#19. Lista el nombre y el precio del producto más caro. 
SELECT nombre, MAX(precio)
FROM producto;

#20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre, codigo_fabricante
FROM producto
WHERE codigo_fabricante=2;

#21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre, precio
FROM producto
WHERE precio <= 120;

#22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre, precio
FROM producto
WHERE precio >= 400;

#23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre, precio
FROM producto
WHERE NOT precio >= 400;

#24. Lista todos los productos que tengan un precio entre 80€ y 300€. 
SELECT nombre
FROM producto
WHERE precio >=80 AND precio <= 300;

#25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT nombre
FROM producto
WHERE precio BETWEEN 60 AND 200; 

#26. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT nombre, precio, codigo_fabricante
FROM producto
WHERE precio > 200 AND codigo_fabricante = 6;

#27. Lista todos los productos donde el código de fabricante sea 1, 3 o 5.
SELECT nombre
FROM producto
WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

#28. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT nombre
FROM producto
WHERE codigo_fabricante IN (1,3,5)

#29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio *100 AS precio_céntimos
FROM producto

#29. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre
FROM fabricante
WHERE nombre LIKE 'S%';

#30. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre
FROM fabricante
WHERE nombre LIKE '%e';

#31. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre
FROM fabricante
WHERE nombre LIKE '%w%';

#32. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre
FROM fabricante
WHERE nombre LIKE'____'; 

SELECT nombre
FROM fabricante
WHERE LENGTH(nombre)=4;

#33. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre
FROM producto
WHERE nombre LIKE '%Portátil%';

#34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre
FROM producto
WHERE nombre LIKE '%Monitor%' AND precio<215;

#35. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. 
#Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre,precio
FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;




--------------------------------------

#ACTIVIDADES

#1. Lista el primer apellido de todos los empleados.
SELECT apellido1
FROM empleado;

#2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT DISTINCT apellido1
FROM empleado;

#3. Lista todas las columnas de la tabla empleado.
SELECT * 
FROM empleado;

#4. Lista el nombre y los apellidos de todos los empleados.
SELECT nombre, apellido1, apellido2
FROM empleado;

#5. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado.
SELECT codigo_departamento
FROM empleado;

#6. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_departamento
FROM empleado;

#7. Lista el nombre y apellidos de los empleados en una única columna.
SELECT CONCAT(nombre," ",apellido1," ", apellido2)
FROM empleado;

#8. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
SELECT CONCAT(UPPER (nombre)," ", UPPER(apellido1)," ",UPPER(apellido2)) AS NombreApellidos
FROM empleado;

#9. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT CONCAT(LOWER (nombre)," ", LOWER(apellido1)," ",LOWER(apellido2)) AS NombreApellidos
FROM empleado;

#10. Lista el código de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.
SELECT codigo, SUBSTRING(nif,1,8) AS NúmeroDNI, SUBSTRING(nif,9,1) AS "LetraDNI"
FROM empleado;

#11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) los gastos que se han generado (columna gastos).Tenga en cuenta que en algunos casos pueden existir valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.

SELECT nombre, ((presupuesto)-(gastos)) AS RESULTADO
FROM departamento;

#12. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT nombre, SUM(presupuesto) 
FROM departamento
ORDER BY presupuesto ASC;

#13. Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT nombre
FROM departamento
ORDER BY nombre ASC;

#14. Lista el nombre de todos los departamentos ordenados de forma descendente.
SELECT nombre
FROM departamento
ORDER BY nombre DESC;

#15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
SELECT apellido1, apellido2, nombre
FROM empleado
ORDER BY apellido1, apellido2, nombre ASC;

#16. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
SELECT nombre, presupuesto
FROM departamento
ORDER BY presupuesto DESC LIMIT 3;

#17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT nombre, presupuesto
FROM departamento
ORDER BY presupuesto ASC LIMIT 3;

#18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
SELECT nombre, gastos
FROM departamento
ORDER BY gastos DESC LIMIT 2;

#19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
SELECT nombre, gastos
FROM departamento
ORDER BY gastos ASC LIMIT 2;

#20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
SELECT * 
FROM empleado LIMIT 2,5;

#21. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto >= 150000;

#22. Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
SELECT nombre, gastos
FROM departamento
WHERE gastos < 5000;

#23. Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT nombre, presupuesto
FROM departamento 
WHERE presupuesto >=100000 AND presupuesto <=200000;

#24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT nombre, presupuesto
FROM departamento
WHERE NOT presupuesto >100000 OR NOT presupuesto <200000;

#25. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
SELECT nombre
FROM departamento
WHERE presupuesto BETWEEN 100000 AND 200000;

#26. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
SELECT nombre
FROM departamento
WHERE NOT presupuesto BETWEEN 100000 AND 200000;

#27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de quellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
SELECT nombre, gastos, presupuesto
FROM departamento
WHERE gastos > presupuesto;

#28. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
SELECT nombre, gastos, presupuesto
FROM departamento
WHERE gastos < presupuesto;

#29. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
SELECT nombre, gastos,presupuesto
FROM departamento
WHERE gastos = presupuesto;

#30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
SELECT *
FROM empleado
WHERE apellido2 IS NULL;

#31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
SELECT *
FROM empleado
WHERE apellido2 IS NOT NULL;

#32. Lista todos los datos de los empleados cuyo segundo apellido sea López.
SELECT *
FROM empleado
WHERE apellido2="López";

#33. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
SELECT *
FROM empleado
WHERE apellido2="Díaz" OR apellido2="Moreno";

#34. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
SELECT *
FROM empleado
WHERE apellido2 IN ("Díaz","Moreno");

#35. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
SELECT nombre, apellido1, apellido2, nif
FROM empleado
WHERE codigo_departamento=3;

#36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
SELECT nombre, apellido1, apellido2, nif
FROM empleado
WHERE codigo_departamento=3 OR 4 OR 5;


----------------------------------------------


#ACTIVIDADES

#1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
SELECT *
FROM pedido
ORDER BY fecha DESC;

#2. Devuelve todos los datos de los dos pedidos de mayor valor.
SELECT *
FROM pedido
ORDER BY total DESC;

#3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT DISTINCT id_cliente
FROM pedido;

#4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€
SELECT *
FROM pedido
WHERE (fecha >="2017-01-01" AND fecha <="2017-12-31") AND total>500;

#5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
SELECT nombre, apellido1, apellido2
FROM comercial
WHERE comisión BETWEEN 0.05 AND 0.11;

#6. Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
SELECT comisión
FROM comercial
ORDER BY comisión DESC
LIMIT 1;

#7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
SELECT id, nombre, apellido1, apellido2
FROM cliente
WHERE apellido2 IS NOT NULL
ORDER BY apellido1 ASC;

#8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
SELECT nombre
FROM cliente
WHERE nombre LIKE "A%n" OR nombre LIKE"P%";

#9. Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
SELECT nombre
FROM cliente
WHERE nombre NOT LIKE "A%"
ORDER BY nombre DESC;

#10. Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
SELECT DISTINCT nombre
FROM comercial
WHERE nombre LIKE "%o" OR nombre LIKE "%el";
-----------------------------------------------

#ACTIVIDADES 5

#1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT codigo_oficina, ciudad
FROM oficina;

#2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT ciudad, telefono
FROM oficina
WHERE pais="España";

#3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
SELECT nombre, apellido1, apellido2, email
FROM empleado
WHERE codigo_jefe=7;

#4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
SELECT puesto, nombre, apellido1, apellido2, email
FROM empleado
WHERE puesto="Director General";

#5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
SELECT nombre,apellido1,apellido2,puesto
FROM empleado
WHERE NOT puesto="Representante Ventas";

#6. Devuelve un listado con el nombre de los todos los clientes españoles.
SELECT nombre_contacto
FROM cliente
WHERE pais="Spain";

#7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
SELECT DISTINCT estado
FROM pedido;

#8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
  
   # Utilizando la función YEAR de MySQL.
	SELECT DISTINCT codigo_cliente
	FROM pago
	WHERE YEAR(fecha_pago)=2008;

   # Utilizando la función DATE_FORMAT de MySQL.	
	SELECT DISTINCT codigo_cliente, DATE_FORMAT(fecha_pago,"%Y")
	FROM pago
	WHERE DATE_FORMAT(fecha_pago, "%Y")=2008

   # Sin utilizar ninguna de las funciones anteriores
   SELECT DISTINCT codigo_cliente
   FROM pago
   WHERE fecha_pago LIKE "%2008%";

#9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE DATEDIFF(fecha_entrega, fecha_esperada)>0;

#10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos 
#cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

	# Utilizando la función ADDDATE de MySQL.
   SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
	FROM pedido
	WHERE fecha_entrega < ADDDATE(fecha_esperada, INTERVAL -2 DAY);
	
	SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
	FROM pedido
	WHERE fecha_entrega < ADDDATE(fecha_esperada,-2);
	 
   # Utilizando la función DATEDIFF de MySQL 			
	SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
	FROM pedido 
	WHERE DATEDIFF(fecha_esperada, fecha_entrega)>2;
	 
   # ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?
   # No, porque no se pueden hacer cálculos de fechas.
   
#11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
SELECT *
FROM pedido
WHERE estado="Rechazado" AND fecha_pedido LIKE "2009%";

#12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
SELECT *
FROM pedido
WHERE fecha_pedido LIKE("%-01-%") AND estado="Entregado";

#13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
SELECT * 
FROM pago
WHERE fecha_pago LIKE("2008-%-%") AND forma_pago="Paypal"
ORDER BY total DESC;

#14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
SELECT DISTINCT forma_pago
FROM pago;

#15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. 
#El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
SELECT *
FROM producto
WHERE gama="Ornamentales" AND cantidad_en_stock > 100
ORDER BY precio_venta DESC;

#16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30
SELECT *
FROM cliente
WHERE ciudad="Madrid" AND (codigo_empleado_rep_ventas=11 OR codigo_empleado_rep_ventas=30);

SELECT *
FROM cliente
WHERE ciudad="Madrid" AND (codigo_empleado_rep_ventas IN(11,30));

--------------------------------------------------------------------

#PRÁCTICA6

#1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. 
#El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo="alumno"
ORDER BY apellido1, apellido2, nombre DESC;

#2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo="alumno" AND telefono IS NULL;

#3. Devuelve el listado de los alumnos que nacieron en 1999.
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo="alumno" AND fecha_nacimiento LIKE "1999%";

#4. Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
SELECT *
FROM persona
WHERE tipo="profesor" AND telefono IS NULL AND nif LIKE "%K";

#5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT nombre
FROM asignatura
WHERE cuatrimestre=1 AND curso=3 AND id_grado=7;

-----------------------------------------------------

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
----------------------------

#REPASO

/* Consultas 1 */

USE instituto;

# Devuelve los datos del alumno cuyo id es igual a 1.
SELECT *
FROM alumno
WHERE id=1 ;


# Devuelve los datos del alumno cuyo teléfono es igual a 692735409.
SELECT *
FROM alumno
WHERE teléfono=692735409;


# Devuelve un listado de todos los alumnos que son repetidores.
SELECT * 
FROM alumno
WHERE es_repetidor="si";


# Devuelve un listado de todos los alumnos que no son repetidores.
SELECT * 
FROM alumno
WHERE es_repetidor="no";


# Devuelve el listado de los alumnos que han nacido antes del 1 de enero de 1993.
SELECT *
FROM alumno
WHERE fecha_nacimiento<"1993/01/01";


# Devuelve el listado de los alumnos que han nacido después del 1 de enero de 1994.
SELECT *
FROM alumno
WHERE fecha_nacimiento>"1994/01/01";

# Devuelve el listado de los alumnos que han nacido después del 1 de enero de 1994 y no son repetidores.
SELECT *
FROM alumno
WHERE fecha_nacimiento>"1994/01/01" AND es_repetidor="no";


# Devuelve el listado de todos los alumnos que nacieron en 1998.
SELECT *
FROM alumno
WHERE fecha_nacimiento LIKE "1998-%-%";


# Devuelve el listado de todos los alumnos que no nacieron en 1998.
SELECT *
FROM alumno
WHERE fecha_nacimiento NOT LIKE "1998-%-%";

/* Consultas 2 */

USE instituto;

#Consultas 2

# Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre de los alumnos y en la segunda, el nombre con todos los caracteres invertidos.

SELECT nombre, REVERSE(nombre)
FROM alumno;

# Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre y los apellidos de los alumnos 
#y en la segunda, el nombre y los apellidos con todos los caracteres invertidos.

SELECT CONCAT(nombre," ",apellido1," ",apellido2) AS NombreApellidos, REVERSE(CONCAT(nombre," ",apellido1," ",apellido2)) AS NombreApellidosInvertidos
FROM alumno;

# Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre y los apellidos de los alumnos en mayúscula 
#y en la segunda, el nombre y los apellidos con todos los caracteres invertidos en minúscula.

SELECT UPPER(CONCAT(nombre," ",apellido1," ",apellido2)) AS NombreApellidos, LOWER(REVERSE(CONCAT(nombre," ",apellido1," ",apellido2))) AS NombreApellidosInvertidos
FROM alumno;


# Devuelve un listado con tres columnas, donde aparezca en la primera columna el nombre y los apellidos de los alumnos,
#en la segunda, el número de caracteres que tiene en total el nombre y los apellidos y en la tercera el número de bytes que ocupa en total.

SELECT CONCAT(nombre," ",apellido1," ",apellido2) AS NombreApellidos, CHAR_LENGTH(CONCAT(nombre," ",apellido1," ",apellido2)) AS NombreApellidosLongitud, LENGTH(CONCAT(nombre," ",apellido1," ",apellido2)) AS NumeroBytes
FROM alumno;

# Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre y los dos apellidos de los alumnos.
# En la segunda columna se mostrará una dirección de correo electrónico que vamos a calcular para cada alumno. 
# La dirección de correo estará formada por el nombre y el primer apellido, separados por el carácter . y seguidos por el dominio @iescelia.org.
# Tenga en cuenta que la dirección de correo electrónico debe estar en minúscula. Utilice un alias apropiado para cada columna.

SELECT CONCAT(nombre," ",apellido1," ",apellido2) AS NombreApellidos, LOWER((CONCAT(nombre,".",apellido1,"@iescelia.org"))) AS email
FROM alumno;

/* Devuelve un listado con tres columnas, donde aparezca en la primera columna el nombre y los dos apellidos de los alumnos.
En la segunda columna se mostrará una dirección de correo electrónico que vamos a calcular para cada alumno.
La dirección de correo estará formada por el nombre y el primer apellido, separados por el carácter . y seguidos por el dominio @iescelia.org.
Tenga en cuenta que la dirección de correo electrónico debe estar en minúscula. 
La tercera columna será una contraseña que vamos a generar formada por los caracteres invertidos del segundo apellido, seguidos de los cuatro caracteres del año
de la fecha de nacimiento. Utilice un alias apropiado para cada columna. */

SELECT CONCAT(nombre," ",apellido1," ",apellido2) AS NombreApellidos, LOWER((CONCAT(nombre,".",apellido1,"@iescelia.org"))) AS email, CONCAT(REVERSE(apellido2),YEAR(fecha_nacimiento)) AS Contraseña
FROM alumno;

/* Consultas 3 */

USE instituto;
# Devuelva un listado con cuatro columnas, donde aparezca en la primera columna la fecha de nacimiento completa de los alumnos, 
#en la segunda columna el día, en la tercera el mes y en la cuarta el año. Utilice las funciones DAY, MONTH y YEAR.

SELECT fecha_nacimiento AS FechaNacimiento,MONTH(fecha_nacimiento) AS Mes, YEAR(fecha_nacimiento) AS Año
FROM alumno;

# Devuelva un listado con tres columnas, donde aparezca en la primera columna la fecha de nacimiento de los alumnos, 
# en la segunda el nombre del día de la semana de la fecha de nacimiento y en la tercera el nombre del mes de la fecha de nacimiento.

#Resuelva la consulta utilizando las funciones DAYNAME y MONTHNAME.
SELECT fecha_nacimiento AS FechaNacimiento, DAYNAME(fecha_nacimiento) AS Dia, MONTHNAME(fecha_nacimiento) AS Mes
FROM alumno;

#Resuelva la consulta utilizando la función DATE_FORMAT.
SELECT fecha_nacimiento AS FechaNacimiento, DATE_FORMAT(fecha_nacimiento,'%W') AS Dia, DATE_FORMAT(fecha_nacimiento, "%M") AS Mes
FROM alumno;
    
#Devuelva un listado con dos columnas, donde aparezca en la primera columna la fecha de nacimiento de los alumnos
# en la segunda columna el número de días que han pasado desde la fecha actual hasta la fecha de nacimiento. 
#Utilice las funciones DATEDIFF y NOW. Consulte la documentación oficial de MySQL para DATEDIFF.

SELECT fecha_nacimiento AS fecha_nacimiento, DATEDIFF(NOW(),fecha_nacimiento) AS CalculoDías
FROM alumno;

#Devuelva un listado con dos columnas, donde aparezca en la primera columna la fecha de nacimiento de los alumnos y en la segunda columna la edad de cada alumno/a.
#La edad (aproximada) la podemos calcular realizando las siguientes operaciones:

#Calcula el número de días que han pasado desde la fecha actual hasta la fecha de nacimiento. Utilice las funciones DATEDIFF y NOW.
SELECT fecha_nacimiento, ROUND(DATEDIFF(NOW(),fecha_nacimiento)/365) AS Edad 
FROM alumno;

#Divida entre 365.25 el resultado que ha obtenido en el paso anterior. (El 0.25 es para compensar los años bisiestos que han podido existir entre la fecha de nacimiento y la fecha actual).

SELECT nombre, DATEDIFF(NOW(),fecha_nacimiento)/365.25 AS CalculoDías
FROM alumno;
    
#Trunca las cifras decimales del número obtenido.

SELECT fecha_nacimiento, TRUNCATE(DATEDIFF(NOW(),fecha_nacimiento)/365,0) AS Edad 
FROM alumno;


---------------------------------------

#CONSULTAS CON JOIN

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

---------------------------------------------------------

#ACTIVIDADES
#Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

#1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.

#SQL1
SELECT *
FROM empleado,departamento
WHERE empleado.codigo_departamento=departamento.codigo;
#SQL2

SELECT *
FROM empleado INNER JOIN departamento
ON empleado.codigo_departamento=departamento.codigo;



#2. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. 
#Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) 
#y en segundo lugar por los apellidos y el nombre de los empleados.

#SQL1
SELECT *
FROM empleado,departamento
WHERE empleado.codigo_departamento=departamento.codigo  
ORDER BY departamento.nombre, empleado.nombre, empleado.apellido1, empleado.apellido2;

#SQL2
SELECT *
FROM empleado INNER JOIN departamento
ON empleado.codigo_departamento=departamento.codigo  
ORDER BY departamento.nombre, empleado.nombre, empleado.apellido1, empleado.apellido2;



#3. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.

#SQL1
SELECT DISTINCT departamento.codigo, departamento.nombre
FROM empleado,departamento
WHERE departamento.codigo=empleado.codigo_departamento;

#SQL2
SELECT DISTINCT departamento.codigo, departamento.nombre
FROM empleado INNER JOIN departamento
ON departamento.codigo=empleado.codigo_departamento;



/*4. Devuelve un listado con el código, el nombre del departamento y el valor del presupuesto actual del que dispone,
 solamente de aquellos departamentos que tienen empleados. 
 El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial (columna presupuesto) 
 el valor de los gastos que ha generado (columna gastos).*/
 
#SQL1

SELECT DISTINCT departamento.codigo, departamento.nombre, (departamento.presupuesto - departamento.gastos) AS "Presupuesto actual"
FROM empleado,departamento
WHERE departamento.codigo=empleado.codigo_departamento;

#SQL2
SELECT DISTINCT departamento.codigo, departamento.nombre, (departamento.presupuesto - departamento.gastos) AS "Presupuesto actual"
FROM empleado INNER JOIN departamento
ON departamento.codigo=empleado.codigo_departamento;



#5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.

#SQL1
SELECT departamento.nombre 
FROM empleado,departamento
WHERE departamento.codigo=empleado.codigo_departamento AND nif="38382980M";

#SQL2
SELECT departamento.nombre 
FROM empleado INNER JOIN departamento
ON departamento.codigo=empleado.codigo_departamento AND nif="38382980M";



#6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.

#SQL1
SELECT departamento.nombre
FROM empleado,departamento
WHERE departamento.codigo=empleado.codigo_departamento AND empleado.nombre="Pepe" AND empleado.apellido1="Ruiz" AND empleado.apellido2="Santana";

#SQL2
SELECT departamento.nombre
FROM empleado INNER JOIN departamento
ON departamento.codigo=empleado.codigo_departamento AND empleado.nombre="Pepe" AND empleado.apellido1="Ruiz" AND empleado.apellido2="Santana";



#7. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.

#SQL1
SELECT empleado.*
FROM empleado,departamento
WHERE departamento.codigo=empleado.codigo_departamento AND departamento.nombre="I+D"
ORDER BY empleado.nombre, empleado.apellido1, empleado.apellido2;

#SQL2
SELECT empleado.*
FROM empleado INNER JOIN departamento
ON departamento.codigo=empleado.codigo_departamento AND departamento.nombre="I+D"
ORDER BY departamento.nombre;



#8. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.

#SQL1
SELECT *
FROM empleado,departamento
WHERE departamento.codigo=empleado.codigo_departamento AND departamento.nombre="Sistemas" OR departamento.nombre="Contabilidad" OR departamento.nombre="I+D"
ORDER BY empleado.apellido1, empleado.apellido2, empleado.nombre;

#SQL2
SELECT *
FROM empleado INNER JOIN departamento
ON departamento.codigo=empleado.codigo_departamento AND departamento.nombre="Sistemas" OR departamento.nombre="Contabilidad" OR departamento.nombre="I+D"
ORDER BY empleado.apellido1, empleado.apellido2, empleado.nombre;



#9. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.

#SQL1
SELECT empleado.nombre
FROM empleado,departamento
WHERE departamento.codigo=empleado.codigo_departamento AND departamento.presupuesto NOT BETWEEN 100000 AND 200000;

#SQL2
SELECT empleado.nombre
FROM empleado INNER JOIN departamento
ON departamento.codigo=empleado.codigo_departamento AND departamento.presupuesto NOT BETWEEN 100000 AND 200000;



#10. Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL.
#Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.

#SQL1
SELECT DISTINCT departamento.nombre
FROM empleado,departamento
WHERE departamento.codigo=empleado.codigo_departamento AND empleado.apellido2 IS NULL;

#SQL2
SELECT DISTINCT departamento.nombre
FROM empleado INNER JOIN departamento
ON departamento.codigo=empleado.codigo_departamento AND empleado.apellido2 IS NULL;

---------------------------------------------------------------------------------------

USE empleados;

#REPASO CONSULTAS SOBRE UNA TABLA, MULTITABLA (Composición Externa e Interna)

#1. Calcula la suma del presupuesto de todos los departamentos.
SELECT SUM(presupuesto)
FROM departamento;


#2. Calcula la media del presupuesto de todos los departamentos.
SELECT AVG(presupuesto)
FROM departamento;


#3. Calcula el valor mínimo del presupuesto de todos los departamentos.
SELECT MIN(presupuesto)
FROM departamento;


#4. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.
SELECT nombre, MIN(presupuesto)
FROM departamento
ORDER BY presupuesto ASC;


#5. Calcula el valor máximo del presupuesto de todos los departamentos.
SELECT MAX(presupuesto)
FROM departamento;


#6. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.
SELECT nombre, MAX(presupuesto)
FROM departamento
ORDER BY presupuesto ASC;


#7. Calcula el número total de empleados que hay en la tabla empleado.
SELECT COUNT(codigo)
FROM empleado;


#8. Calcula el número de empleados que no tienen NULL en su segundo apellido.
SELECT COUNT(codigo)
FROM empleado
WHERE apellido2 IS NOT NULL;


#9. Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.

SELECT COUNT(empleado.codigo) AS NúmeroEmpleados, departamento.nombre AS NombreDepartamento
FROM departamento, empleado
WHERE departamento.codigo = empleado.codigo_departamento
GROUP BY departamento.nombre;


#10. Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe tener dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.
SELECT COUNT(empleado.codigo) AS NúmeroEmpleados, departamento.nombre AS NombreDepartamento
FROM departamento, empleado
WHERE departamento.codigo = empleado.codigo_departamento AND empleado.codigo_departamento>2
GROUP BY departamento.nombre;

---------------------------------

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

------------------------------------------------------------------------------------------------

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

----------------------------------------------------

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

----------------------------------------------------------

#SUBCONSULTAS

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

-----------------------------------------------------------------------------

/* Subconsultas */
USE empleados;

#Con operadores básicos de comparación
    
#1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).
SELECT nombre
FROM empleado
WHERE codigo_departamento=(
	SELECT codigo
    FROM departamento
    WHERE nombre="Sistemas");


#2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto=(
	SELECT MAX(presupuesto)
    FROM departamento);


#3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto=(
	SELECT MIN(presupuesto)
    FROM departamento);


#Subconsultas con ALL y ANY
    
#4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto>= ALL(
	SELECT presupuesto
    FROM departamento);


#5. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto<= ALL(
	SELECT presupuesto
    FROM departamento);


#6. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).
SELECT nombre 
FROM departamento
WHERE codigo = ANY(
SELECT codigo_departamento FROM empleado);
  
  
#7. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).
SELECT nombre 
FROM departamento
WHERE codigo != ALL(
SELECT codigo_departamento 
FROM empleado
WHERE departamento.codigo = empleado.codigo_departamento);


#Subconsultas con IN y NOT IN

#9. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).
SELECT nombre 
FROM departamento
WHERE codigo NOT IN(
SELECT codigo_departamento FROM empleado
WHERE departamento.codigo = empleado.codigo_departamento);


    #Subconsultas con EXISTS y NOT EXISTS

#10. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre 
FROM departamento
WHERE EXISTS(
SELECT codigo_departamento FROM empleado);
    
    
#11. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre 
FROM departamento
WHERE NOT EXISTS(
SELECT codigo_departamento FROM empleado
WHERE departamento.codigo = empleado.codigo_departamento);

----------------------------------------------------------------

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
    
---------------------------------------------------------------------

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

----------------------------------------------------------------------------

# Creación da Base de Datos "tarefa41".

DROP DATABASE IF EXISTS tarefa41;
CREATE DATABASE IF NOT EXISTS tarefa41;
USE tarefa41;

#*Sentenza 1: crea unha táboa paises que inclúa as columnas id_pais, nome_pais e id_continente.

CREATE TABLE paises (
	id_pais INT,
	nome_pais VARCHAR(30), 
	id_continente INT,
	CONSTRAINT PK_pais PRIMARY KEY (id_pais)
);



#Sentenza 2: crea, comprobando se existe, a táboa paises.

CREATE TABLE IF NOT EXISTS paises (
	id_pais INT,
	nome_pais VARCHAR(30), 
	id_continente INT,
	CONSTRAINT PK_pais PRIMARY KEY (id_pais)
);



#Sentenza 3: crea unha táboa dup_paises que teña a mesma estrutura da táboa paises.

CREATE TABLE IF NOT EXISTS dup_paises LIKE paises;



#Sentenza 4: crea unha táboa dup_paises que teña a mesma estrutura da táboa paises (sen contar as restricións) e que conteña todos os datos incluídos nesta última.

CREATE TABLE IF NOT EXISTS dup_paises AS SELECT * FROM paises;



#Sentenza 5: crea unha táboa paises de xeito que ningunha das súas columnas admita nulos.

CREATE TABLE IF NOT EXISTS paises (
	id_pais INT NOT NULL,
	nome_pais VARCHAR(30) NOT NULL, 
	id_continente INT NOT NULL,
	CONSTRAINT PK_paises PRIMARY KEY (id_pais)
);



#Sentenza 6: crea una táboa categorias que inclúa as columnas id_categoria, descricion, salario_min e salario_max.

CREATE TABLE IF NOT EXISTS categorias (
	id_categoria INT,
	descricion VARCHAR(30),
	salario_min INT,
	salario_max INT,
	CONSTRAINT PK_categorias PRIMARY KEY(id_categoria)
);



#Sentenza 7: crea a táboa categorías comprobando que o salario máximo non exceda o límite de 25.000.

CREATE TABLE IF NOT EXISTS categorias (
	id_categoria INT,
	descricion VARCHAR(30),
	salario_min INT,
	salario_max INT,
	CONSTRAINT PK_categorias PRIMARY KEY(id_categoria),
	CONSTRAINT CK_categorias CHECK(salario_max<=25000)
);



#Sentenza 8: crea a táboa paises de xeito que no campo nome_pais só poda introducirse Italia, India ou China.

#Opción1 con SET
CREATE TABLE IF NOT EXISTS paises (
	id_pais INT NOT NULL,
	nome_pais SET("Italia","India","China") NOT NULL, 
	id_continente INT NOT NULL,
	CONSTRAINT PK_paises PRIMARY KEY (id_pais)
); 



#Opción2 con CHECK
CREATE TABLE IF NOT EXISTS paises (
	id_pais INT NOT NULL,
	nome_pais VARCHAR(30) CHECK(nome_pais IN("Italia","India","China"))  NOT NULL, 
	id_continente INT NOT NULL,
	CONSTRAINT PK_paises PRIMARY KEY (id_pais)	
);



#Opción3 con CHECK
CREATE TABLE IF NOT EXISTS paises (
	id_pais INT NOT NULL,
	nome_pais VARCHAR(30) NOT NULL, 
	id_continente INT NOT NULL,
	CONSTRAINT PK_paises PRIMARY KEY (id_pais),
	CONSTRAINT Check_paises CHECK (nome_pais IN("Italia","India","China")) 
);



INSERT INTO paises
VALUES("1","Italia","1"); #OK

INSERT INTO paises
VALUES("2","AMERICA","2"); #Tiene que dar error.



#Sentenza 9: crea unha táboa historial_categorias que inclúa as columnas id_empregado, data_inicio, data_fin, id_categoria e id_departamento.

CREATE TABLE IF NOT EXISTS historial_categorias (
	id_empregado INT,
	data_inicio DATE,
	data_fin DATE,
	id_categoria INT,
	id_departamento INT,
	CONSTRAINT PK_historial_categorias PRIMARY KEY(id_empregado)
);
	


#Sentenza 10: crea a táboa historial_categorias comprobando que data_fin sexa posterior ou igual a data_inicio.

CREATE TABLE IF NOT EXISTS historial_categorias (
	id_empregado INT,
	data_inicio DATE,
	data_fin DATE,
	id_categoria INT,
	id_departamento INT,
	CONSTRAINT PK_historial_categorias PRIMARY KEY(id_empregado),
	CONSTRAINT CK_historial_categorias CHECK(data_fin>=data_inicio)
);
	
	

#Sentenza 11: crea a táboa paises asegurando que o campo id_pais sexa clave primaria.

CREATE TABLE IF NOT EXISTS paises (
	id_pais INT NOT NULL,
	nome_pais SET("Italia","India","China") NOT NULL, 
	id_continente INT NOT NULL,
	CONSTRAINT PK_paises PRIMARY KEY (id_pais)
);



/* Sentenza 12: crea a táboa categorias asegurando que o valor por defecto para descricion sexa unha cadea de texto baleira, 
 que o salario mínimo sexa 8.000 e que o salario máximo teña valor por defecto nulo. */

CREATE TABLE IF NOT EXISTS categorias (
	id_categoria INT,
	descricion VARCHAR(30) DEFAULT " ",
	salario_min DOUBLE,
	salario_max DOUBLE DEFAULT NULL,
	CONSTRAINT PK_categorias PRIMARY KEY(id_categoria),
	CONSTRAINT CK_categorias CHECK(salario_max<=25000), CHECK(salario_min>=8000)
);



#Sentenza 13: crea a táboa paises asegurando que o campo id_pais sexa autoincremental.

CREATE TABLE IF NOT EXISTS paises (
	id_pais INT AUTO_INCREMENT NOT NULL,
	nome_pais SET("Italia","India","China") NOT NULL, 
	id_continente INT NOT NULL,
	CONSTRAINT PK_paises PRIMARY KEY (id_pais)
);



#Sentenza 14: crea a táboa paises de xeito que a combinación das columnas nome_pais e id_continente teña valor único.

CREATE TABLE paises ( 
    id_pais INT NOT NULL AUTO_INCREMENT, 
    nome_pais SET ('Italia', 'India', 'China')NOT NULL, 
    id_continente INT NOT NULL, 
    CONSTRAINT PK_paises PRIMARY KEY (id_pais), 
    CONSTRAINT UI_paises UNIQUE INDEX (nome_pais, id_continente) #Unir 2 en 1 para que tengan valor único.
); 
 
 
 
#Sentenza 15: crea a táboa categorias con id_categoria coma clave primaria.

CREATE TABLE IF NOT EXISTS categorias (
	id_categoria INT,
	descricion VARCHAR(30) DEFAULT " ",
	salario_min INT,
	salario_max INT DEFAULT NULL,
	CONSTRAINT PK_categorias PRIMARY KEY(id_categoria),
	CONSTRAINT CK_categorias CHECK(salario_max<=25000), CHECK(salario_min>=8000)
);



/* Sentenza 16: crea a táboa historial_categorias de xeito que id_empregado non admita duplicados, 
e que id_categoria sexa unha clave foránea con respecto a categorias asegurando que os datos existen en nesta táboa. */

CREATE TABLE IF NOT EXISTS historial_categorias (
	id_empregado INT,
	data_inicio DATE,
	data_fin DATE,
	id_categoria INT,
	id_departamento INT,
	CONSTRAINT PK_historial_categorias PRIMARY KEY(id_empregado),
	CONSTRAINT CK_historial_categorias CHECK(data_fin>=data_inicio),
	CONSTRAINT FK_historial_categorias FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria),
	CONSTRAINT UN_historial_categorias UNIQUE(id_empregado)
);



#Sentenza 17: crea a táboa departamentos que inclúa as columnas id_departamento (que será clave primaria), nome e localizacion.

CREATE TABLE IF NOT EXISTS departamentos (
	id_departamento INT NOT NULL,
	nome VARCHAR(30),
	localización VARCHAR(30),
	CONSTRAINT PK_departamentos PRIMARY KEY(id_departamento)
);



/* Sentenza 18: crea a táboa empregados que inclúa as columnas id_empregado, nome, apelido1,apelido2, email, telefono, data_alta, id_categoria, salario, comision, 
id_responsable, e id_departamento. Faino de xeito que id_empregado sexa clave primaria, 
id_categoria unha clave foránea facendo referencia á táboa categorias e id_departamento unha clave foránea facendo referencia á táboa departamentos. */


CREATE TABLE IF NOT EXISTS empregados (
	id_empregado INT,
	nome VARCHAR(30),
	apelido1 VARCHAR(30),
	apelido2 VARCHAR(30),
	email VARCHAR(30),
	telefono INT,
	data_alta DATE,
	id_categoria INT,
	salario DOUBLE,
	comision DOUBLE,
	id_responsable INT,
	id_departamento INT,
	CONSTRAINT PK_empregados PRIMARY KEY(id_empregado),
	CONSTRAINT FK_empregados FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria)
	CONSTRAINT FK_empregados FOREIGN KEY(id_departamento) REFERENCES departamentos(id_departamento)
);



#Sentenza 19: crea a táboa empregados de xeito que as claves foráneas id_categoria e id_departamento impida os borrados e produza actualizacións en cascada.

CREATE TABLE IF NOT EXISTS empregados (
	id_empregado INT,
	nome VARCHAR(30),
	apelido1 VARCHAR(30),
	apelido2 VARCHAR(30),
	email VARCHAR(30),
	telefono INT,
	data_alta DATE,
	id_categoria INT,
	salario DOUBLE,
	comision DOUBLE,
	id_responsable INT,
	id_departamento INT,
	CONSTRAINT PK_empregados PRIMARY KEY(id_empregado),
	CONSTRAINT FK_empregados FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT FK_empregados FOREIGN KEY(id_departamento) REFERENCES departamentos(id_departamento) ON UPDATE CASCADE ON DELETE RESTRICT
);



#Sentenza 20: crea a táboa empregados de xeito que o salario non poda ser inferior a 1000.

CREATE TABLE IF NOT EXISTS empregados (
	id_empregado INT,
	nome VARCHAR(30),
	apelido1 VARCHAR(30),
	apelido2 VARCHAR(30),
	email VARCHAR(30),
	telefono INT,
	data_alta DATE,
	id_categoria INT,
	salario DOUBLE,
	comision DOUBLE,
	id_responsable INT,
	id_departamento INT,
	CONSTRAINT PK_empregados PRIMARY KEY(id_empregado),
	CONSTRAINT FK_empregados FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT FK_empregados FOREIGN KEY(id_departamento) REFERENCES departamentos(id_departamento) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT CK_empregados CHECK(salario>=1000)
);

-------------------------------------------------------

DROP DATABASE IF EXISTS obradoiro;
CREATE DATABASE obradoiro;
USE obradoiro;

CREATE TABLE IF NOT EXISTS alumno (
	id_alumno INT AUTO_INCREMENT,
	dni VARCHAR(10),
	nome VARCHAR(50),
	apelido1 VARCHAR(50),
	apelido2 VARCHAR(50),
	grupo VARCHAR(2),
	CONSTRAINT PK_alumno PRIMARY KEY (id_alumno)
);

CREATE TABLE IF NOT EXISTS exame_teorico (
	id_exame INT AUTO_INCREMENT,
    titulo VARCHAR(50),
    numero_preguntas INT,
    Fecha DATE,
    CONSTRAINT PK_exame PRIMARY KEY (id_exame)
    );

CREATE TABLE IF NOT EXISTS alumno_fai_exame_teorico (
    id_alumno INT,
    id_exame INT,
    nota INT,
    CONSTRAINT PK_alumno_exame PRIMARY KEY (id_alumno, id_exame),
    CONSTRAINT FK_alumno FOREIGN KEY(id_alumno) REFERENCES alumno(id_alumno),
    CONSTRAINT FK_exame FOREIGN KEY(id_exame) REFERENCES exame_teorico(id_exame)
    );
    
    # Inserción datos en "alumno"
    INSERT INTO alumno VALUES ("1", "45762345M","Ricardo","Gómez","Costa","1");
    INSERT INTO alumno VALUES ("2","45762345M","Ana","Albela","García","1");
    INSERT INTO alumno VALUES ("3","45262345M","Tamara","Ares","Gestoso","1");
    INSERT INTO alumno VALUES ("4","45762365M","Antía","Castro","Barrio","1");
	INSERT INTO alumno VALUES ("5","45762545M","Judith","González","Taboada","1");
    INSERT INTO alumno VALUES ("6","46762345M","Nicolás","Golan","Mosquera","1");
    INSERT INTO alumno VALUES ("7","45762345M","David","Fernández","Soto","1");
    INSERT INTO alumno VALUES ("8","45762347M","Sonia","Vázquez","Núñez","1");
	INSERT INTO alumno VALUES ("9","35762345M","María","López","Martínez","1");
    INSERT INTO alumno VALUES ("10","25762345M","Adrián","Pereiro","González","1");
    INSERT INTO alumno VALUES ("11","45764345M","Sonia","López","Puente","1");
    INSERT INTO alumno VALUES ("12","47762345M","Agustín","Prevettoni","Novoa","1");
	INSERT INTO alumno VALUES ("13","45762845M","Aitana","Ferradáns","Sánchez","1");
    INSERT INTO alumno VALUES ("14","45262345M","Alex","Sánchez","Rey","1");
    INSERT INTO alumno VALUES ("15","45762375M","Tatiana","García","Canicoba","1");
    INSERT INTO alumno VALUES ("16","45702345M","Sonia","Gómez","López","1");
    
	#Inserción datos en "exame_teorico"
    INSERT INTO exame_teorico VALUES ( "1","Bases de datos","20","2022/10/01");
    INSERT INTO exame_teorico VALUES ( "2","Programación","25","2022/10/02");
    
    #Inserción datos en "alumno_fai_exame_teorico"
	INSERT INTO alumno_fai_exame_teorico VALUES ("1","1","8");
    INSERT INTO alumno_fai_exame_teorico VALUES ("1","2","5");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("2","1","8");
    INSERT INTO alumno_fai_exame_teorico VALUES ("2","2","6");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("3","1","7");
    INSERT INTO alumno_fai_exame_teorico VALUES ("3","2","6");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("4","1","8");
    INSERT INTO alumno_fai_exame_teorico VALUES ("4","2","5");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("5","1","8");
    INSERT INTO alumno_fai_exame_teorico VALUES ("5","2","6");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("6","1","7");
    INSERT INTO alumno_fai_exame_teorico VALUES ("6","2","6");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("7","1","7");
    INSERT INTO alumno_fai_exame_teorico VALUES ("7","2","7");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("8","1","6");
    INSERT INTO alumno_fai_exame_teorico VALUES ("8","2","8");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("9","1","8");
    INSERT INTO alumno_fai_exame_teorico VALUES ("9","2","5");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("10","1","5");
    INSERT INTO alumno_fai_exame_teorico VALUES ("10","2","8");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("11","1","6");
    INSERT INTO alumno_fai_exame_teorico VALUES ("11","2","6");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("12","1","7");
    INSERT INTO alumno_fai_exame_teorico VALUES ("12","2","7");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("13","1","5");
    INSERT INTO alumno_fai_exame_teorico VALUES ("13","2","7");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("14","1","7");
    INSERT INTO alumno_fai_exame_teorico VALUES ("14","2","5");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("15","1","6");
    INSERT INTO alumno_fai_exame_teorico VALUES ("15","2","7");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("16","1","8");
    INSERT INTO alumno_fai_exame_teorico VALUES ("16","2","5");
    

# 2.1. Unha consulta sobre a taboa alumnos.
SELECT * FROM alumno;


# 2.2. Unha consulta sobre a taboa Exame_teórico.
SELECT * FROM exame_teorico;


# 2.3. Una consulta que de como resultado o nome do alumno cos apelidos, a nota do examen e o examen co que corresponde.

# Examen de Bases de datos:
SELECT alumno.nome, alumno.apelido1, alumno.apelido2, alumno_fai_exame_teorico.nota, id_exame
FROM alumno, alumno_fai_exame_teorico
WHERE alumno.id_alumno = alumno_fai_exame_teorico.id_alumno AND id_exame=1;

SELECT alumno.nome, alumno.apelido1, alumno.apelido2, alumno_fai_exame_teorico.nota, alumno_fai_exame_teorico.id_exame, exame_teorico.titulo
FROM alumno 
INNER JOIN alumno_fai_exame_teorico ON alumno.id_alumno = alumno_fai_exame_teorico.id_alumno
INNER JOIN exame_teorico ON alumno_fai_exame_teorico.id_exame = exame_teorico.id_exame
WHERE alumno_fai_exame_teorico.id_exame=1;

# Examen de Programación:
SELECT alumno.nome, alumno.apelido1, alumno.apelido2, alumno_fai_exame_teorico.nota, id_exame
FROM alumno, alumno_fai_exame_teorico
WHERE alumno.id_alumno = alumno_fai_exame_teorico.id_alumno AND id_exame=2;
    
SELECT alumno.nome, alumno.apelido1, alumno.apelido2, alumno_fai_exame_teorico.nota, alumno_fai_exame_teorico.id_exame, exame_teorico.titulo
FROM alumno 
INNER JOIN alumno_fai_exame_teorico ON alumno.id_alumno = alumno_fai_exame_teorico.id_alumno
INNER JOIN exame_teorico ON alumno_fai_exame_teorico.id_exame = exame_teorico.id_exame
WHERE alumno_fai_exame_teorico.id_exame=2;

---------------------------------------------------------------------------------------------------

DROP DATABASE IF EXISTS empresa;
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

CREATE TABLE departamentos(
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    concello VARCHAR(50) NOT NULL,
    orzamento DECIMAL(10) NOT NULL,
    CONSTRAINT pk_departamentos PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS empregados(
    numero INT NOT NULL AUTO_INCREMENT,
	departamento INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    salario FLOAT(10) NOT NULL,
    data_alta DATE NOT NULL,
    xefe VARCHAR(50) NOT NULL,
    CONSTRAINT pk_empregados PRIMARY KEY (numero),
    CONSTRAINT fk_empregados FOREIGN KEY (departamento) REFERENCES departamentos(id)
);

INSERT INTO departamentos VALUES (1,"Ventas","Vedra",01);
INSERT INTO departamentos VALUES (2,"Compras","Teo",02);
INSERT INTO departamentos VALUES (3,"Alquileres","Boqueixón",03);
INSERT INTO departamentos VALUES (4,"Marketing","Santiago",04);
INSERT INTO departamentos VALUES (5,"Logística","Ames",05);

INSERT INTO empregados VALUES (1,1,"Ana","1080.49","2009/10/02","Sonia");
INSERT INTO empregados VALUES (2,5,"Tamara","1080.51","2008/11/03","Tatiana");
INSERT INTO empregados VALUES (3,4,"Antía","1081.69","2009/10/02","Alexandre");
INSERT INTO empregados VALUES (4,3,"Judith","1082.11","2008/11/03","Aitana");
INSERT INTO empregados VALUES (5,2,"Nicolás","1084.89","2009/10/02","María");
INSERT INTO empregados VALUES (6,2,"Ricardo","1070.43","2010/11/02","Sonia");
INSERT INTO empregados VALUES (7,5,"David","1000.31","2006/06/03","Tatiana");


#Unha vez realizada a Base de datos responde as seguintes consultas:
#1. Queremos coñecer, para cada empregado da organización, o seu número de empregado, nome e o nome do departamento ao cal pertence.
SELECT numero, nome, departamento
FROM empregados;

#2. Queremos coñecer a media de salarios da organización.
SELECT AVG(salario)
FROM empregados;

#3. Queremos coñecer a media de salarios da organización agrupados por departamentos.
SELECT AVG(salario), departamento
FROM empregados
GROUP BY departamento;

#4. Queremos coñecer, para cada empregado, o nome do seu xefe.
SELECT nome, xefe
FROM empregados;

#5. Queremos coñecer, para cada empregado, o departamento no que traballa e o seu xefe.
SELECT empregados.nome, empregados.xefe,empregados.departamento, departamentos.nome
FROM empregados, departamentos
WHERE empregados.departamento=departamentos.id;

#6. Queremos coñecer, para cada empregado, o nome do seu xefe e o departamento no que traballa ese xefe. 
SELECT nome, xefe, departamento
FROM empregados;

---------------------------------------------