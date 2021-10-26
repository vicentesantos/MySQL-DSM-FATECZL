/********************************
Banco de Dados - Relacional
Prof. Francisco Abreu
Aluno: Vicente Santos Gonçalves
RA: 1111392111035
********************************/

create schema vicente_records;

-- Tabelas

create table vicente_records.gravadora(
grav_cod int not null auto_increment,
grav_nome varchar(100) null default null,
grav_end varchar(255) null default null,
primary key (grav_cod)
);

create table vicente_records.autor(
aut_cod int not null auto_increment,
aut_nome varchar(255) null default null,
primary key (aut_cod)
);

create table vicente_records.musica(
mus_cod int not null auto_increment,
mus_nome varchar(255) null default null,
mus_duracao varchar(5) not null,
mus_faixa int,
primary key (mus_cod)
);

create table vicente_records.album(
cod_album int not null auto_increment,
cd_grav_cod int,
cd_nome varchar(255) null default null,
cd_valor float null default null,
cd_dt_lancamento year null default null,
primary key (cod_album),
foreign key (cd_grav_cod) references gravadora(grav_cod)
);

create table vicente_records.item_cd(
ite_album_cod int,
ite_mus_cod int,
foreign key (ite_album_cod) references album(cod_album),
foreign key (ite_mus_cod) references musica(mus_cod)
);

create table vicente_records.musica_autor(
aut_cod int,
mus_cod int,
foreign key (aut_cod) references autor(aut_cod),
foreign key (mus_cod) references musica(mus_cod)
); 

-- Inserção de Dados

-- Dados Gravadora
insert into vicente_records.gravadora(grav_nome, grav_end) values ('Epitaph Records', '2798, Sunset Blvd, Los Angeles, CA, 90026');
insert into vicente_records.gravadora(grav_nome, grav_end) values ('Sony Music Brasil', 'Rua Lauro Müller, 116, 40º andar, Botafogo, Rio de Janeiro, RJ, CEP: 22290-160');
insert into vicente_records.gravadora(grav_nome, grav_end) values ('Deckdisc', 'Av. das Américas, 500, Barra da Tijuca, Rio de Janeiro, RJ, CEP 22640-100');
insert into vicente_records.gravadora(grav_nome, grav_end) values ('Baratos Afins Discos', 'Av. São João, 439, 2º andar, Lojas 314/318, CEP 01035-000, São Paulo, SP');

-- Dados Autor
insert into vicente_records.autor(aut_nome) values ('This Wild Life');
insert into vicente_records.autor(aut_nome) values ('Bring Me The Horizon');
insert into vicente_records.autor(aut_nome) values ('Pitty');
insert into vicente_records.autor(aut_nome) values ('Ratos de Porão');

-- Dados Música
insert into vicente_records.musica(mus_nome, mus_duracao, mus_faixa) values ('Break Down', '2:34', 3);
insert into vicente_records.musica(mus_nome, mus_duracao, mus_faixa) values ('Kingslayer', '3:40', 6);
insert into vicente_records.musica(mus_nome, mus_duracao, mus_faixa) values ('Memórias', '3:34', 4);
insert into vicente_records.musica(mus_nome, mus_duracao, mus_faixa) values ('Cérebros Atômicos', '2:18', 1);

-- Dados Álbum
insert into vicente_records.album(cd_grav_cod, cd_nome, cd_valor, cd_dt_lancamento) values (1, 'Low Tides', 9.99, 2016);
insert into vicente_records.album(cd_grav_cod, cd_nome, cd_valor, cd_dt_lancamento) values (2, 'Post Human: Survival Horror', 19.99, 2020);
insert into vicente_records.album(cd_grav_cod, cd_nome, cd_valor, cd_dt_lancamento) values (3, 'Anacrônico', 9.99, 2005);
insert into vicente_records.album(cd_grav_cod, cd_nome, cd_valor, cd_dt_lancamento) values (4, 'Descanse em Paz', 59.99, 1986);

-- Dados Item CD
insert into vicente_records.item_cd(ite_album_cod, ite_mus_cod) values (1, 1);
insert into vicente_records.item_cd(ite_album_cod, ite_mus_cod) values (2, 2);
insert into vicente_records.item_cd(ite_album_cod, ite_mus_cod) values (3, 3);
insert into vicente_records.item_cd(ite_album_cod, ite_mus_cod) values (4, 4);

-- Dados Música/Autor
insert into vicente_records.musica_autor(aut_cod, mus_cod) values (1, 1);
insert into vicente_records.musica_autor(aut_cod, mus_cod) values (2, 2);
insert into vicente_records.musica_autor(aut_cod, mus_cod) values (3, 3);
insert into vicente_records.musica_autor(aut_cod, mus_cod) values (4, 4);