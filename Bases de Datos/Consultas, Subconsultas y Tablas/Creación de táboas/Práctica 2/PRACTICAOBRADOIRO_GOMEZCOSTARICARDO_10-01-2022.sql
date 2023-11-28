DROP DATABASE IF EXISTS obradoiro;
CREATE DATABASE obradoiro;
USE obradoiro;

CREATE TABLE IF NOT EXISTS alumno (
	id_alumno INT AUTO_INCREMENT,
	dni VARCHAR(10),
	nome VARCHAR(50),
	apelido1 VARCHAR(50),
	apelido2 VARCHAR(50),
	grupo VARCHAR(2),
	CONSTRAINT PK_alumno PRIMARY KEY (id_alumno)
);

CREATE TABLE IF NOT EXISTS exame_teorico (
	id_exame INT AUTO_INCREMENT,
    titulo VARCHAR(50),
    numero_preguntas INT,
    Fecha DATE,
    CONSTRAINT PK_exame PRIMARY KEY (id_exame)
    );

CREATE TABLE IF NOT EXISTS alumno_fai_exame_teorico (
    id_alumno INT,
    id_exame INT,
    nota INT,
    CONSTRAINT PK_alumno_exame PRIMARY KEY (id_alumno, id_exame),
    CONSTRAINT FK_alumno FOREIGN KEY(id_alumno) REFERENCES alumno(id_alumno),
    CONSTRAINT FK_exame FOREIGN KEY(id_exame) REFERENCES exame_teorico(id_exame)
    );
    
    # Inserción datos en "alumno"
    INSERT INTO alumno VALUES ("1", "45762345M","Ricardo","Gómez","Costa","1");
    INSERT INTO alumno VALUES ("2","45762345M","Ana","Albela","García","1");
    INSERT INTO alumno VALUES ("3","45262345M","Tamara","Ares","Gestoso","1");
    INSERT INTO alumno VALUES ("4","45762365M","Antía","Castro","Barrio","1");
	INSERT INTO alumno VALUES ("5","45762545M","Judith","González","Taboada","1");
    INSERT INTO alumno VALUES ("6","46762345M","Nicolás","Golan","Mosquera","1");
    INSERT INTO alumno VALUES ("7","45762345M","David","Fernández","Soto","1");
    INSERT INTO alumno VALUES ("8","45762347M","Sonia","Vázquez","Núñez","1");
	INSERT INTO alumno VALUES ("9","35762345M","María","López","Martínez","1");
    INSERT INTO alumno VALUES ("10","25762345M","Adrián","Pereiro","González","1");
    INSERT INTO alumno VALUES ("11","45764345M","Sonia","López","Puente","1");
    INSERT INTO alumno VALUES ("12","47762345M","Agustín","Prevettoni","Novoa","1");
	INSERT INTO alumno VALUES ("13","45762845M","Aitana","Ferradáns","Sánchez","1");
    INSERT INTO alumno VALUES ("14","45262345M","Alex","Sánchez","Rey","1");
    INSERT INTO alumno VALUES ("15","45762375M","Tatiana","García","Canicoba","1");
    INSERT INTO alumno VALUES ("16","45702345M","Sonia","Gómez","López","1");
    
	#Inserción datos en "exame_teorico"
    INSERT INTO exame_teorico VALUES ( "1","Bases de datos","20","2022/10/01");
    INSERT INTO exame_teorico VALUES ( "2","Programación","25","2022/10/02");
    
    #Inserción datos en "alumno_fai_exame_teorico"
	INSERT INTO alumno_fai_exame_teorico VALUES ("1","1","8");
    INSERT INTO alumno_fai_exame_teorico VALUES ("1","2","5");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("2","1","8");
    INSERT INTO alumno_fai_exame_teorico VALUES ("2","2","6");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("3","1","7");
    INSERT INTO alumno_fai_exame_teorico VALUES ("3","2","6");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("4","1","8");
    INSERT INTO alumno_fai_exame_teorico VALUES ("4","2","5");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("5","1","8");
    INSERT INTO alumno_fai_exame_teorico VALUES ("5","2","6");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("6","1","7");
    INSERT INTO alumno_fai_exame_teorico VALUES ("6","2","6");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("7","1","7");
    INSERT INTO alumno_fai_exame_teorico VALUES ("7","2","7");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("8","1","6");
    INSERT INTO alumno_fai_exame_teorico VALUES ("8","2","8");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("9","1","8");
    INSERT INTO alumno_fai_exame_teorico VALUES ("9","2","5");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("10","1","5");
    INSERT INTO alumno_fai_exame_teorico VALUES ("10","2","8");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("11","1","6");
    INSERT INTO alumno_fai_exame_teorico VALUES ("11","2","6");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("12","1","7");
    INSERT INTO alumno_fai_exame_teorico VALUES ("12","2","7");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("13","1","5");
    INSERT INTO alumno_fai_exame_teorico VALUES ("13","2","7");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("14","1","7");
    INSERT INTO alumno_fai_exame_teorico VALUES ("14","2","5");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("15","1","6");
    INSERT INTO alumno_fai_exame_teorico VALUES ("15","2","7");
    
    INSERT INTO alumno_fai_exame_teorico VALUES ("16","1","8");
    INSERT INTO alumno_fai_exame_teorico VALUES ("16","2","5");
    

# 2.1. Unha consulta sobre a taboa alumnos.
SELECT * FROM alumno;


# 2.2. Unha consulta sobre a taboa Exame_teórico.
SELECT * FROM exame_teorico;


# 2.3. Una consulta que de como resultado o nome do alumno cos apelidos, a nota do examen e o examen co que corresponde.

# Examen de Bases de datos:
SELECT alumno.nome, alumno.apelido1, alumno.apelido2, alumno_fai_exame_teorico.nota, id_exame
FROM alumno, alumno_fai_exame_teorico
WHERE alumno.id_alumno = alumno_fai_exame_teorico.id_alumno AND id_exame=1;

SELECT alumno.nome, alumno.apelido1, alumno.apelido2, alumno_fai_exame_teorico.nota, alumno_fai_exame_teorico.id_exame, exame_teorico.titulo
FROM alumno 
INNER JOIN alumno_fai_exame_teorico ON alumno.id_alumno = alumno_fai_exame_teorico.id_alumno
INNER JOIN exame_teorico ON alumno_fai_exame_teorico.id_exame = exame_teorico.id_exame
WHERE alumno_fai_exame_teorico.id_exame=1;

# Examen de Programación:
SELECT alumno.nome, alumno.apelido1, alumno.apelido2, alumno_fai_exame_teorico.nota, id_exame
FROM alumno, alumno_fai_exame_teorico
WHERE alumno.id_alumno = alumno_fai_exame_teorico.id_alumno AND id_exame=2;
    
SELECT alumno.nome, alumno.apelido1, alumno.apelido2, alumno_fai_exame_teorico.nota, alumno_fai_exame_teorico.id_exame, exame_teorico.titulo
FROM alumno 
INNER JOIN alumno_fai_exame_teorico ON alumno.id_alumno = alumno_fai_exame_teorico.id_alumno
INNER JOIN exame_teorico ON alumno_fai_exame_teorico.id_exame = exame_teorico.id_exame
WHERE alumno_fai_exame_teorico.id_exame=2;


    
    