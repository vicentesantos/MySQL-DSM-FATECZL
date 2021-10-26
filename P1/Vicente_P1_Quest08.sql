create schema vicente_p1;

create table vicente_p1.usuarios(
	ID INT NOT NULL,
    NOME VARCHAR(255) NOT NULL,
    DATA_NASC DATE NOT NULL,
    EMAIL TINYTEXT NOT NULL,
    GENERO VARCHAR(10),
    TELEFONE INT,
    ENDERECO TEXT,
    PRIMARY KEY (ID),
    UNIQUE (ID)
);