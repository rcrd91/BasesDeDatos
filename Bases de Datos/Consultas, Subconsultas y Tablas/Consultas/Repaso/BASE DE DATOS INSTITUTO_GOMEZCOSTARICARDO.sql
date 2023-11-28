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