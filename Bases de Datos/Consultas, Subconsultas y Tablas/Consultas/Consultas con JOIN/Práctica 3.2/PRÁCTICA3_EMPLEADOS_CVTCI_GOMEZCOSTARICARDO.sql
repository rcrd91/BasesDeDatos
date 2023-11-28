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



