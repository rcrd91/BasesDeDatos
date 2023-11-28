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