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
