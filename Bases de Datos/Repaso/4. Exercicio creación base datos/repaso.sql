DROP DATABASE repaso;
CREATE DATABASE repaso;
USE repaso;


CREATE TABLE provedor(
cod_provedor INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
provincia VARCHAR(50) NOT NULL,
telefono INT NOT NULL,

PRIMARY KEY(cod_provedor)
);

INSERT INTO provedor VALUES(1, "Danone", "Ronda Ferran Puig, 12", "Girona", "Gerona", 932912000);
INSERT INTO provedor VALUES(2, "Nestle", "Calle Clara Campoamor, 2", "Esplugues de Llobregat", "Barcelona", 934805100);
INSERT INTO provedor VALUES(3, "Elpozo", "Av. de Antonio Fuertes, 1", "Alhama de Murcia", "Murcia", 968636800);
INSERT INTO provedor VALUES(4, "Campofrío", "Av. de Antonia María, 1", "Alhama de Murcia", "Murcia", 968634567);
INSERT INTO provedor VALUES(5, "Navidul", "Calle María la Preciosa, 1", "Alhama de Murcia", "Murcia", 968534567);


CREATE TABLE artigo(
cod_artigo INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
prezo DOUBLE NOT NULL,
pvp DOUBLE NOT NULL,

PRIMARY KEY(cod_artigo)
);

INSERT INTO artigo VALUES(1, "Pack 4 Yogur natural", 0.75, 0.91 );
INSERT INTO artigo VALUES(2, "Chocolate Extrafino", 1.10, 1.40 );
INSERT INTO artigo VALUES(3, "Jamón Cocido", 9.50, 11.50 );
INSERT INTO artigo VALUES(4, "Chorizo revilla", 5.50, 7.50);
INSERT INTO artigo VALUES(5, "Jamón Serrano", 60.50, 65.50);


CREATE TABLE departamento(
cod_departamento INT AUTO_INCREMENT NOT NULL,
director VARCHAR(50) NOT NULL,
area_ventas VARCHAR(50) NOT NULL,
cod_artigo INT NOT NULL,

PRIMARY KEY(cod_departamento),
FOREIGN KEY(cod_artigo) REFERENCES artigo(cod_artigo)
);

INSERT INTO departamento VALUES(1, "Pepolo", "Frío", 1);
INSERT INTO departamento VALUES(2, "Manolo", "Dulces", 2);
INSERT INTO departamento VALUES(3, "Antonio", "Charcutería", 3);
INSERT INTO departamento VALUES(4, "Antonio", "Charcutería", 4);
INSERT INTO departamento VALUES(5, "Antonio", "Charcutería", 5);


CREATE TABLE empregado(
cod_empregado INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono INT NOT NULL,
salario DOUBLE NOT NULL,
cod_departamento INT NOT NULL,

PRIMARY KEY(cod_empregado),
FOREIGN KEY(cod_departamento) REFERENCES departamento(cod_departamento)
);

INSERT INTO empregado VALUES(1, "Marcos Fernández Flores", "Calle nueva, 1, 15885, Vedra, A Coruña", 981234567, 1050.25, 1);
INSERT INTO empregado VALUES(2, "María López García", "Calle Vieja, 1. 15886, Teo, A Coruña", 981345678, 1050.55, 2);
INSERT INTO empregado VALUES(3, "Jose Sánchez Costa", "Calle moderna 1, 15885, Vedra, A Coruña", 981456789, 1050.75, 3);
INSERT INTO empregado VALUES(4, "Luís Vázquez Otero", "Calle entrevías 3, 15884, Santiago, A Coruña",981237923, 1050.10, 1);
INSERT INTO empregado VALUES(5, "Fabián Castro Fernández", "Calle millonaria 5, 15884, Santiago, A Coruña", 981563456, 1050.45, 2); 


#Esta tabla "intermedia" execútase ao final de todo xa que une 2 tablas cos seus respectivos índices. 
CREATE TABLE provedor_artigo(
cod_provedor_artigo INT AUTO_INCREMENT NOT NULL,
cod_provedor INT NOT NULL,
cod_artigo INT NOT NULL,
prezo_provedor DOUBLE NOT NULL,

PRIMARY KEY(cod_provedor_artigo),
FOREIGN KEY(cod_provedor) REFERENCES provedor(cod_provedor),
FOREIGN KEY(cod_artigo) REFERENCES artigo(cod_artigo)
);

INSERT INTO provedor_artigo VALUES(1, 1, 1, 0.65);
INSERT INTO provedor_artigo VALUES(2, 2, 2, 0.95);
INSERT INTO provedor_artigo VALUES(3, 3, 3, 10.5);
INSERT INTO provedor_artigo VALUES(4, 4, 4, 6.5);
INSERT INTO provedor_artigo VALUES(5, 5, 5, 62.5);

/* 3. Unha vez feito o exercicio 2, realiza as seguintes consultas sobre a base de datos:
• Teléfono de cada un dos provedores.
SELECT telefono
FROM provedor
• Lista dos empregados segundo departamento.
• En que departamento está a traballar ‘Nome empregado?
• O nome do provedor que fornezo o artigo máis caro
• O artigo máis caro que existe na táboa artigo sen facer uso de MAX, ORDER BY
nin LIMIT */

#Teléfono de cada un dos provedores.
SELECT telefono, nome AS "Nome do provedor"
FROM provedor;

#Lista dos empregados segundo departamento.
SELECT departamento.area_ventas AS Area, empregado.nome AS "Nome completo do empregado"
FROM departamento, empregado
WHERE departamento.cod_departamento=empregado.cod_departamento;

#O nome do provedor que fornezo o artigo máis caro
SELECT nome
FROM provedor
WHERE cod_provedor=(
	SELECT cod_provedor
	FROM provedor_artigo
	WHERE prezo_provedor=(
		SELECT MAX(prezo_provedor)
		FROM provedor_artigo));
        
#O artigo máis caro que existe na táboa artigo sen facer uso de MAX, ORDER BY nin LIMIT */
SELECT nome
FROM provedor
WHERE cod_provedor=(
	SELECT cod_provedor
	FROM provedor_artigo
	WHERE prezo_provedor>= ALL(
		SELECT prezo_provedor
		FROM provedor_artigo));
        
/* Crea un procedemento que cada vez que insiras un artigo e o prezo do artigo ao
que suministra o provedor o artigo (os valores destes parámetros están definidos
por ti, por exemplo, Panos 0,20 €) inserte no campo de prezo de venda ao
público, o prezo do provedor máis un 10%. */
SET SQL_SAFE_UPDATES = 0;
DELIMITER //
CREATE PROCEDURE insercion(IN p_nomeArtigo VARCHAR(50), IN p_precioArtigo DOUBLE)
BEGIN

DECLARE precio_final DOUBLE;

SET precio_final=(
	p_precioArtigo + (p_precioArtigo*10)/100);
    
UPDATE artigo 
SET pvp=precio_final
WHERE p_precioArtigo = prezo AND p_nomeArtigo = nome;

SELECT precio_final;

END;
//

