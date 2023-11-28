DROP DATABASE IF EXISTS empresa;
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

CREATE TABLE departamentos(
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    concello VARCHAR(50) NOT NULL,
    orzamento DECIMAL(10) NOT NULL,
    CONSTRAINT pk_departamentos PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS empregados(
    numero INT NOT NULL AUTO_INCREMENT,
	departamento INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    salario FLOAT(10) NOT NULL,
    data_alta DATE NOT NULL,
    xefe VARCHAR(50) NOT NULL,
    CONSTRAINT pk_empregados PRIMARY KEY (numero),
    CONSTRAINT fk_empregados FOREIGN KEY (departamento) REFERENCES departamentos(id)
);

INSERT INTO departamentos VALUES (1,"Ventas","Vedra",01);
INSERT INTO departamentos VALUES (2,"Compras","Teo",02);
INSERT INTO departamentos VALUES (3,"Alquileres","Boqueixón",03);
INSERT INTO departamentos VALUES (4,"Marketing","Santiago",04);
INSERT INTO departamentos VALUES (5,"Logística","Ames",05);

INSERT INTO empregados VALUES (1,1,"Ana","1080.49","2009/10/02","Sonia");
INSERT INTO empregados VALUES (2,5,"Tamara","1080.51","2008/11/03","Tatiana");
INSERT INTO empregados VALUES (3,4,"Antía","1081.69","2009/10/02","Alexandre");
INSERT INTO empregados VALUES (4,3,"Judith","1082.11","2008/11/03","Aitana");
INSERT INTO empregados VALUES (5,2,"Nicolás","1084.89","2009/10/02","María");
INSERT INTO empregados VALUES (6,2,"Ricardo","1070.43","2010/11/02","Sonia");
INSERT INTO empregados VALUES (7,5,"David","1000.31","2006/06/03","Tatiana");


#Unha vez realizada a Base de datos responde as seguintes consultas:
#1. Queremos coñecer, para cada empregado da organización, o seu número de empregado, nome e o nome do departamento ao cal pertence.
SELECT numero, nome, departamento
FROM empregados;

#2. Queremos coñecer a media de salarios da organización.
SELECT AVG(salario)
FROM empregados;

#3. Queremos coñecer a media de salarios da organización agrupados por departamentos.
SELECT AVG(salario), departamento
FROM empregados
GROUP BY departamento;

#4. Queremos coñecer, para cada empregado, o nome do seu xefe.
SELECT nome, xefe
FROM empregados;

#5. Queremos coñecer, para cada empregado, o departamento no que traballa e o seu xefe.
SELECT empregados.nome, empregados.xefe,empregados.departamento, departamentos.nome
FROM empregados, departamentos
WHERE empregados.departamento=departamentos.id;

#6. Queremos coñecer, para cada empregado, o nome do seu xefe e o departamento no que traballa ese xefe. 
SELECT nome, xefe, departamento
FROM empregados;
