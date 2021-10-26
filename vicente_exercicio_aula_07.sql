create schema bd_aula_07;

create table bd_aula_07.cliente(
	cod_cli int,
    nome varchar(50),
    cpf varchar(14),
    rua varchar(50),
    num varchar(5),
    bairro varchar(50),
    cidade varchar(50),
    uf varchar(2),
    cep varchar(9),
    primary key(cod_cli)
);

insert into bd_aula_07.cliente(cod_cli, nome, cpf, rua, num, bairro, cidade, uf, cep)
	values (1, 'Gilberto', '12345678901', 'Av. Astronautas', '1234', 'Cidade Jardim', 'S. J. dos Campos', 'SP', '12227-220');
    
insert into bd_aula_07.cliente(cod_cli, nome, cpf, rua, num, bairro, cidade, uf, cep)
	values (4, 'Eduardo', '12345678902', 'Av. X', '1234', 'Vila', 'Rio de Janeiro', 'RJ', '35000000');
    
insert into bd_aula_07.cliente values (2, 'Bruno', '12345678902', 'Rua Albino Sartori', '95', 'V.S.J', 'Ouro Preto', 'MG', '35400-000');

insert into bd_aula_07.cliente (cod_cli, nome, cpf, rua) 
	values (3, 'Ricardo', '12345678903', 'Rua Ceci');

insert into bd_aula_07.cliente (cod_cli, nome, cpf) values(5, 'Antonio', '12345678904');

/*delete from bd_aula_07.cliente where cod_cli<0;

delete from bd_aula_07.cliente where nome='Bruno';

delete from bd_aula_07.cliente;*/

update bd_aula_07.cliente set nome='João' where cod_cli=0;
update bd_aula_07.cliente set nome='João' where nome = 'Bruno';

SELECT * FROM bd_aula_07.cliente;
SELECT * FROM bd_aula_07.cliente where cod_cli = 3;
SELECT nome, rua FROM bd_aula_07.cliente;
