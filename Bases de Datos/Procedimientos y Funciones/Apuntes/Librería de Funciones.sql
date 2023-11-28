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
 


