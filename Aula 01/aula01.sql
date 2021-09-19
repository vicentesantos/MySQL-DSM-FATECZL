CREATE TABLE bd_aula_01.nome_completo (
ID INT,
CPF VARCHAR(14),
NOME_COMPLETO VARCHAR(255),
Primary Key (ID),
unique (CPF)
);

CREATE TABLE bd_aula_01.apelido (
ID INT,
APELIDO VARCHAR(255) NOT NULL,
ID_NOME INT,
primary key (ID),
foreign key (ID_NOME) REFERENCES nome_completo(ID)
);