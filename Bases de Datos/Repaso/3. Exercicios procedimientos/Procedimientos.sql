USE procedementosalmacenados;

/*1. Escribe un procedimento e unha función que devolva o valor dun número ao cadrado sen usar a función POW() (2,5 puntos).*/
DROP PROCEDURE IF EXISTS numeroCadrado;

DELIMITER //
CREATE PROCEDURE numeroCadrado(IN p_numero INT)
BEGIN

DECLARE resultado INT;

SET resultado= (p_numero * p_numero);

SELECT resultado;

END;
//

    
/*2. Usando a base de datos empresa. Crea un procedimento que reciba como parámetro de entrada o número dun emprEgado 
e mostrenos un número que indique a porcentaxe que supón a súa comisión en relación coa suma de comisións de tódolos empregado da empresa. 
Si a comisión do empregado é cero saca unha mensaxe de ‘O empregado non ten comisión’. (2 puntos)*/
    
USE empresa;
DROP PROCEDURE IF EXISTS comision

DELIMITER //
CREATE PROCEDURE comision(IN p_numeroEmpregado INT)
BEGIN

DECLARE comisionEmpleado DOUBLE;
DECLARE totalComision DOUBLE;
DECLARE resultado DOUBLE;

SET comisionEmpleado=(
	SELECT comision
    FROM emple
    WHERE emp_no=p_numeroEmpregado);

SET totalComision=(
	SELECT SUM(comision)
    FROM emple);
    
SET resultado =( (comisionEmpleado*100)/totalComision );

SELECT resultado;

END;
//


/*3. Crea un procedimento que permita saber si un número e par ou impar. O procedimento ten que recibir como parámetro de entrada un número enteiro 
e sacar unha mensaxe de ‘Número par’ en caso de ser par e ‘Número impar’ en caso de ser impar. (NOTA: O operador divisible é %. Un número é par si é divisible por 2) (2,5 puntos)*/
USE procedementosalmacenados;
DROP PROCEDURE IF EXISTS parImpar

DELIMITER //
CREATE PROCEDURE parImpar(IN p_numero INT)
BEGIN

IF p_numero%2=0 THEN SELECT "Número par";
ELSE SELECT "Número impar";

END IF;

END;
//


/*4. Escribe un procedimento que reciba tres números reais como parámetros de entrada e devolva o maior número dos tres. (3 puntos)*/
DROP PROCEDURE IF EXISTS maiorNumero

DELIMITER //
CREATE PROCEDURE maiorNumero(IN p_num1 DOUBLE, IN p_num2 DOUBLE, IN p_num3 DOUBLE)
BEGIN

DECLARE maximo DOUBLE;

SET maximo=( 
SELECT GREATEST(p_num1, p_num2, p_num3) );

SELECT maximo;

END;
//

















