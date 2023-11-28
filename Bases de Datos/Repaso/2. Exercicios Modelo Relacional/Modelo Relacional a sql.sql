DROP DATABASE PROVEEDORES;
CREATE DATABASE PROVEEDORES CHARACTER SET utf8mb4;
USE PROVEEDORES;

CREATE TABLE proveedor (
	cod_proveedor INT AUTO_INCREMENT,
    direccion VARCHAR(50),
    cidade VARCHAR(50),
    provincia VARCHAR(50),
	#Definimos las clave primaria, y foránea/s:
    CONSTRAINT PK_proveedor PRIMARY KEY(cod_proveedor)
    );
    
CREATE TABLE peza (
	cod_peza INT AUTO_INCREMENT,
    nome VARCHAR(50),
    cor VARCHAR(50),
    prezo DOUBLE,
    #Escribimos las claves foráneas que vamos a asociar:
    cod_proveedor INT,
    #Definimos las clave primaria, y foránea/s:
    CONSTRAINT PK_peza PRIMARY KEY(cod_peza)
);

CREATE TABLE proveedor_fornece_peza (
	cod_proveedorpeza INT AUTO_INCREMENT,
	#Escribimos las claves foráneas que vamos a asociar:
    cod_proveedor INT,
    cod_peza INT,
    #Definimos las clave primaria, y foránea/s:
	CONSTRAINT PK_proveedor_fornece_peza PRIMARY KEY(cod_proveedorpeza),
	CONSTRAINT FK_proveedor_fornece_peza1 FOREIGN KEY(cod_proveedor) REFERENCES proveedor(cod_proveedor),
	CONSTRAINT FK_proveedor_fornece_peza2 FOREIGN KEY(cod_peza) REFERENCES peza(cod_peza)
);

CREATE TABLE categoria (
	cod_categoria INT AUTO_INCREMENT,
    nome VARCHAR(50),
    #Escribimos las claves foráneas que vamos a asociar:
    cod_peza INT,
	#Definimos las clave primaria, y foránea/s:
    CONSTRAINT PK_categoria PRIMARY KEY(cod_categoria),
    CONSTRAINT FK_categoria FOREIGN KEY(cod_peza) REFERENCES peza(cod_peza)
);
    
#Esta es una forma de insertar datos:
INSERT INTO proveedor VALUES( 1, "Calle Bonita","Teo", "A Coruña");
#Esta es otra forma de insertar datos (eligiendo que columna):
INSERT INTO proveedor(cod_proveedor, direccion, cidade, provincia) VALUES( 2, "Calle Preciosa","Teo", "A Coruña");

INSERT INTO peza VALUES(1, "Tornillo", "Gris", 0.50, 1);
INSERT INTO peza VALUES(2, "Tuerca", "Gris", 0.75, 2);

INSERT INTO proveedor_fornece_peza VALUES(1, 1, 1);
INSERT INTO proveedor_fornece_peza VALUES(2, 2, 2);

INSERT INTO categoria VALUES(1, "Acero", 1);
INSERT INTO categoria VALUES(2, "Acero", 2);

SELECT * FROM proveedor;
SELECT * FROM peza;
SELECT * FROM proveedor_fornece_peza;
SELECT * FROM categoria;

#Selecciona o nome e prezo dun artículo, así coma a que cidade pertence o proveedor
SELECT nome, prezo, cidade
FROM peza, proveedor
WHERE peza.cod_peza = proveedor.cod_proveedor;

