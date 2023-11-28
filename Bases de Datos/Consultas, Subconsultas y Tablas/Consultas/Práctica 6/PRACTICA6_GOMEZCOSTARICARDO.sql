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

