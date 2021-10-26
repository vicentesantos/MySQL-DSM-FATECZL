/********************************
Banco de Dados - Relacional
Prof. Francisco Abreu
Aluno: Vicente Santos Gonçalves
RA: 1111392111035

********************************/

/*CREATE SCHEMA vicente_oficina_bd;*/

CREATE TABLE vicente_oficina_bd.cliente(
ID INT NOT NULL,
CPF VARCHAR(14) NOT NULL,
NOME VARCHAR(255) ,
ENDERECO VARCHAR(255),
TELEFONE INT,
PRIMARY KEY (ID),
UNIQUE (ID),
UNIQUE (CPF)
);

CREATE TABLE vicente_oficina_bd.produto(
ID INT NOT NULL,
DESCRICAO TEXT NOT NULL,
CUSTO FLOAT NOT NULL,
PRIMARY KEY (ID),
UNIQUE (ID)
);

CREATE TABLE vicente_oficina_bd.servico(
ID INT NOT NULL,
DESCRICAO TEXT NOT NULL,
CUSTO FLOAT NOT NULL,
TEMPO_REALIZACAO VARCHAR(25),
PRIMARY KEY (ID),
UNIQUE (ID)
);

CREATE TABLE vicente_oficina_bd.veiculo(
RENAVAN INT NOT NULL,
CHASSI VARCHAR(100),
MODELO VARCHAR(100),
COR TEXT,
ID_CLIENTE INT NOT NULL,
PRIMARY KEY (RENAVAN),
FOREIGN KEY (ID_CLIENTE) REFERENCES cliente(ID),
UNIQUE (RENAVAN)
);

CREATE TABLE vicente_oficina_bd.relato_cliente(
ID_RELATO INT NOT NULL,
PROBLEMA TEXT NOT NULL,
DATA_RELATO DATE NOT NULL,
ID_VEICULO INT NOT NULL,
PRIMARY KEY (ID_RELATO),
FOREIGN KEY (ID_VEICULO) REFERENCES veiculo(RENAVAN),
UNIQUE (ID_RELATO)
);

CREATE TABLE vicente_oficina_bd.orcamento(
ID INT NOT NULL,
ID_VEICULO INT NOT NULL,
SITUACAO TINYTEXT,
VALOR FLOAT,
DATA_ORCAMENTO DATE,
PREVISAO_ENTREGRA DATE,
FORMA_PAGAMENTO TINYTEXT,
PRIMARY KEY (ID),
FOREIGN KEY (ID_VEICULO) REFERENCES veiculo(RENAVAN),
UNIQUE (ID)
);

CREATE TABLE vicente_oficina_bd.item_servico(
SITUACAO TINYTEXT NOT NULL,
ID_ORCAMENTO INT NOT NULL,
ID_SERVICO INT NOT NULL,
CUSTO FLOAT,
FOREIGN KEY (ID_ORCAMENTO) REFERENCES orcamento(ID),
FOREIGN KEY (ID_SERVICO) REFERENCES servico(ID)
);

CREATE TABLE vicente_oficina_bd.item_produto(
SITUACAO TINYTEXT NOT NULL,
CUSTO FLOAT NOT NULL,
QUANTIDADE INT NOT NULL,
ID_ORCAMENTO INT NOT NULL,
ID_PRODUTO INT NOT NULL,
FOREIGN KEY (ID_ORCAMENTO) REFERENCES orcamento(ID),
FOREIGN KEY (ID_PRODUTO) REFERENCES produto(ID)
);

ALTER TABLE vicente_oficina_bd.cliente
	CHANGE COLUMN NOME NOME_COMPLETO VARCHAR(255);
    
ALTER TABLE vicente_oficina_bd.veiculo
	ADD COLUMN ANO YEAR(4);

/*DROP TABLE vicente_oficina_bd.item_produto;
DROP TABLE vicente_oficina_bd.item_servico;
DROP TABLE vicente_oficina_bd.orcamento;
DROP TABLE vicente_oficina_bd.relato_cliente;
DROP TABLE vicente_oficina_bd.veiculo;
DROP TABLE vicente_oficina_bd.servico;
DROP TABLE vicente_oficina_bd.produto;
DROP TABLE vicente_oficina_bd.cliente;*/

							-- INSERINDO DADOS

-- tabela cliente 
insert into vicente_oficina_bd.cliente(ID, CPF, NOME_COMPLETO, ENDERECO, TELEFONE)
	values(1, '12345678900', 'Astolfo Barroso Pinto', 'Rua dos Bobos, 0', 999999999);
insert into vicente_oficina_bd.cliente(ID, CPF, NOME_COMPLETO, ENDERECO, TELEFONE)
	values(2, '12345678901', 'Rogéria', 'Rua dos Bobos, 0',  999999999);
insert into vicente_oficina_bd.cliente(ID, CPF, NOME_COMPLETO, ENDERECO, TELEFONE)
	values(3, '12345678902', 'RuPaul Andre Charles', 'Rua das Drags, 69', 222222222);  
insert into vicente_oficina_bd.cliente(ID, CPF, NOME_COMPLETO, ENDERECO, TELEFONE)
	values(4, '12345678903', 'Eike Maravilha', 'Avenida dos Animados, 55', 333333333);
insert into vicente_oficina_bd.cliente(ID, CPF, NOME_COMPLETO, ENDERECO, TELEFONE)
	values(5, '12345678904', 'Gretchen Miranda', 'Rua Freak Le Boom Boom, 640', 444444444);    
insert into vicente_oficina_bd.cliente(ID, CPF, NOME_COMPLETO, ENDERECO, TELEFONE)
	values(6, '12345678905', 'Inês Brasil', 'Alameda dos Make Love, 696', 555555555);    
insert into vicente_oficina_bd.cliente(ID, CPF, NOME_COMPLETO, ENDERECO, TELEFONE)
	values(7, '12345678906', 'Andresa Urach', 'Rua da Vice Miss Bumbum, 55', 669696969);    
insert into vicente_oficina_bd.cliente(ID, CPF, NOME_COMPLETO, ENDERECO, TELEFONE)
	values(8, '12345678907', 'Nicole Bahls', 'Rua da Fazenda, 88', 666666666);

-- tabela veículo
insert into vicente_oficina_bd.veiculo(RENAVAN, CHASSI, MODELO, COR, ID_CLIENTE, ANO)
	values (1234567890, 'A123456789', 'CHEVROLET SPIN', 'PRETO', 1, 2015);
insert into vicente_oficina_bd.veiculo(RENAVAN, CHASSI, MODELO, COR, ID_CLIENTE, ANO)
	values (1234567891, 'B123456789', 'FIAT UNO', 'VERMELHO', 2, 2015);    
insert into vicente_oficina_bd.veiculo(RENAVAN, CHASSI, MODELO, COR, ID_CLIENTE, ANO)
	values (1234567892, 'C123456789', 'PORSCHE CAYENNE', 'ROSA', 3, 2020);    
insert into vicente_oficina_bd.veiculo(RENAVAN, CHASSI, MODELO, COR, ID_CLIENTE, ANO)
	values (1234567893, 'D123456789', 'FORD KA', 'AZUL', 4, 2012);    
insert into vicente_oficina_bd.veiculo(RENAVAN, CHASSI, MODELO, COR, ID_CLIENTE, ANO)
	values (1234567894, 'E123456789', 'CHEVROLET VECTRA', 'VERDE', 5, 2000);    
insert into vicente_oficina_bd.veiculo(RENAVAN, CHASSI, MODELO, COR, ID_CLIENTE, ANO)
	values (1234567895, 'F123456789', 'VOLKSWAGEN FOX', 'VERMELHO', 6, 2013);    
insert into vicente_oficina_bd.veiculo(RENAVAN, CHASSI, MODELO, COR, ID_CLIENTE, ANO)
	values (1234567896, 'G123456789', 'VOLKSWAGEN FUSCA', 'BRANCO', 7, 1974);    
insert into vicente_oficina_bd.veiculo(RENAVAN, CHASSI, MODELO, COR, ID_CLIENTE, ANO)
	values (1234567897, 'H123456789', 'FIAT 500', 'PRETO', 8, 2014);

-- tabela relato do cliente
insert into vicente_oficina_bd.relato_cliente(ID_RELATO, PROBLEMA, DATA_RELATO, ID_VEICULO)
	values (11, 'Problema na bomba de combustível', '2021-10-04', 1234567890); 
insert into vicente_oficina_bd.relato_cliente(ID_RELATO, PROBLEMA, DATA_RELATO, ID_VEICULO)
	values (12, 'Motor fundido', '2021-09-25', 1234567891);
insert into vicente_oficina_bd.relato_cliente(ID_RELATO, PROBLEMA, DATA_RELATO, ID_VEICULO)
	values (13, 'Radiador superaquecendo', '2021-10-01', 1234567892);    
insert into vicente_oficina_bd.relato_cliente(ID_RELATO, PROBLEMA, DATA_RELATO, ID_VEICULO)
	values (14, 'Revisão de freios', '2021-10-04', 1234567893);   
insert into vicente_oficina_bd.relato_cliente(ID_RELATO, PROBLEMA, DATA_RELATO, ID_VEICULO)
	values (15, 'Troca dos Pneus', '2021-10-05', 1234567894);    
insert into vicente_oficina_bd.relato_cliente(ID_RELATO, PROBLEMA, DATA_RELATO, ID_VEICULO)
	values (16, 'Troca de óleo', '2021-10-07', 1234567895);    
insert into vicente_oficina_bd.relato_cliente(ID_RELATO, PROBLEMA, DATA_RELATO, ID_VEICULO)
	values (17, 'Farol queimado', '2021-10-04', 1234567896);    
insert into vicente_oficina_bd.relato_cliente(ID_RELATO, PROBLEMA, DATA_RELATO, ID_VEICULO)
	values (18, 'Manutenção do ar condicionado', '2021-10-04', 1234567897);

-- tabela de orcamento
insert into vicente_oficina_bd.orcamento(ID, ID_VEICULO, SITUACAO, VALOR, DATA_ORCAMENTO, PREVISAO_ENTREGRA, FORMA_PAGAMENTO)
	values (21, 1234567890, 'Finalizado', 100.00, '2021-10-04', '2021-10-09', 'Cartão de Crédito');
insert into vicente_oficina_bd.orcamento(ID, ID_VEICULO, SITUACAO, VALOR, DATA_ORCAMENTO, PREVISAO_ENTREGRA, FORMA_PAGAMENTO)
	values (22, 1234567891, 'Finalizado', 2800.00, '2021-09-15', '2021-10-10', 'Cartão de Crédito');
insert into vicente_oficina_bd.orcamento(ID, ID_VEICULO, SITUACAO, VALOR, DATA_ORCAMENTO, PREVISAO_ENTREGRA, FORMA_PAGAMENTO)
	values (23, 1234567892, 'Em andamento', 1200.00, '2021-10-01', '2021-10-20', 'Dinheiro');    
insert into vicente_oficina_bd.orcamento(ID, ID_VEICULO, SITUACAO, VALOR, DATA_ORCAMENTO, PREVISAO_ENTREGRA, FORMA_PAGAMENTO)
	values (24, 1234567893, 'Finalizado', 510.00, '2021-10-04', '2021-10-05', 'Cartão de Crédito');    
insert into vicente_oficina_bd.orcamento(ID, ID_VEICULO, SITUACAO, VALOR, DATA_ORCAMENTO, PREVISAO_ENTREGRA, FORMA_PAGAMENTO)
	values (25, 1234567894, 'Finalizado', 1750.00, '2021-10-05', '2021-10-06', 'Cartão de Crédito');   
insert into vicente_oficina_bd.orcamento(ID, ID_VEICULO, SITUACAO, VALOR, DATA_ORCAMENTO, PREVISAO_ENTREGRA, FORMA_PAGAMENTO)
	values (26, 1234567895, 'Finalizado', 160.00, '2021-10-07', '2021-10-08', 'Débito');    
insert into vicente_oficina_bd.orcamento(ID, ID_VEICULO, SITUACAO, VALOR, DATA_ORCAMENTO, PREVISAO_ENTREGRA, FORMA_PAGAMENTO)
	values (27, 1234567896, 'Finalizado', 100.00, '2021-10-04', '2021-10-04', 'Cartão de Crédito');    
insert into vicente_oficina_bd.orcamento(ID, ID_VEICULO, SITUACAO, VALOR, DATA_ORCAMENTO, PREVISAO_ENTREGRA, FORMA_PAGAMENTO)
	values (28, 1234567897, 'Em andamento', 350.00, '2021-10-04', '2021-10-04', 'Débito');


-- tabela de produto
insert into vicente_oficina_bd.produto(ID, DESCRICAO, CUSTO) values (1, 'Conjunto de Freios e Óleo', 410.00);
insert into vicente_oficina_bd.produto(ID, DESCRICAO, CUSTO) values (2, 'Radiador', 1000.00);
insert into vicente_oficina_bd.produto(ID, DESCRICAO, CUSTO) values (3, 'Óleo', 60.00);
insert into vicente_oficina_bd.produto(ID, DESCRICAO, CUSTO) values (4, 'Pneu', 400.00);
insert into vicente_oficina_bd.produto(ID, DESCRICAO, CUSTO) values (5, 'Filtro e Óleo de Ar Condicionado', 250.00);
insert into vicente_oficina_bd.produto(ID, DESCRICAO, CUSTO) values (6, 'Lampada', 50.00);
insert into vicente_oficina_bd.produto(ID, DESCRICAO, CUSTO) values (7, 'Motor', 2500.00);
insert into vicente_oficina_bd.produto(ID, DESCRICAO, CUSTO) values (8, 'Bomba Combustível', 50.00);

-- tabela de serviço
insert into vicente_oficina_bd.servico (ID, DESCRICAO, CUSTO, TEMPO_REALIZACAO)
	values(1, 'Pequenos reparos como troca de farol, bateria, reparo de pneu, bomba de combustível', 50.00, '1 dia');
insert into vicente_oficina_bd.servico (ID, DESCRICAO, CUSTO, TEMPO_REALIZACAO)
	values(2, 'Manutenção, Troca de Freio e Óleo', 100.00, '2 dias');    
insert into vicente_oficina_bd.servico (ID, DESCRICAO, CUSTO, TEMPO_REALIZACAO)
	values(3, 'Troca de Pneus, Alinhamento e Balanceamento', 150.00, '1 dia');
insert into vicente_oficina_bd.servico (ID, DESCRICAO, CUSTO, TEMPO_REALIZACAO)
	values(4, 'Manutenção de ar condicionado', 100.00, '1 dia');
insert into vicente_oficina_bd.servico (ID, DESCRICAO, CUSTO, TEMPO_REALIZACAO)
	values(5, 'Reparo de fuzilagem, pintura, peças', 200.00, '20 dias');
insert into vicente_oficina_bd.servico (ID, DESCRICAO, CUSTO, TEMPO_REALIZACAO)
	values(6, 'Reparo de motor e Elétrica', 300.00, '15 dias');
    
    
-- tabela item do produto
insert into vicente_oficina_bd.item_produto(SITUACAO, CUSTO, QUANTIDADE, ID_ORCAMENTO, ID_PRODUTO)
	values ('Em Estoque', 50.00, 1, 21, 8);
insert into vicente_oficina_bd.item_produto(SITUACAO, CUSTO, QUANTIDADE, ID_ORCAMENTO, ID_PRODUTO)
	values ('Em Estoque', 2500.00, 1, 22, 7);
insert into vicente_oficina_bd.item_produto(SITUACAO, CUSTO, QUANTIDADE, ID_ORCAMENTO, ID_PRODUTO)
	values ('Em Estoque', 1000.00, 1, 23, 2);
insert into vicente_oficina_bd.item_produto(SITUACAO, CUSTO, QUANTIDADE, ID_ORCAMENTO, ID_PRODUTO)
	values ('Em Estoque', 410.00, 1, 24, 1);
insert into vicente_oficina_bd.item_produto(SITUACAO, CUSTO, QUANTIDADE, ID_ORCAMENTO, ID_PRODUTO)
	values ('Em Estoque', 1600.00, 4, 25, 4);
insert into vicente_oficina_bd.item_produto(SITUACAO, CUSTO, QUANTIDADE, ID_ORCAMENTO, ID_PRODUTO)
	values ('Em Estoque', 60.00, 1, 26, 3);
insert into vicente_oficina_bd.item_produto(SITUACAO, CUSTO, QUANTIDADE, ID_ORCAMENTO, ID_PRODUTO)
	values ('Em Estoque', 50.00, 1, 27, 6);
insert into vicente_oficina_bd.item_produto(SITUACAO, CUSTO, QUANTIDADE, ID_ORCAMENTO, ID_PRODUTO)
	values ('Em Estoque', 250.00, 1, 28, 5);

-- tabela item do serviço
insert into vicente_oficina_bd.item_servico(SITUACAO, ID_ORCAMENTO, ID_SERVICO, CUSTO)
	values('Finalizado', 21, 1, 50.00);
insert into vicente_oficina_bd.item_servico(SITUACAO, ID_ORCAMENTO, ID_SERVICO, CUSTO)
	values('Finalizado', 22, 6, 300.00);
insert into vicente_oficina_bd.item_servico(SITUACAO, ID_ORCAMENTO, ID_SERVICO, CUSTO)
	values('Em Andamento', 23, 5, 200.00);
insert into vicente_oficina_bd.item_servico(SITUACAO, ID_ORCAMENTO, ID_SERVICO, CUSTO)
	values('Finalizado', 24, 2, 100.00);
insert into vicente_oficina_bd.item_servico(SITUACAO, ID_ORCAMENTO, ID_SERVICO, CUSTO)
	values('Finalizado', 25, 3, 150.00);
insert into vicente_oficina_bd.item_servico(SITUACAO, ID_ORCAMENTO, ID_SERVICO, CUSTO)
	values('Finalizado', 26, 2, 100.00);
insert into vicente_oficina_bd.item_servico(SITUACAO, ID_ORCAMENTO, ID_SERVICO, CUSTO)
	values('Finalizado', 27, 1, 50.00);
insert into vicente_oficina_bd.item_servico(SITUACAO, ID_ORCAMENTO, ID_SERVICO, CUSTO)
	values('Em Andamento', 28, 4, 100.00);

						-- DELETANDO DADOS DAS TABELAS
                        
delete from vicente_oficina_bd.item_servico;
delete from vicente_oficina_bd.item_produto;
delete from vicente_oficina_bd.servico;
delete from vicente_oficina_bd.produto;
delete from vicente_oficina_bd.orcamento;
delete from vicente_oficina_bd.relato_cliente;
delete from vicente_oficina_bd.veiculo;
delete from vicente_oficina_bd.cliente;