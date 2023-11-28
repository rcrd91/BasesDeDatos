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
