/*Realiza un procedimiento para insertar un articulo nuevo tabla Artículo. Este procedimiento recibirá como
parámetros el CodArt, DesArt y PVPArt. Muestra al final un mensaje que indique ‘Se ha añadido el artículo
{Nombre Artículo}.*/ 


USE pedidos;
DROP PROCEDURE IF EXISTS insertar_articulo;

DELIMITER //
CREATE PROCEDURE insertar_articulo(IN CodigoArticulo CHAR(5) , DescripcionArticulo VARCHAR(30), PrecioArticulo FLOAT)
BEGIN
    INSERT INTO articulo VALUES(CodigoArticulo, DescripcionArticulo, PrecioArticulo);
END;
//



/* Crear un procedimiento que añada un nuevo pedido a la tabla Pedido con datos pasados como parámetro.
Por tanto, este procedimiento recibirá como parámetro la referencia del pedido y la fecha. Muestra al final un
mensaje que indique ‘Se ha añadido un pedido con referencia {referencia del pedido añadido}. */

USE pedidos;
DROP PROCEDURE IF EXISTS insertar_pedido;

DELIMITER //
CREATE PROCEDURE insertar_pedido (IN ReferenciaPedido CHAR(5), FechaPedido DATE)
BEGIN

INSERT INTO pedido VALUES( ReferenciaPedido, FechaPedido);

SELECT CONCAT ("Se ha añadido un pedido con referencia ", ReferenciaPedido);
    
END;
//



/* Realiza un procedimiento que se llame calcular_max_min_media, que reciba como parámetro de entrada el
Código del Articulo y devuelva como salida 3 parámetros. El precio máximo, mínimo y la media del producto. */

USE pedidos;
DROP PROCEDURE IF EXISTS calcular_max_min_media;

DELIMITER //
CREATE PROCEDURE calcular_max_min_media (IN CodigoArticulo CHAR(5), OUT Maximo FLOAT, OUT Minimo FLOAT, OUT Medio FLOAT)
BEGIN
	
SET Maximo =(
	SELECT MAX(PVPArt)
	FROM articulo
	WHERE articulo.CodArt = CodigoArticulo);
        
SET Minimo =(
	SELECT MIN(PVPArt)
	FROM articulo
	WHERE articulo.CodArt = CodigoArticulo);
        
SET Medio =(
	SELECT AVG(PVPArt)
	FROM articulo
	WHERE articulo.CodArt = CodigoArticulo);
    
END;
//
	

        
/* Realizar un procedimiento que reciba como parámetro de entrada la referencia de un pedido (refPedido) y
nos devuelva como parámetros de salida el número de artículos diferentes solicitados en dicho pedido
(NumArt) y el número de unidades de artículos (NumUniArt). */

USE pedidos;
DROP PROCEDURE IF EXISTS procedimientoArticulos;

DELIMITER //
CREATE PROCEDURE procedimientoArticulos (IN ReferenciaPedido CHAR(5), OUT CodigoArticulo CHAR(5), OUT CantidadArticulo INT)
BEGIN

SET CodigoArticulo =(
	SELECT SUM(CantArt)
	FROM lineapedido
	WHERE lineapedido.CodArt = ReferenciaPedido);
        
SET CantidadArticulo =(
	SELECT COUNT(CodArt)
	FROM lineapedido
	WHERE lineapedido.CodArt = ReferenciaPedido);
    
END;
//
    


---------------------------------------------------------------------------------------------------------------------------------------------------

/* Ejemplo de como declarar y usar una variable en un procedimiento. */

USE pedidos;
DROP PROCEDURE IF EXISTS PedidosTotal;

DELIMITER //
CREATE PROCEDURE PedidosTotal()
BEGIN

DECLARE pedidosTotal INT DEFAULT 0;
SELECT COUNT(*) INTO pedidosTotal
FROM pedido;
        
SELECT pedidosTotal;
        
END;
//
    
    
    
---------------------------------------------------------------------------------------------------------------------------------------------------

/* Escribir un procedimiento que muestre en pantalla la descripción y el precio del artículo más barato de de la tabla Articulo. */

USE pedidos;
DROP PROCEDURE IF EXISTS DescripcionPrecioArticulo;

DELIMITER //
CREATE PROCEDURE DescripcionPrecioArticulo()
BEGIN

DECLARE descripcion VARCHAR(30);
DECLARE masbarato FLOAT;
        
SELECT MIN(PVPArt), DesArt INTO masbarato,descripcion
FROM articulo;
SELECT masbarato, descripcion;

END;
//
    


/* Crear un procedimiento que reciba la referencia de un pedido y muestre en pantalla
dicha referencia y la fecha del pedido y a continuación se encargue de eliminarlo de
la base de datos. Debe mostrarse un mensaje para cada instrucción. */

USE pedidos;
DROP PROCEDURE IF EXISTS eliminarPedido;
    
DELIMITER //
CREATE PROCEDURE eliminarPedido (IN Referencia CHAR(5))
BEGIN

DECLARE Fecha DATE;
        
SELECT FecPed  INTO Fecha
FROM pedido 
WHERE pedido.RefPed = Referencia;
        
SELECT CONCAT("Pedido", Referencia, " ", "Fecha:", Fecha) Mensaje;
        
DELETE FROM pedido WHERE pedido.RefPed = Referencia;
        
SELECT CONCAT("Pedido:", Referencia, " ", "Eliminado");

END;
//



---------------------------------------------------------------------------------------------------------------------------------------------------

/* EJERCICIOS PROCEDIMIENTOS Y FUNCIONES. */

/* 1. Crea un procedimiento que muestre el nombre del empleado a partir del codigo de empleado. */

USE empleados;
DROP PROCEDURE IF EXISTS nombreEmpleado;

DELIMITER //
CREATE PROCEDURE nombreEmpleado (IN codigoEmpleado INT, OUT nombreEmpleado VARCHAR(100))
BEGIN

SET nombreEmpleado =(
	SELECT nombre
	FROM empleado
	WHERE empleado.codigo = codigoEmpleado);
    
END;
//



/* 2. Crea un procedimiento que muestre el numero de empleados sin parámetro de entrada 
(Hazlo primero empleando variables y luego vuelve a repetir el ejercicio empleando parámetros de salida). */
#Con parámetro de salida(OUT)

USE empleados;
DROP PROCEDURE IF EXISTS numeroEmpleados;

DELIMITER //
CREATE PROCEDURE numeroEmpleados (OUT cantidadEmpleados INT)
BEGIN

SET cantidadEmpleados =(
	SELECT COUNT(codigo)
	FROM empleado);
    
END;
//



/* Con Variables */

DELIMITER //
CREATE PROCEDURE numeroEmpleadoss()
BEGIN

DECLARE cantidad INT;

SELECT COUNT(codigo) INTO cantidad
FROM empleado;
            
SELECT cantidad;

END;
//



/* 3. Crea un procedimiento que muestre el numero de empleados por codigo departamento.
El departamento será pasado por parámetro de entrada y será el nombre del departamento. */

USE empleados;
DROP PROCEDURE IF EXISTS numeroEmpleadosCodigo;

DELIMITER //
CREATE PROCEDURE numeroEmpleadosCodigo(IN departamentoo VARCHAR(100), OUT numeroEmpleados INT)
BEGIN
    
SET numeroEmpleados=(
	SELECT COUNT(empleado.codigo)
	FROM empleado, departamento
	WHERE empleado.codigo_departamento=departamento.codigo AND departamento.nombre = departamentoo);
            
END;
//
    
    
    
/* 4. Crea un procedimiento (y si tienes tiempo una función) que dándole dos números devuelva la suma de ambos. */

USE empleados;
DROP PROCEDURE IF EXISTS sumaNumeros;

DELIMITER //
CREATE PROCEDURE suma(IN entrada1 INT, IN entrada2 INT, OUT salida INT)
	BEGIN
    
SET salida = entrada1 + entrada2;

END;
//



USE empleados;
DROP PROCEDURE IF EXISTS sumaNumeros;

DELIMITER //
CREATE PROCEDURE sumaNumeros (IN num1 INT, IN num2 INT)
BEGIN

DECLARE suma INT;
SET suma = num1 + num2;
    
SELECT suma;
    
END;
//



/*Función:*/

USE empleados;
DROP PROCEDURE IF EXISTS sumaNumeros;

DELIMITER //
CREATE FUNCTION sumaNumeros (num1 INT, num2 INT) RETURNS INT
DETERMINISTIC
BEGIN

DECLARE suma INT;
SET suma = num1 + num2;
    
RETURN suma;
    
END;
//


---------------------------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE ProcedementosAlmacenados;

USE ProcedementosAlmacenados; 

DELIMITER //
CREATE PROCEDURE evaluarNumero()
BEGIN

DECLARE vNumero INT;
SET vNumero = 92;


IF vNumero % 2 = 0 THEN

	IF vNumero % 10 = 0 THEN
		SELECT "Número par y múltiplo de 10";
	ELSE
		SELECT "Número par que no es múltiplo de 10";
		
	END IF;

	ELSE
		SELECT ‘Número impar’;
    
END IF;

END;
//
        



/* Crea un procedimiento en el que el usuario indique su edad y muestre por pantalla
si es mayor de edad o no. */

USE ProcedementosAlmacenados;
DROP PROCEDURE IF EXISTS ProcedementosAlmacenados;

DELIMITER //
CREATE PROCEDURE usuarioEdad(IN p_edad INT)
BEGIN

IF p_edad >= 18 THEN
	SELECT "Eres mayor de edad";
ELSE
	SELECT "Eres menor de edad";
    
END IF;

END;
//
        



USE ProcedementosAlmacenados;
DROP PROCEDURE IF EXISTS evaluarNumero;

USE instituto;

DELIMITER //
CREATE PROCEDURE AlumnoEdad (IN p_nombre VARCHAR (50))
BEGIN

DECLARE fecha DATE;
SELECT fecha_nacimiento INTO fecha
FROM alumno WHERE nombre = p_nombre;

IF fecha >= "2004-01-01" THEN 
	SELECT "Menor de edad";
ELSE 
	SELECT "Mayor de edad";
    
END IF;

END;
//



/* Para tributar un determinado impuesto se debe ser mayor de 16 años y tener unos
ingresos superiores a 1000 € mensuales. Crea un procedimiento en el que el usuario
indique su edad y sus ingresos mensuales y muestre por pantalla si el usuario tiene
que tributar o no. */

USE ProcedementosAlmacenados;
DROP PROCEDURE IF EXISTS Tributar;

DELIMITER //
CREATE PROCEDURE Tributar (IN p_edad INT, IN p_ingresos INT)
	BEGIN
    
DECLARE ingresos INT;
DECLARE edad INT;
SET ingresos = p_ingresos;
SET edad = p_edad;
        
IF edad > 16 THEN
IF ingresos > 1000 THEN 
	SELECT "Tiene que tributar";
ELSE
	SELECT "No tiene que tributar";
    
END IF;
                
ELSE
	SELECT "No tiene que tributar";
				
END IF;

	END;
	//
    
---------------------------------------------------------------------------------------------------------------------------------------------------

/* Crear un procedimiento en el que insertes la renta anual y muestre por pantalla el tipo impositivo que le corresponde. 
Los tramos impositivos para la declaración de la renta en un determinado país son los siguientes:

Renta	                |  Tipo impositivo
Menos de 10000€	        |        5%
Entre 10000€ y 20000€	|        15%
Entre 20000€ y 35000€	|        20%
Entre 35000€ y 60000€	|        30%
Más de 60000€	        |        45%

*/

USE ProcedementosAlmacenados;
DROP PROCEDURE IF EXISTS declaracionRenta1;

DELIMITER //
CREATE PROCEDURE declaracionRenta1(IN p_renta INT)
BEGIN

DECLARE cantidad INT;
SET cantidad = p_renta;


IF cantidad < 10000 THEN
	SELECT "El tipo de dato impositivo es 5%";
END IF;


IF cantidad BETWEEN 10000 AND 20000 THEN
	SELECT "El tipo de dato impositivo es 15%";
END IF;
	
	
IF cantidad BETWEEN 20000 AND 35000 THEN
	SELECT "El tipo de dato impositivo es 20%";
END IF;
	
	
IF cantidad BETWEEN 35000 AND 60000 THEN
	SELECT "El tipo de dato impositivo es 30%";
END IF;
	
	
IF cantidad > 60000 THEN
	SELECT "El tipo de dato impositivo es 45%";
END IF;


END;
//



/*2. En una determinada empresa, sus empleados son evaluados al final de cada año. 
Los puntos que pueden obtener en la evaluación comienzan en 0.0 y pueden ir aumentando, traduciéndose en mejores beneficios. 
Los puntos que pueden conseguir los empleados pueden ser 0.0, 0.4, 0.6 o más pero no valores intermedios entre las cifras mencionadas.
A continuación se muestra una tabla con los niveles correspondientes a cada puntuación. 
La cantidad de dinero conseguida en cada nivel es de 2.400€ multiplicada por la puntuación del nivel.

Crear un procedimiento en el que introduzcas la puntuación y a continuación muestre su nivel de rendimiento,
así como la cantidad de dinero que recibirá el usuario. */

Nivel	         |     Puntuación
Inaceptable	     |       0.0
Aceptable	     |       0.4
Meritorio	     |     0.6 o más 


DROP PROCEDURE IF EXISTS  puntuacionEmpleadosDec;
USE ProcedementosAlmacenados;

DELIMITER //
CREATE PROCEDURE puntuacionEmpleadosDec (IN p_puntuacion DOUBLE)
BEGIN

DECLARE bonificacion INT;
DECLARE puntuacion DOUBLE;
SET bonificacion = 2400;
SET puntuacion = p_puntuacion;


IF puntuacion = 0 THEN
	SELECT CONCAT("Inaceptable, cantidad de dinero a recibir: ", 0 * bonificacion);

ELSEIF puntuacion = 0.4 THEN
	SELECT CONCAT("Aceptable, cantidad de dinero a recibir: ", 0.4 * bonificacion);

ELSEIF puntuacion >= 0.6 THEN
	SELECT CONCAT("Meritorio, cantidad de dinero a recibir: ", 0.6 * bonificacion);
    
END IF;


END;
//


/*#3. Crear un procedimiento para una empresa que tiene salas de juegos para todas las edades y quiere calcular de forma automática el precio que debe cobrar a sus clientes por entrar. 
El programa debe preguntar al usuario la edad del cliente y mostrar el precio de la entrada.
Si el cliente es menor de 4 años puede entrar gratis, si tiene entre 4 y 18 años debe pagar 5€ y si es mayor de 18 años debe pagar 10€.*/

USE ProcedementosAlmacenados;
DROP PROCEDURE IF EXISTS edadJugar;

DELIMITER //
CREATE PROCEDURE edadJugar (IN p_edad INT)
BEGIN

DECLARE edad INT;
SET edad = p_edad;

IF edad < 4 THEN
	SELECT "Puede entrar gratis";
END IF;

IF edad BETWEEN 4 AND 18 THEN
	SELECT "Tienes que pagar 5€";
END IF;

IF edad > 18 THEN
	SELECT "Tienes que pagar 10€";
END IF;

END;
//


USE ProcedementosAlmacenados;
DROP PROCEDURE IF EXISTS edadJugar1;


DELIMITER //
CREATE PROCEDURE edadJugar1 (IN p_edad INT)
BEGIN

DECLARE edad INT;
SET edad = p_edad;

IF edad < 4 THEN
	SELECT "Puede entrar gratis";
    
ELSEIF edad BETWEEN 4 AND 18 THEN
	SELECT "Tienes que pagar 5€";
    
ELSEIF edad > 18 THEN
	SELECT "Tienes que pagar 10€";
    
END IF;

END;
//



/* Crear un procedemiento que pida al usuario dos números y devuelva su división.
Si el usuario no introduce números debe devolver un aviso de error y si el divisor es cero también */

USE ProcedementosAlmacenados;
DROP PROCEDURE IF EXISTS divisiones1;

DELIMITER //
CREATE PROCEDURE divisiones1 (IN p_numero1 INT, IN p_numero2 INT)
BEGIN

DECLARE divisiones1 DOUBLE;
SET divisiones1 = p_numero1 / p_numero2;

IF p_numero2 = 0 THEN SELECT "Error";
	ELSE SELECT Division;
END IF;

END;
//

/*#5. Escribe un procedimiento que devuelva el valor de la hipotenusa de un triángulo a partir de los valores de sus lados.*/

USE ProcedementosAlmacenados;
DROP PROCEDURE IF EXISTS hipotenusa;

DELIMITER //
CREATE PROCEDURE hipotenusa(IN lado1 INT, IN lado2 INT)
BEGIN

DECLARE hipotenusa DOUBLE;
DECLARE num1 INT;
DECLARE num2 INT;

SET num1 = POW(lado1,2);
SET num2 = POW(lado2,2);
SET hipotenusa = SQRT(num1+num2);

#SET hipotenusa = SQRT(POW(lado1,2) + POW(lado2,2));

SELECT hipotenusa;

END;
//

/*#6. Escribe una función que devuelva como salida el número de años que han transcurrido entre dos fechas que se reciben como parámetros de entrada. 
Por ejemplo, si pasamos como parámetros de entrada las fechas 2018-01-01 y 2008-01-01 la función tiene que devolver que han pasado 10 años.*/

/* Procedemento almacenado. */
USE ProcedementosAlmacenados;
DROP PROCEDURE IF EXISTS tiempoTranscurrido;

DELIMITER //
CREATE PROCEDURE tiempoTranscurrido(IN fecha1 DATE, IN fecha2 DATE)
BEGIN

DECLARE tiempo INT;

SET tiempo = DATEDIFF(fecha1,fecha2)/365;

IF fecha1 >= fecha2 THEN SELECT "error";
	ELSE SELECT tiempo;
END IF;

#SELECT tiempo;

END;
//

/* Procedemento almacenado con Condicional */
USE ProcedementosAlmacenados;
DROP PROCEDURE IF EXISTS tiempoTranscurrido;

DELIMITER //
CREATE PROCEDURE tiempoTranscurrido(IN fecha1 DATE, IN fecha2 DATE)
BEGIN

DECLARE tiempo INT;

SET tiempo = DATEDIFF(fecha1,fecha2)/365;

IF tiempo <= 0 THEN SELECT "error";
	ELSE SELECT tiempo;
END IF;

END;
//

/* Función */
USE ProcedementosAlmacenados;
DROP FUNCTION IF EXISTS tiempoTranscurrido;

DELIMITER //
CREATE FUNCTION tiempoTranscurrido (fecha1 DATE, fecha2 DATE) RETURNS INT
DETERMINISTIC
BEGIN

DECLARE tiempo INT;

SET tiempo = DATEDIFF(fecha1,fecha2)/365;

RETURN tiempo;

END;
//



/*Crear un procedimiento que actualice el salario de un empleado en función de su oficio y en el cual el parámetro de entrada sea su apellido.
Las condiciones de subida de salario son las siguientes: 

Si es presidente, le subiresmos el sueldo un 2%; si es director, un 3%; si es vendedor,
un 4%, y si tiene cualquier otro oficio, un 5%. 

Para ello, en primer lugar debes obtener el oficio del empleado (declarar una variable y asociarla 
a la tabla emple).

A continuación declarar otra variable en la que vas a almacenar el porcentaje de incremento del salario en función del oficio.
Para despues crear una estructura con las diferentes condiciones (ejemplo: IF v_oficio = 'PRESIDENTE' THEN SET v_porcentaje = 2).

Por último creas una sentencia para actualizar el salario y otra que que genere un mensaje que diga Se ha subido el salario a "p_apellido" un "v_porcentaje" %.*/
#PISTA. Sentencia para actualizar el salario: UPDATE tabla SET columna1 = columna1+columna1*v_porcentaje/100
#DATO. En caso de que salga en la consola: Error code: 1175. Escribir SET SQL_SAFE_UPDATES = 0; y ejecutar. A continuación volver a llamar al procedimiento.

USE empresa;
DROP PROCEDURE IF EXISTS salario;
SET SQL_SAFE_UPDATES = 0;

DELIMITER //
CREATE PROCEDURE salario (IN p_apellido VARCHAR(40))
BEGIN

DECLARE oficio VARCHAR(40);
DECLARE porcentaje DOUBLE;

SET oficio =(
	SELECT oficio 
    FROM emple
    WHERE emple.apellido=p_apellido);
	
    IF oficio = "PRESIDENTE" THEN 
		SET porcentaje=2/100;
	
    ELSEIF oficio = "DIRECTOR" THEN
		SET porcentaje=3/100;
        
	ELSEIF oficio = "VENDEDOR" THEN
		SET porcentaje=4/100;
        
	ELSE SET porcentaje=5/100;
           
END IF;

UPDATE emple 
   SET salario = salario + salario*porcentaje
   WHERE emple.apellido=p_apellido; 
   
SELECT CONCAT("Se ha subido el salario a ", p_apellido, " un ",porcentaje, "%");

END;
//



/* Escriba un procedimiento que modifique el precio del artículo cuya descripción se pase como parámetro, de manera que si el 
precio es inferior a 0,20€, lo incremente en 0,03€, mientras que si es superior o igual a 0,20 €, se deberá decrementar en la 
misma cuantía. 

Muestre un mensaje indicando si el precio se ha incrementado o decrementado. */
#PISTA. La sentencia para modificar el precio es UPDATE Articulo SET PVPArt = PVPArt (+/-) 0.03
#DATO. En caso de que salga en la consola: Error code: 1175. Escribir SET SQL_SAFE_UPDATES = 0; y ejecutar. A continuación volver a llamar el procedimiento.

USE pedidos;
DROP PROCEDURE IF EXISTS precio;

DELIMITER //
CREATE PROCEDURE precio (IN p_descripcion VARCHAR(30))
BEGIN

DECLARE precio FLOAT;

SET precio=(
	SELECT PVPArt
    FROM articulo
    WHERE articulo.DesArt=p_descripcion);
    
	IF precio < 0.20 THEN 
		UPDATE articulo
		SET PVPArt = PVPArt + 0.03
		WHERE articulo.DesArt=p_descripcion;
        SELECT "Se ha modificado el precio";
		
	ELSEIF precio >= 0.20 THEN
		UPDATE articulo
		SET PVPArt = PVPArt - 0.03
		WHERE articulo.DesArt=p_descripcion;
        SELECT "Se ha modificado el precio";
		
	END IF;

END;
//


	
# REPASO:

USE empleados;

DELIMITER //
CREATE PROCEDURE contar_mismo_apellido (IN p_apellido1 VARCHAR(50))
BEGIN

DECLARE total INT;

SET total =(
	SELECT COUNT(*)
    FROM empleado
    WHERE empleado.apellido1 = p_apellido1);
    
SELECT total;

END;
//


DELIMITER //
CREATE PROCEDURE contar_mismo_apellido1 (IN p_apellido1 VARCHAR(50), OUT total INT)
BEGIN

SET total =(
	SELECT COUNT(*)
    FROM empleado
    WHERE empleado.apellido1 = p_apellido1);

END;
//


# Herramienta para otptimizar consultas:
USE pedidos;

EXPLAIN SELECT * FROM articulo WHERE PVPArt < 0.50;

CREATE INDEX IPVPArt ON Articulo(PVPArt);


######################################################### Repaso examen #########################################################

--- Procedimientos sin referencia a tablas

/* # Crea un procedimiento que devuelva el valor de la longitud de una circunferencia a partir del valor del radio que se recibirá como parámetro de entrada.*/

USE procedementosalmacenados;
DROP PROCEDURE IF EXISTS longitudCircunferencia;

DELIMITER //
CREATE PROCEDURE longitudCircunferencia(IN p_radio DECIMAL)
BEGIN

DECLARE resultado DECIMAL;

SET resultado = (2 * 3.14 * p_radio);

SELECT resultado;

END;
//


/* # Crea un procedmiento para calcular el area total y el volumen de un cilindro que tiene por altura la misma longitud que la circunferencia de la base. El parametro de entrada será la altura 
y los parámetros de salida serán Area Cilindro y Volumen.

DATOS: Area Cilindro = Area de la base x Altura // Volumen = PI x radio^2 x Altura (Todo en cm y cm^2)

RESULTADO: Si metemos Altura = 125.66 cm --- Area= 18304.22 cm^2 --- Volumen= 157909.38 cm^3
*/

USE procedementosalmacenados;
DROP PROCEDURE IF EXISTS areayvolumen;

DELIMITER //
CREATE PROCEDURE areayvolumen(IN p_altura DECIMAL)
BEGIN

DECLARE radio DECIMAL;
DECLARE areacilindro DECIMAL;
DECLARE volumen DECIMAL;

#Radio = altura/(2*3.14)
SET radio = p_altura/(2*3.14);

#Area cilindro = 2*(3.14*R2) + altura*(2*3.14*R)
SET areacilindro = 2*(3.14*POW(radio,2)) + (p_altura*(2*3.14*radio));
SELECT areacilindro ;

#Volumen = 3.14*R2*altura
SET volumen = 3.14*POW(radio,2) * p_altura;
SELECT volumen;

SELECT CONCAT ("El resultado es ", volumen, " cm³") Resultado;

END;
//



#Procedimientos con referencias a tablas

/* Usando la base de datos pedidos. Crea un procedimiento que reciba como parámetro de entrada la descripción de un artículo 
y que devuelva el número de unidades que de dicho artículo han sido solicitas en total de los pedidos. 
Realiza este ejercicio primero 3 veces: 
- Usando un parámetro de salida, 
- Usando una variable 
- Crea una función en lugar de un procedimiento. */

#CON VARIABLES:
USE pedidos;
DROP PROCEDURE IF EXISTS unidadesArticulo;

DELIMITER //
CREATE PROCEDURE unidadesArticulo(IN p_descripcion VARCHAR(50))
BEGIN

DECLARE unidadessalida INT;

SET unidadessalida =(
	SELECT SUM(CantArt)
    FROM articulo, lineapedido
    WHERE articulo.CodArt = lineapedido.CodArt AND articulo.DesArt = p_descripcion);

SELECT unidadessalida;

END;
//



#CON PARÁMETROS DE SALIDA:
USE pedidos;
DROP PROCEDURE IF EXISTS unidadesArticulo1;

DELIMITER //
CREATE PROCEDURE unidadesArticulo1(IN p_descripcion VARCHAR(50), OUT p_unidadessalida INT)
BEGIN


SET p_unidadessalida =(
	SELECT SUM(CantArt)
    FROM articulo, lineapedido
    WHERE articulo.CodArt = lineapedido.CodArt AND articulo.DesArt = p_descripcion);

END;
//



# FUNCIÓN:
USE pedidos;
DROP FUNCTION IF EXISTS unidadesArticulo;

DELIMITER //
CREATE FUNCTION unidadesArticulo(p_descripcion VARCHAR(50)) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN

DECLARE unidadessalida INT;

SET unidadessalida =(
	SELECT SUM(CantArt)
    FROM articulo, lineapedido
    WHERE articulo.CodArt = lineapedido.CodArt AND articulo.DesArt = p_descripcion);

RETURN unidadessalida;

END;
//



/*(DIFICIL)Usando la base de datos empresa. Crea un procedimietno para insertar nuevos departamentos en la tabla depart, 
para ello el procedmiento debe tener como parámetros de entrada un nombre de departamento (dnombre) y su localidad (loc). 

El procedimiento debe insertar ese departamento en la tabla Depart y asignarle como número de departamento (dept_no) 
el que resulte  de sumar 10 al número más alto de los departamentos de la empresa. Al final genera una mensaje que ponga Departamento nº 'Numero de departamento añadido' añadido.

El resultado esperado será un mensaje que indique Departamento nº 40 añadido. */

USE empresa;
DROP PROCEDURE IF EXISTS insertar_departamento;

DELIMITER //
CREATE PROCEDURE insertar_departamento(IN dnombre VARCHAR(50) , IN localidad VARCHAR(50))
BEGIN

DECLARE incremento INT;

SET incremento = (SELECT MAX(dept_no) FROM depart);

INSERT INTO depart(dept_no, dnombre, loc)
VALUES(incremento +10, dnombre, localidad);

SELECT CONCAT(dnombre, " nº ", (incremento + 10), " añadido") Resultado;
    
END;
//

#Alternativa:
USE empresa;
DROP PROCEDURE IF EXISTS insertar_departamento2;

DELIMITER //
CREATE PROCEDURE insertar_departamento2 (IN NombreDepart VARCHAR(50), IN Localidad VARCHAR (50))
BEGIN

DECLARE NumeroDepartamento INT;

SET NumeroDepartamento=(SELECT MAX(dept_no) FROM depart);
SET NumeroDepartamento= NumeroDepartamento + 10;

INSERT INTO depart(dept_no,dnombre, loc)
VALUES(NumeroDepartamento, NombreDepart, Localidad);

SELECT CONCAT('Departamento nº ', NumeroDepartamento, ' añadido');

END;
//



#Ejercicios condicional IF

/*# Escribe un procedimiento que reciba un número real de entrada, que representa el valor de la nota de un alumno, 
y muestre un mensaje indicando qué nota ha obtenido teniendo en cuenta las siguientes condiciones.

+ [0,5) = Insuficiente
+ [5,6) = Aprobado
+ [6, 7) = Bien
+ [7, 9) = Notable
+ [9, 10] = Sobresaliente
+ En cualquier otro caso la nota no será válida (Mensaje de Error).*/

USE procedementosalmacenados;
DROP PROCEDURE IF EXISTS notaAlumno;

DELIMITER //
CREATE PROCEDURE notaAlumno (IN p_nota FLOAT)
BEGIN

IF p_nota < 5 THEN
	SELECT "Insuficiente";
        
ELSEIF p_nota < 6 THEN
	SELECT "Aprobado";
        
ELSEIF p_nota < 8 THEN
	SELECT "Bien";
        
ELSEIF p_nota < 9 THEN
	SELECT "Notable";
        
ELSEIF p_nota < 11 THEN
	SELECT "Sobresaliente";

ELSEIF p_nota > 10 THEN
	SELECT "Error"; 

END IF;
	
END;
//


/*# El índice de masa corporal (IMC) permite medir el grado de sobrepeso u obesidad de una persona.
El IMC de una persona se calcula con la fórmula: IMC = peso/estatura^2 estando el peso en kilogramos y la estatura en metros. 
En base al valor del IMC, se obtiene el grado de obesidad de la persona de acuerdo a la tabla adjunta.

    IMC          |  GRADO DE OBESIDAD 
 < 18,5          |     Delgado 
Entre 18,5 y 25  |     Normal 
Entre 25 y 30    |     Sobrepeso 
>30              |     Obesidad

Crear un procedimiento que determine el grado de obesidad de una persona conociendo su peso y su estatura.*/

USE procedementosalmacenados;
DROP PROCEDURE IF EXISTS gradoObesidad;

DELIMITER //
CREATE PROCEDURE gradoObesidad (IN p_peso FLOAT, IN p_estatura FLOAT)
BEGIN

DECLARE imc FLOAT;

SET imc = p_peso / POW(p_estatura,2);

IF imc < 18.5 THEN
	SELECT "Su estado es: Delgado" Mensaje;
    
ELSEIF imc < 25 THEN
	SELECT "Su estado es: Normal" Mensaje;
    
ELSEIF imc < 30 THEN
	SELECT "Su estado es: Sobrepeso" Mensaje;
    
ELSEIF imc >= 30 THEN
	SELECT "Su estado es: Obesidad" Mensaje;
    
END IF;

END;
//



--------------------------------------------------------------------------------------------------------------------------

/* PRÁCTICA: */

Escribe una procedimiento y función que devuelva el valor del área de un círculo a partir del valor del radio que se recibirá como parámetro de entrada (1 punto).


En una plaza de forma circular se van a poner X farolas cuyas bases son círculos de un 1m de radio, el resto de la plaza lo van a utilizar para sembrar césped.Escribe un procedimiento que me permita calcular el área de césped del que dispongo para sembrar en función del radio de la plaza y en función del número de faloras que se van a colocar. Si el número de farolas es demasiado grande haz que el procedimiento saque un mensaje de que el número de farolas es demasiado grande (3 puntos).
 

DELIMITER //
CREATE PROCEDURE Campo (IN RadioCampo DOUBLE, IN NumeroFarolas INT)
BEGIN
DECLARE AreaCampo DOUBLE;
DECLARE AreaFarolas DOUBLE;
SET AreaCampo = (PI()*POW(RadioCampo,2));
SET AreaFarolas = (NumeroFarolas*(PI()*POW(1,2)));
SET AreaCampo = AreaCampo - AreaFarolas;
IF AreaCampo > AreaFarolas THEN SELECT AreaCampo;
ELSE SELECT ('Número de farolas demasiado grande')Mensaje;
END IF;
END;
//



Usando la base de datos empresa. Crea un procedimiento que reciba como parametro de entrada el número de un empleado y nos muestre un número que indique el porcentaje que supone el salario del empleado en relación con la suma salarial de todos los empleados de la empresa (2.5 puntos) (+0,5 extra si lo haces con función)

USE empresa;

DELIMITER //
CREATE PROCEDURE datosMayorSalario (IN p_numero_empleado INT)
BEGIN
DECLARE salarioemple INT;
DECLARE salarioTotal INT;
DECLARE porcentaje INT;
SET salarioemple = (SELECT salario FROM emple WHERE emp_no = p_numero_empleado);
SET salarioTotal = (SELECT SUM(salario) FROM emple);
SET porcentaje = ((salarioemple/salarioTotal)*100);
SELECT porcentaje;
END;
//

Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente un día de la semana y que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes (1.5 puntos).

DELIMITER //
CREATE PROCEDURE Campo (IN Numero INT)
BEGIN
DECLARE DiaSemana VARCHAR(20);
IF Numero = 1 THEN SELECT 'Lunes'Mensaje;
END IF;
IF Numero = 2 THEN SELECT 'Martes'Mensaje;
END IF;
END;
//

Crea un procedimiento que permita saber si un año es bisiesto. Para que un año sea bisiesto debe ser divisible por 4 y por 400, pero no debe ser divisible por 100.(NOTA: El operador divisible es %. Son Años bisiestos 1992, 1996, 2004, 2008) (2 puntos)

DELIMITER //
CREATE PROCEDURE AñoBisiesto (IN AÑO INT)
BEGIN
IF AÑO%4 = 0 THEN SELECT 'Año Bisiesto';
	IF AÑO%100 != 0 OR AÑO%400 = 0 THEN SELECT 'Año Bisiesto';
    END IF;
ELSE SELECT 'Año No Bisiesto';
END IF;
END;
//

--------------------------------------------------------------------------------------------------------------------------

/* Práctica: */

#RICARDO GÓMEZ COSTA

CREATE DATABASE practica;

-------------------------------

#Ejercicio 1

#Procedemento:
USE practica;
DROP PROCEDURE IF EXISTS areaCiruclo;

DELIMITER //
CREATE PROCEDURE areaCiruclo(IN p_radio DECIMAL)
BEGIN

#Área del círculo= 3.14 * R2

DECLARE area DECIMAL;

SET area = 3.14 * POW(p_radio,2);

SELECT CONCAT ("El resultado es ", area, " cm") Resultado;

END;
//

-------------------------------

#Función:
USE practica;
DROP FUNCTION IF EXISTS areaCiruclo;

DELIMITER //
CREATE FUNCTION areaCiruclo(p_radio DECIMAL) RETURNS DECIMAL
DETERMINISTIC
BEGIN

#Área del círculo= 3.14 * R2

DECLARE area DECIMAL;

SET area = 3.14 * POW(p_radio,2);

RETURN area;

END;
//

-------------------------------

#Ejercicio 4
USE practica;
DROP PROCEDURE IF EXISTS diaSemana;

DELIMITER //
CREATE PROCEDURE diaSemana(IN p_numerodia INT)
BEGIN

DECLARE nombredia DECIMAL;

IF p_numerodia = 1 THEN
	SELECT "Luns" Día;
        
ELSEIF p_numerodia = 2 THEN
	SELECT "Martes" Día;
    
ELSEIF p_numerodia = 3 THEN
	SELECT "Mércores" Día;
    
ELSEIF p_numerodia = 4 THEN
	SELECT "Xoves" Día;
    
ELSEIF p_numerodia = 5 THEN
	SELECT "Venres" Día;
    
ELSEIF p_numerodia = 6 THEN
	SELECT "Sábado" Día;
    
ELSEIF p_numerodia = 7 THEN
	SELECT "Domingo" Día;
    
ELSE SELECT "error" Resultado;

END IF;

END;
//

-------------------------------

#Ejercicio 3
#Procedemento
USE empresa;
DROP PROCEDURE IF EXISTS numeroEmpregado;

DELIMITER //
CREATE PROCEDURE numeroEmpregado(IN p_numeroEmpregado FLOAT)
BEGIN

DECLARE salarioEmpleado FLOAT;
DECLARE salarioTotal FLOAT;
DECLARE resultado FLOAT;

SET salarioEmpleado =(
	SELECT salario
	FROM emple
	WHERE emple.emp_no = p_numeroEmpregado);

SET salarioTotal =(
	SELECT SUM(salario)
	FROM emple);

SET resultado =(
	(salarioEmpleado*100)/salarioTotal);

SELECT resultado;

END;
//

-------------------------------

#Función:
USE empresa;
DROP FUNCTION IF EXISTS numeroEmpregado;

DELIMITER //
CREATE FUNCTION numeroEmpregado(p_numeroEmpregado FLOAT) RETURNS FLOAT
DETERMINISTIC
BEGIN

DECLARE salarioEmpleado FLOAT;
DECLARE salarioTotal FLOAT;
DECLARE resultado FLOAT;

SET salarioEmpleado =(
	SELECT salario
	FROM emple
	WHERE emple.emp_no = p_numeroEmpregado);
    
SET salarioTotal =(
	SELECT SUM(salario)
	FROM emple);

SET resultado =(
	(salarioEmpleado*100)/salarioTotal);

RETURN resultado;

END;
//

-------------------------------

#Ejercicio 5
USE practica;
DROP PROCEDURE IF EXISTS bisiesto;

DELIMITER //
CREATE PROCEDURE bisiesto(IN p_ano INT)
BEGIN
 
DECLARE ano INT;
SET ano = p_ano;

IF ano % 4 = 0 THEN
	SELECT "Bisiesto" Resultado;

ELSEIF ano % 400 = 0 THEN
	SELECT "Bisiesto" Resultado;
    
ELSE SELECT "No es Bisiesto" Resultado;

END IF;

END;
//

-------------------------------

#Ejercicio 2
USE practica;
DROP PROCEDURE IF EXISTS praza;

DELIMITER //
CREATE PROCEDURE praza(IN p_radioPraza DOUBLE, IN p_numeroFarois INT)
BEGIN

DECLARE areaPraza DOUBLE;
DECLARE areaFarois DOUBLE;
DECLARE areaCesped DOUBLE;
DECLARE radioFarois INT;
SET radioFarois = 1;

#Área Praza = 3.14 * R2
SET areaPraza = 3.1416*POW(p_radioPraza,2);

#Área Farois = 3.14 * R2
SET areaFarois = 3.1416*POW(radioFarois,2) ;

#Área Césped = Área Praza - Nº Farolas  * Área Farola
SET areaCesped = areaPraza - (p_numeroFarois*areaFarois);

SELECT areaCesped;
 
END;
//


---------------------------------------------------------------------------------------------


#GREATEST: Devuelve el mayor valor de la lista de argumentos.
SELECT GREATEST(3, 12, 34, 8, 25);

#LEAST: Devuelve el valor más pequeño de la lista de argumentos.
SELECT LEAST(3, 12, 34, 8, 25); 

#CHAR_LENGTH  o CHARACTER_LENGTH: Devuelve la longitud de la cadena.
SELECT CHAR_LENGTH("SQL Tutorial");

#CONCAT: Agrega varias cadenas juntas.
SELECT CONCAT("SQL ", "Tutorial ", "is ", "fun!");

#CONCAT_WS: Agrega varias expresiones juntas y agregue un separador "-" entre ellas.
SELECT CONCAT_WS("-", "SQL", "Tutorial", "is", "fun!");

#INSERT: inserta una cadena dentro de una cadena en la posición especificada y para un cierto número de caracteres.
SELECT INSERT("W3Schools.com", 1, 9, "Example"); 

#INSTR: devuelve la posición de la primera aparición de una cadena en otra cadena.
SELECT INSTR("W3Schools.com", "COM");

#LCASE o LOWER: convierte una cadena a minúsculas.
SELECT LCASE("SQL Tutorial is FUN!"); 

#LEFT: extrae una serie de caracteres de una cadena (empezando por la izquierda).
SELECT LEFT("SQL Tutorial", 3);

#LENGTH:devuelve la longitud de una cadena (en bytes).
SELECT LENGTH("SQL Tutorial"); 

#LOCATE o POSITION: devuelve la posición de la primera aparición de una subcadena en una cadena.
SELECT LOCATE("3", "W3Schools.com"); 

#LPAD: rellena a la izquierda una cadena con otra cadena, hasta una determinada longitud.
SELECT LPAD("SQL Tutorial", 20, "ABC"); 

#LTRIM: elimina los espacios iniciales de una cadena. 
SELECT LTRIM('     SQL Tutorial');

#SUBSTRING (cadena, posición) o SUBSTRING (cadena FROM posición): Extrae una subcadena de una cadena (comenzando en cualquier posición).
SELECT SUBSTRING("SQL Tutorial", 5, 3);

#SUBSTRING (cadena, posición, longitud) o SUBSTRING (cadena FROM posición FOR longitud) o MID (cadena, posición, longitud): extrae una subcadena de una cadena (comenzando en cualquier posición).
SELECT MID("SQL Tutorial", 5, 3);

#REPEAT: repite una cadena tantas veces como se especifica.
#SELECT REPEAT("SQL Tutorial", 3); 

#REPLACE: reemplaza todas las ocurrencias de una subcadena dentro de una cadena, con una nueva subcadena.
SELECT REPLACE("SQL Tutorial", "SQL", "HTML"); 

#REVERSE: invierte una cadena y devuelve el resultado.
SELECT REVERSE("SQL Tutorial"); 

#RIGHT: extrae una serie de caracteres de una cadena (empezando por la derecha).
SELECT RIGHT('SQL Tutorial', 3); 

#RPAD: Rellena a la derecha una cadena con otra cadena, hasta una cierta longitud.
SELECT RPAD("SQL Tutorial", 20, "ABC");

#RTRIM: elimina los espacios finales de una cadena.
SELECT RTRIM('SQL Tutorial     ');

#SUBSTRING_INDEX : devuelve una subcadena de una cadena antes de que ocurra un número especificado de delimitadores.
SELECT SUBSTRING_INDEX("www.w3schools.com", ".", 1); 
SELECT SUBSTRING_INDEX("www.w3schools.com", ".", 2); 


#TRIM: elimina los espacios iniciales y finales de una cadena.
SELECT TRIM('    SQL Tutorial    ');

#STRCMP: compara dos cadenas.
SELECT STRCMP("SQL Tutorial", "SQL Tutorial"); 
SELECT STRCMP("SQL Tutorial", "SQL Tutorialll");
SELECT STRCMP("SQL Tutorialll", "SQL Tutorial"); 

#UCASE o UPPER: convierte una cadena a mayúsculas.
SELECT UCASE("SQL Tutorial is FUN!"); 
 
#ABS: devuelve el valor absoluto (positivo) de un número.
SELECT ABS(-243.5); 

#CEIL  o CEILING: devuelve el valor entero más pequeño que es mayor o igual que un número.
SELECT CEIL(25.75); 
SELECT CEIL(25.01); 

#PI: devuelve el valor de PI.
SELECT PI(); 

#COS: devuelve el coseno de un número.
SELECT COS(2); 

#DEGREES: convierte un valor en radianes a grados.
SELECT DEGREES(1.5); 

#FLOOR: devuelve el valor entero más grande que es menor o igual que un número.
SELECT FLOOR(25.75);

#MOD: devuelve el resto de un número dividido por otro número.
SELECT MOD(18, 4); 

#POW: devuelve el valor de un número elevado a la potencia de otro número.
SELECT POW(4, 2); 

#RADIANS: convierte un valor de grado en radianes.
SELECT RADIANS(180); 

#RAND(): devuelve un número aleatorio entre 0 (inclusive) y 1 (exclusivo).
SELECT RAND(); 

#RAND(número): Devuelve un número decimal aleatorio (con valor inicial de 6).
SELECT RAND(6); 

#ROUND(número, número de decimales): Devuelve un número decimal aleatorio (con valor inicial de 6): redondea un número a un número específico de lugares decimales.
SELECT ROUND(135.375, 2); 
SELECT ROUND(135.375111, 5); 

#ROUND(número): Devuelve un número entero (redondeará arriba o abajo en función de si es mayor o menor los decimales).
SELECT ROUND(135.375);
SELECT ROUND(135.575); 

#SIN(ángulo): devuelve el seno de un número.
SELECT SIN(2); 

#SQRT(número): devuelve la raíz cuadrada de un número.
SELECT SQRT(64); 

#TAN(): devuelve la tangente de un número.
SELECT TAN(1.75); 

#TRUNCATE: trunca un número al número especificado de lugares decimales.
SELECT TRUNCATE(135.375, 2); 

#CURDATE(), CURRENT_DATE o CURRENT_DATE(): Devuelve la fecha actual.
SELECT CURDATE(); 

#NOW() o SYSDATE() o LOCALTIME o LOCALTIME() o LOCALTIMESTAMP o LOCALTIMESTAMP(): devuelve la fecha y hora actuales.
SELECT NOW(); 

#DATE: extrae la parte de la fecha de una expresión de fecha y hora.
SELECT DATE("2017-06-15"); 

#DATEDIFF: devuelve el número de días entre dos valores de fecha.
SELECT DATEDIFF("2017-06-25", "2017-05-25"); 
SELECT DATEDIFF("2018-06-25", "2017-06-25"); 

#DATE_FORMAT: formatea una fecha como se especifica.
SELECT DATE_FORMAT("2017-06-15", "%Y");
SELECT DATE_FORMAT("2017-06-15", "%y");  
SELECT DATE_FORMAT("2017-06-15", "%m");
SELECT DATE_FORMAT("2017-06-15", "%M"); 
SELECT DATE_FORMAT("2017-06-15", "%D");
SELECT DATE_FORMAT("2017-06-15", "%d");

#DAY(fecha) o DAYOFMONTH(fecha): Devuelve el día del mes para una fecha determinada (un número del 1 al 31).
SELECT DAY("2017-06-15"); 

#DAYNAME(): devuelve el nombre del día de la semana para una fecha determinada.
SELECT DAYNAME("2017-06-15"); 

#DAYOFWEEK(): devuelve el índice del día de la semana para una fecha determinada (un número del 1 al 7).
SELECT DAYOFWEEK("2017-06-15"); 

#HOUR(): devuelve la parte horaria de una fecha determinada (de 0 a 838).
SELECT HOUR("2017-06-20 09:34:00"); 

#LAST_DAY(): extrae el último día del mes para una fecha dada.
SELECT LAST_DAY("2017-06-20"); 

#MAKETIME: crea y devuelve una hora basada en un valor de hora, minuto y segundo.
SELECT MAKETIME(10,46,03);

#MINUTE: devuelve la parte de los minutos de una hora/fechahora (de 0 a 59).
SELECT MINUTE("2017-06-20 09:34:00"); 

#MONTH: devuelve la parte del mes para una fecha determinada (un número del 1 al 12).
SELECT MONTH("2017-06-15"); 

#MONTHNAME: devuelve el nombre del mes para una fecha determinada.
SELECT MONTHNAME("2017-06-15"); 

#SECOND: devuelve la parte de los segundos de una hora/fechahora (de 0 a 59).
SELECT SECOND("2017-06-20 09:34:00.000023"); 
SELECT SECOND("2017-06-20 09:34:05"); 

#TIME: extrae la parte de tiempo de una hora/fechahora determinada.
SELECT TIME("2017-08-15 19:30:10"); 

#TIMEDIFF: devuelve la diferencia entre dos expresiones de hora/fechahora.
SELECT TIMEDIFF("13:10:11", "13:10:10"); 

#TIMESTAMP(expresión1, expresión 2): devuelve un valor de fecha y hora basado en una fecha o un valor de fecha y hora.
SELECT TIMESTAMP("2017-07-23","13:10:11"); 

#TIMESTAMP(expresión): Devuelve un valor de fecha y hora basado en los argumentos:
SELECT TIMESTAMP("2017-07-23"); 

#TIMESTAMPADD(intervalo, número entero, expresión): agrega valor de tiempo con una fecha o un valor de fecha y hora.
SELECT TIMESTAMPADD(MONTH,2,'2009-05-18');

#TIMESTAMPDIFF(intervalo, expresión1, expresión2): devuelve un valor después de restar una expresión de fecha y hora de otra.
SELECT TIMESTAMPDIFF(MONTH,"2009-05-18",'2010-05-18');
SELECT TIMESTAMPDIFF(DAY,"2009-05-18",'2010-05-18');

#TIME_FORMAT: da formato a una hora con un formato especificado.
SELECT TIME_FORMAT("19:30:10", "%H %i %s"); 

#WEEKDAY: devuelve el número del día de la semana para una fecha determinada.
SELECT WEEKDAY("2017-06-15"); 

#YEAR: devuelve la parte del año para una fecha dada (un número de 1000 a 9999).
SELECT YEAR("2017-06-15"); 

#CONNECTION_ID(): devuelve el ID de conexión único para la conexión actual.
SELECT CONNECTION_ID(); 

#CURRENT_USER(): devuelve el nombre de usuario y el nombre de host de la cuenta de MySQL que el servidor utilizó para autenticar al cliente actual.
SELECT CURRENT_USER(); 

#DATABASE(): devuelve el nombre de la base de datos actual.
SELECT DATABASE(); 

#ROW_COUNT(): devuelve el número de filas actualizadas, insertadas o eliminadas por la instrucción anterior.
SELECT ROW_COUNT();

#SESSION_USER() o USER() o SYSTEM_USER(): devuelve el nombre de usuario y el nombre de host actuales para la conexión MySQL.
SELECT SESSION_USER(); 

#VERSION(): devuelve la versión actual de la base de datos MySQL, como una cadena.
SELECT VERSION(); 
 
---------------------------------------------------------------------------------------------



