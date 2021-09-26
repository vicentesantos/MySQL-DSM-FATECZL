/********************************
Banco de Dados - Relacional
Prof. Francisco Abreu
Aluno: Vicente Santos Gonçalves
RA: 1111392111035

********************************/

CREATE SCHEMA vicente_bd;

CREATE TABLE vicente_bd.alunos(
RA INT,
NOME VARCHAR(255) NOT NULL,
DT_NASC VARCHAR(10) NOT NULL,
EMAIL VARCHAR (255) NOT NULL,
TEL VARCHAR(15),
PRIMARY KEY (RA),
UNIQUE (RA)
);

CREATE TABLE vicente_bd.disciplina(
COD_DISC INT,
PROF VARCHAR(255) NOT NULL,
ID_RA INT,
PRIMARY KEY (COD_DISC),
FOREIGN KEY (ID_RA) REFERENCES alunos(RA),
UNIQUE (COD_DISC)
);

CREATE TABLE vicente_bd.curso(
COD_CURSO INT,
NOME_CURSO VARCHAR(255) NOT NULL,
PERIODO VARCHAR(45) NOT NULL,
ID_RA INT,
ID_DISC INT,
primary key (COD_CURSO),
foreign key (ID_RA) REFERENCES alunos(RA),
foreign key (ID_DISC) REFERENCES disciplina(COD_DISC),
UNIQUE (COD_CURSO)
); 

CREATE TABLE vicente_bd.nota(
NOTA FLOAT NOT NULL,
ID_RA INT,
ID_DISC INT,
foreign key (ID_RA) REFERENCES alunos(RA),
foreign key (ID_DISC) REFERENCES disciplina(COD_DISC)
);