# Creación da Base de Datos "tarefa41".

DROP DATABASE IF EXISTS tarefa41;
CREATE DATABASE IF NOT EXISTS tarefa41;
USE tarefa41;

#*Sentenza 1: crea unha táboa paises que inclúa as columnas id_pais, nome_pais e id_continente.

CREATE TABLE paises (
	id_pais INT,
	nome_pais VARCHAR(30), 
	id_continente INT,
	CONSTRAINT PK_pais PRIMARY KEY (id_pais)
);



#Sentenza 2: crea, comprobando se existe, a táboa paises.

CREATE TABLE IF NOT EXISTS paises (
	id_pais INT,
	nome_pais VARCHAR(30), 
	id_continente INT,
	CONSTRAINT PK_pais PRIMARY KEY (id_pais)
);



#Sentenza 3: crea unha táboa dup_paises que teña a mesma estrutura da táboa paises.

CREATE TABLE IF NOT EXISTS dup_paises LIKE paises;



#Sentenza 4: crea unha táboa dup_paises que teña a mesma estrutura da táboa paises (sen contar as restricións) e que conteña todos os datos incluídos nesta última.

CREATE TABLE IF NOT EXISTS dup_paises AS SELECT * FROM paises;



#Sentenza 5: crea unha táboa paises de xeito que ningunha das súas columnas admita nulos.

CREATE TABLE IF NOT EXISTS paises (
	id_pais INT NOT NULL,
	nome_pais VARCHAR(30) NOT NULL, 
	id_continente INT NOT NULL,
	CONSTRAINT PK_paises PRIMARY KEY (id_pais)
);



#Sentenza 6: crea una táboa categorias que inclúa as columnas id_categoria, descricion, salario_min e salario_max.

CREATE TABLE IF NOT EXISTS categorias (
	id_categoria INT,
	descricion VARCHAR(30),
	salario_min INT,
	salario_max INT,
	CONSTRAINT PK_categorias PRIMARY KEY(id_categoria)
);



#Sentenza 7: crea a táboa categorías comprobando que o salario máximo non exceda o límite de 25.000.

CREATE TABLE IF NOT EXISTS categorias (
	id_categoria INT,
	descricion VARCHAR(30),
	salario_min INT,
	salario_max INT,
	CONSTRAINT PK_categorias PRIMARY KEY(id_categoria),
	CONSTRAINT CK_categorias CHECK(salario_max<=25000)
);



#Sentenza 8: crea a táboa paises de xeito que no campo nome_pais só poda introducirse Italia, India ou China.

#Opción1 con SET
CREATE TABLE IF NOT EXISTS paises (
	id_pais INT NOT NULL,
	nome_pais SET("Italia","India","China") NOT NULL, 
	id_continente INT NOT NULL,
	CONSTRAINT PK_paises PRIMARY KEY (id_pais)
); 



#Opción2 con CHECK
CREATE TABLE IF NOT EXISTS paises (
	id_pais INT NOT NULL,
	nome_pais VARCHAR(30) CHECK(nome_pais IN("Italia","India","China"))  NOT NULL, 
	id_continente INT NOT NULL,
	CONSTRAINT PK_paises PRIMARY KEY (id_pais)	
);



#Opción3 con CHECK
CREATE TABLE IF NOT EXISTS paises (
	id_pais INT NOT NULL,
	nome_pais VARCHAR(30) NOT NULL, 
	id_continente INT NOT NULL,
	CONSTRAINT PK_paises PRIMARY KEY (id_pais),
	CONSTRAINT Check_paises CHECK (nome_pais IN("Italia","India","China")) 
);



INSERT INTO paises
VALUES("1","Italia","1"); #OK

INSERT INTO paises
VALUES("2","AMERICA","2"); #Tiene que dar error.



#Sentenza 9: crea unha táboa historial_categorias que inclúa as columnas id_empregado, data_inicio, data_fin, id_categoria e id_departamento.

CREATE TABLE IF NOT EXISTS historial_categorias (
	id_empregado INT,
	data_inicio DATE,
	data_fin DATE,
	id_categoria INT,
	id_departamento INT,
	CONSTRAINT PK_historial_categorias PRIMARY KEY(id_empregado)
);
	


#Sentenza 10: crea a táboa historial_categorias comprobando que data_fin sexa posterior ou igual a data_inicio.

CREATE TABLE IF NOT EXISTS historial_categorias (
	id_empregado INT,
	data_inicio DATE,
	data_fin DATE,
	id_categoria INT,
	id_departamento INT,
	CONSTRAINT PK_historial_categorias PRIMARY KEY(id_empregado),
	CONSTRAINT CK_historial_categorias CHECK(data_fin>=data_inicio)
);
	
	

#Sentenza 11: crea a táboa paises asegurando que o campo id_pais sexa clave primaria.

CREATE TABLE IF NOT EXISTS paises (
	id_pais INT NOT NULL,
	nome_pais SET("Italia","India","China") NOT NULL, 
	id_continente INT NOT NULL,
	CONSTRAINT PK_paises PRIMARY KEY (id_pais)
);



/* Sentenza 12: crea a táboa categorias asegurando que o valor por defecto para descricion sexa unha cadea de texto baleira, 
 que o salario mínimo sexa 8.000 e que o salario máximo teña valor por defecto nulo. */

CREATE TABLE IF NOT EXISTS categorias (
	id_categoria INT,
	descricion VARCHAR(30) DEFAULT " ",
	salario_min DOUBLE,
	salario_max DOUBLE DEFAULT NULL,
	CONSTRAINT PK_categorias PRIMARY KEY(id_categoria),
	CONSTRAINT CK_categorias CHECK(salario_max<=25000), CHECK(salario_min>=8000)
);



#Sentenza 13: crea a táboa paises asegurando que o campo id_pais sexa autoincremental.

CREATE TABLE IF NOT EXISTS paises (
	id_pais INT AUTO_INCREMENT NOT NULL,
	nome_pais SET("Italia","India","China") NOT NULL, 
	id_continente INT NOT NULL,
	CONSTRAINT PK_paises PRIMARY KEY (id_pais)
);



#Sentenza 14: crea a táboa paises de xeito que a combinación das columnas nome_pais e id_continente teña valor único.

CREATE TABLE paises ( 
    id_pais INT NOT NULL AUTO_INCREMENT, 
    nome_pais SET ('Italia', 'India', 'China')NOT NULL, 
    id_continente INT NOT NULL, 
    CONSTRAINT PK_paises PRIMARY KEY (id_pais), 
    CONSTRAINT UI_paises UNIQUE INDEX (nome_pais, id_continente) #Unir 2 en 1 para que tengan valor único.
); 
 
 
 
#Sentenza 15: crea a táboa categorias con id_categoria coma clave primaria.

CREATE TABLE IF NOT EXISTS categorias (
	id_categoria INT,
	descricion VARCHAR(30) DEFAULT " ",
	salario_min INT,
	salario_max INT DEFAULT NULL,
	CONSTRAINT PK_categorias PRIMARY KEY(id_categoria),
	CONSTRAINT CK_categorias CHECK(salario_max<=25000), CHECK(salario_min>=8000)
);



/* Sentenza 16: crea a táboa historial_categorias de xeito que id_empregado non admita duplicados, 
e que id_categoria sexa unha clave foránea con respecto a categorias asegurando que os datos existen en nesta táboa. */

CREATE TABLE IF NOT EXISTS historial_categorias (
	id_empregado INT,
	data_inicio DATE,
	data_fin DATE,
	id_categoria INT,
	id_departamento INT,
	CONSTRAINT PK_historial_categorias PRIMARY KEY(id_empregado),
	CONSTRAINT CK_historial_categorias CHECK(data_fin>=data_inicio),
	CONSTRAINT FK_historial_categorias FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria),
	CONSTRAINT UN_historial_categorias UNIQUE(id_empregado)
);



#Sentenza 17: crea a táboa departamentos que inclúa as columnas id_departamento (que será clave primaria), nome e localizacion.

CREATE TABLE IF NOT EXISTS departamentos (
	id_departamento INT NOT NULL,
	nome VARCHAR(30),
	localización VARCHAR(30),
	CONSTRAINT PK_departamentos PRIMARY KEY(id_departamento)
);



/* Sentenza 18: crea a táboa empregados que inclúa as columnas id_empregado, nome, apelido1,apelido2, email, telefono, data_alta, id_categoria, salario, comision, 
id_responsable, e id_departamento. Faino de xeito que id_empregado sexa clave primaria, 
id_categoria unha clave foránea facendo referencia á táboa categorias e id_departamento unha clave foránea facendo referencia á táboa departamentos. */


CREATE TABLE IF NOT EXISTS empregados (
	id_empregado INT,
	nome VARCHAR(30),
	apelido1 VARCHAR(30),
	apelido2 VARCHAR(30),
	email VARCHAR(30),
	telefono INT,
	data_alta DATE,
	id_categoria INT,
	salario DOUBLE,
	comision DOUBLE,
	id_responsable INT,
	id_departamento INT,
	CONSTRAINT PK_empregados PRIMARY KEY(id_empregado),
	CONSTRAINT FK_empregados FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria)
	CONSTRAINT FK_empregados FOREIGN KEY(id_departamento) REFERENCES departamentos(id_departamento)
);



#Sentenza 19: crea a táboa empregados de xeito que as claves foráneas id_categoria e id_departamento impida os borrados e produza actualizacións en cascada.

CREATE TABLE IF NOT EXISTS empregados (
	id_empregado INT,
	nome VARCHAR(30),
	apelido1 VARCHAR(30),
	apelido2 VARCHAR(30),
	email VARCHAR(30),
	telefono INT,
	data_alta DATE,
	id_categoria INT,
	salario DOUBLE,
	comision DOUBLE,
	id_responsable INT,
	id_departamento INT,
	CONSTRAINT PK_empregados PRIMARY KEY(id_empregado),
	CONSTRAINT FK_empregados FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT FK_empregados FOREIGN KEY(id_departamento) REFERENCES departamentos(id_departamento) ON UPDATE CASCADE ON DELETE RESTRICT
);



#Sentenza 20: crea a táboa empregados de xeito que o salario non poda ser inferior a 1000.

CREATE TABLE IF NOT EXISTS empregados (
	id_empregado INT,
	nome VARCHAR(30),
	apelido1 VARCHAR(30),
	apelido2 VARCHAR(30),
	email VARCHAR(30),
	telefono INT,
	data_alta DATE,
	id_categoria INT,
	salario DOUBLE,
	comision DOUBLE,
	id_responsable INT,
	id_departamento INT,
	CONSTRAINT PK_empregados PRIMARY KEY(id_empregado),
	CONSTRAINT FK_empregados FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT FK_empregados FOREIGN KEY(id_departamento) REFERENCES departamentos(id_departamento) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT CK_empregados CHECK(salario>=1000)
);



