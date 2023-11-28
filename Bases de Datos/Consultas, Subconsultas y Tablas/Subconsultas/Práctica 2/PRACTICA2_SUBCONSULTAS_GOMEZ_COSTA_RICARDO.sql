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