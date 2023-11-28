 Escribe una procedimiento y función que devuelva el valor del área de un círculo a partir del valor del radio que se recibirá como parámetro de entrada.


En una plaza de forma circular se van a poner X farolas cuyas bases son círculos de un 1m de radio, el resto de la plaza lo van a utilizar para sembrar césped.
Escribe un procedimiento que me permita calcular el área de césped del que dispongo para sembrar en función del radio de la plaza y en función del número de faloras 
que se van a colocar. 
Si el número de farolas es demasiado grande haz que el procedimiento saque un mensaje de que el número de farolas es demasiado grande.
 

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



Usando la base de datos empresa. Crea un procedimiento que reciba como parametro de entrada el número de un empleado y nos muestre un número que indique el porcentaje
que supone el salario del empleado en relación con la suma salarial de todos los empleados de la empresa (2.5 puntos) (+0,5 extra si lo haces con función)

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

Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente un día de la semana y que devuelva una cadena de caracteres con el 
nombre del día de la semana correspondiente. Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.

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

Crea un procedimiento que permita saber si un año es bisiesto. Para que un año sea bisiesto debe ser divisible por 4 y por 400, pero no debe ser divisible por 100.
(NOTA: El operador divisible es %. Son Años bisiestos 1992, 1996, 2004, 2008) 

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