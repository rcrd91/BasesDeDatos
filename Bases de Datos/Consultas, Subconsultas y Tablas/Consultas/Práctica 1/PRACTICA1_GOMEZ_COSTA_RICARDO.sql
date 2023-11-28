# Ricardo Gómez Costa

/* Tarefa 5.1 - Consultas simples en MySQL

ACTIVIDADE 1 (OBRIGATORIA)
Partindo do script de creación e inserción de datos fornecido, escribe nun novo ficheiro de script SQL as sentenzas conducentes á creación das seguintes consultas: */

USE tarefa51;

#1. Lista os nomes completos de todos os usuarios.
SELECT nome_completo
FROM usuarios;

#2. Calcula o saldo máximo dos usuarios nacionais.
SELECT MAX(saldo) 
FROM usuarios
WHERE nacional=1;

#3. Lista o nome completo e teléfono dos usuarios que posúan un Xiaomi, Huawei ou LG.
SELECT nome_completo , telefono
FROM usuarios
WHERE marca='Xiaomi' OR marca='Huawei' OR marca='LG';

#4. Conta os usuarios sen saldo ou inactivos.
SELECT COUNT(*)
FROM usuarios
WHERE saldo=0 OR activo=0;

#5. Lista o nome de usuario daqueles usuarios con nivel 1 ou 2.
SELECT usuario
FROM usuarios
WHERE nivel=1 OR nivel=2;


#6. Lista os números de teléfono dos usuarios con saldo menor o igual a 300.
SELECT telefono
FROM usuarios
WHERE saldo <= 300; 

#7. Calcula a suma dos saldos dos usuarios de Movistar.
SELECT SUM(saldo) 
FROM usuarios
WHERE companhia = 'Movistar';

#8. Conta o número de usuarios por compañía telefónica.
SELECT COUNT(usuario),companhia
FROM usuarios
GROUP BY companhia;

#9. Conta o número de usuarios por nivel.
SELECT COUNT(usuario),nivel
FROM usuarios
GROUP BY nivel;

#10. Lista o nome de usuario dos usuarios de 3.
SELECT usuario
FROM usuarios
WHERE nivel = 3;

#11. Amosa o email dos usuarios que empregan GMail.
SELECT email
FROM usuarios
WHERE email LIKE '%gmail.com';

#12. Lista o nome completo e teléfono dos usuarios con teléfono LG, SAMSUNG ou Huawei.
SELECT nome_completo,telefono
FROM usuarios
WHERE marca = 'LG' OR marca = 'Samsung' OR marca = 'Huawei';

#13. Lista o nome completo e teléfono dos usuarios cuxo teléfono non sexa un iPhone nin un Samsung.
SELECT nome_completo,telefono
FROM usuarios
WHERE NOT marca = 'iPhone' AND NOT marca = 'Samsung';
#WHERE marca NOT IN('iPhone', 'Samsung')


#14. Lista o nome de usuario e teléfono dos usuarios cuxa compañía sexa O2.
SELECT usuario,telefono
FROM usuarios
WHERE companhia = 'O2';

#15. Lista o nome de usuario e teléfono dos usuarios cuxa compañía non sexa Lowi.
SELECT usuario,telefono
FROM usuarios
WHERE NOT companhia = 'Lowi';
#WHERE companhia != 'Lowi';

#16. Calcula o saldo promedio daqueles usuarios cun teléfono Xiaomi.
SELECT AVG (saldo)
FROM usuarios
WHERE marca = 'Xiaomi';

#17. Lista o nome de usuario e teléfono dos usuarios cuxa compañía telefónica sexa Movistar ou Vodafone.
SELECT usuario,telefono
FROM usuarios
WHERE companhia = 'Movistar' OR companhia = 'Vodafone';

#18. Amosa o e-mail daqueles usuarios que non empregan yahoo.com coma servidor de correo.
SELECT email
FROM usuarios
WHERE email NOT LIKE '%yahoo.com';

#19. Lista o nome de usuario e teléfono dos usuarios con compañía telefónica que non sexa Yoigo nin Pepephone.
SELECT usuario,telefono
FROM usuarios
WHERE NOT companhia = 'Yoigo' OR NOT companhia = 'Pepephone';
#WHERE companhia NOT IN ('Yoigo', 'Pepephone');

#20. Lista o nome de usuario e teléfono dos usuarios cuxa compañía telefónica sexa Movistar.
SELECT nome_completo,telefono
FROM usuarios
WHERE companhia = 'Movistar';

#21. Lista as diferentes marcas de smartphone en orde alfabética.
SELECT marca
FROM usuarios
GROUP BY marca 
ORDER BY marca DESC;

#22. Lista as distintas compañías en orde aleatoria.
SELECT DISTINCT companhia
FROM usuarios
ORDER BY RAND();

#23. Lista o nome de usuario dos usuarios con nivel 0 ou 2.
SELECT usuario
FROM usuarios
WHERE nivel = 0 OR nivel = 2;

#24. Calcula o saldo promedio dos usuarios que teñen un teléfono de marca LG.
SELECT AVG (saldo)
FROM usuarios
WHERE marca = 'LG';

/*25. Lista o número de usuarios que hai en cada nivel cun saldo que estea no intervalo [50,250],pertencentes ás compañías Lowi, Movistar ou O2; 
ordeados descendentemente por nivel, pero só naqueles casos nos que ese número de usuarios sea maior ou igual a 3.*/
SELECT COUNT(usuario),nivel
FROM usuarios 
WHERE saldo BETWEEN 50 AND 250 AND companhia IN ('Lowi','Movistar','O2') 
GROUP BY nivel HAVING COUNT(usuario)>=3 
ORDER BY nivel DESC;




/* ACTIVIDADE 2 (OPTATIVA)
A entrega desta segunda actividade computará un máximo de 0,25 puntos adicionais sobre a nota do trimestre, 
os cales terán sido considerados só en caso de superar a avaliación previamente tal e coma está establecido na programación.*/

USE tarefa51;

#1. Lista o nome de usuario dos usuarios que non teñan nivel 1 nin 3 (supoñamos que no futuro pode mudar a escala de niveis actual).
SELECT usuario
FROM usuarios
WHERE NOT nivel = 1 AND NOT nivel = 3;

#2. Lista o nome completo e teléfono dos usuarios con teléfono que non sexa da marca iPhone.
SELECT nome_completo,telefono
FROM usuarios
WHERE NOT marca = 'iPhone';

#3. Lista o nome de usuario dos usuarios con nivel 3.
SELECT usuario
FROM usuarios
WHERE nivel = 3;

#4. Lista o nome de usuario dos usuarios con nivel distinto de 0.
SELECT usuario
FROM usuarios
WHERE nivel != 0;

#5. Lista o nome de usuario dos usuarios con nivel superior ou igual a 1.
SELECT usuario
FROM usuarios
WHERE nivel >= 1;

#6. Conta o número de usuarios por nacionais e non nacionais.
SELECT COUNT(*),nacional
FROM usuarios
GROUP BY nacional;

#7. Lista o nome de usuario e teléfono dos usuarios con Pepephone coma compañía telefónica.
SELECT usuario,telefono
FROM usuarios
WHERE companhia = 'Pepephone';

#8. Lista as diferentes compañías en orde alfabética descendente.
SELECT companhia
FROM usuarios
GROUP BY companhia ORDER BY companhia DESC;

#9. Lista o nome de usuario dos usuarios inactivos.
SELECT usuario
FROM usuarios
WHERE activo = 0;

#10. Lista os números de teléfono sen saldo.
SELECT telefono
FROM usuarios
WHERE saldo = 0;

#11. Calcula o saldo mínimo de entre os usuarios non nacionais.
SELECT MIN(saldo)
FROM usuarios
WHERE nacional = 0;

#12. Lista os números de teléfono con saldo maior a 300
SELECT telefono
FROM usuarios
WHERE saldo > 300;

#13. Conta o número de usuarios por marca de teléfono.
SELECT COUNT(*),marca
FROM usuarios
GROUP BY marca;

#14. Lista o nome completo e teléfono dos usuarios con teléfono que non sexa da marca LG.
SELECT nome_completo,telefono
FROM usuarios
WHERE marca != 'LG';

#15. Lista as diferentes compañías en orde alfabética ascendente.
SELECT companhia
FROM usuarios
GROUP BY companhia ORDER BY companhia ASC;

#16. Calcula a suma dos saldos dos usuarios da compañía telefónica Orange.
SELECT SUM(saldo)
FROM usuarios
WHERE companhia = 'Orange';

#17. Amosar o email dos usuarios que empregan hotmail.
SELECT email
FROM usuarios
WHERE email LIKE '%hotmail.com';

#18. Lista os nomes completo dos usuarios sen saldo ou inactivos
SELECT nome_completo
FROM usuarios
WHERE saldo = 0 OR activo = 0;

#19. Lista o nome de usuario e teléfono dos usuarios con compañía telefónica Movistar ou Lowi.
SELECT usuario,telefono
FROM usuarios
WHERE companhia = 'Movistar' OR companhia = 'Lowi';

#20. Lista as diferentes marcas de smartphone en orde alfabética descendente.
SELECT marca
FROM usuarios
GROUP BY marca ORDER BY marca DESC;

#21. Lista as diferentes marcas de smartphone en orde aleatoria.
SELECT marca
FROM usuarios
GROUP BY marca ORDER BY RAND();

#22. Lista o nome de usuario e teléfono dos usuarios con compañía telefónica Pepephone ou Orange.
SELECT usuario,telefono
FROM usuarios
WHERE companhia = 'Pepephone' OR companhia = 'Orange';

#23. Lista o nome completo e teléfono dos usuarios con teléfono que no sexa da marca Xiaomi ou Huawei.
SELECT nome_completo,telefono
FROM usuarios
WHERE marca != 'Xiaomi' AND marca != 'Huawei';

#24. Calcula a suma dos saldos dos usuarios da compañía telefónica O2.
SELECT SUM(saldo)
FROM usuarios
WHERE companhia = 'O2';

#25. Lista o número de usuarios que hai en cada compañía cun saldo maior ou igual a 400.
SELECT usuario,companhia
FROM usuarios
WHERE saldo >= 400;