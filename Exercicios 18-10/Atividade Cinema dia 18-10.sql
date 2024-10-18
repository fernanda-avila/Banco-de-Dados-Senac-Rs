DROP SCHEMA IF EXISTS cinema;
CREATE SCHEMA IF NOT EXISTS cinema;
USE cinema;

DROP TABLE IF EXISTS pais;
CREATE TABLE IF NOT EXISTS pais (
  id INT(11) AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id));

DROP TABLE IF EXISTS ator;
CREATE TABLE IF NOT EXISTS ator (
  id INT(11) AUTO_INCREMENT,
  pais_id INT(11) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  data_nas DATE NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_ator_pais
    FOREIGN KEY (pais_id) REFERENCES pais (id) ON DELETE NO ACTION ON UPDATE NO ACTION);

DROP TABLE IF EXISTS uf ;
CREATE TABLE IF NOT EXISTS uf (
  id INT AUTO_INCREMENT,
  pais_id INT(11) NOT NULL,
  sigla CHAR(2) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_uf_pais
    FOREIGN KEY (pais_id) REFERENCES pais (id) ON DELETE NO ACTION ON UPDATE NO ACTION);

DROP TABLE IF EXISTS cidade ;
CREATE TABLE IF NOT EXISTS cidade (
  id INT AUTO_INCREMENT,
  uf_id INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_cidade_uf
    FOREIGN KEY (uf_id) REFERENCES uf (id) ON DELETE NO ACTION ON UPDATE NO ACTION);

DROP TABLE IF EXISTS cinema ;
CREATE TABLE IF NOT EXISTS cinema (
  id INT(11) AUTO_INCREMENT,
  cidade_id INT NOT NULL,
  nomeFantasia VARCHAR(45) NOT NULL,
  endereco VARCHAR(45),
  bairro VARCHAR(45),
  PRIMARY KEY (id),
  CONSTRAINT fk_cinema_cidade
    FOREIGN KEY (cidade_id) REFERENCES cidade (id) ON DELETE NO ACTION ON UPDATE NO ACTION);

DROP TABLE IF EXISTS filme;
CREATE TABLE IF NOT EXISTS filme (
  id INT(11) AUTO_INCREMENT,
  pais_id INT(11) NOT NULL,
  diretor_id INT(11) NOT NULL,
  tituloOriginal VARCHAR(45) NOT NULL,
  tituloPortugues VARCHAR(45) NULL DEFAULT NULL,
  duracao INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_filme_ator
    FOREIGN KEY (diretor_id) REFERENCES ator (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_filme_pais
    FOREIGN KEY (pais_id) REFERENCES pais (id) ON DELETE NO ACTION ON UPDATE NO ACTION);

DROP TABLE IF EXISTS elenco ;
CREATE TABLE IF NOT EXISTS elenco (
  ator_id INT(11),
  filme_id INT(11),
  PRIMARY KEY (ator_id, filme_id),
  CONSTRAINT fk_elenco_ator
    FOREIGN KEY (ator_id) REFERENCES ator (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_elenco_filme
    FOREIGN KEY (filme_id) REFERENCES filme (id) ON DELETE NO ACTION ON UPDATE NO ACTION);

DROP TABLE IF EXISTS genero ;
CREATE TABLE IF NOT EXISTS genero (
  id INT(11) AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id));

DROP TABLE IF EXISTS sala ;
CREATE TABLE IF NOT EXISTS sala (
  id INT(11) AUTO_INCREMENT,
  cinema_id INT(11) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  capacidade INT(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_sala_cinema
    FOREIGN KEY (cinema_id) REFERENCES cinema (id) ON DELETE NO ACTION ON UPDATE NO ACTION);

DROP TABLE IF EXISTS sessao ;
CREATE TABLE IF NOT EXISTS sessao (
  id INT(11) AUTO_INCREMENT,
  sala_id INT(11) NOT NULL,
  filme_id INT(11) NOT NULL,
  data DATE NOT NULL,
  horaInicio TIME NOT NULL,
  publico INT(11),
  PRIMARY KEY (id),
  CONSTRAINT fk_sessao_filme
    FOREIGN KEY (filme_id) REFERENCES filme (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_sessao_sala
    FOREIGN KEY (sala_id) REFERENCES sala (id) ON DELETE NO ACTION ON UPDATE NO ACTION);

DROP TABLE IF EXISTS genero_filme ;
CREATE TABLE IF NOT EXISTS genero_filme (
  genero_id INT(11),
  filme_id INT(11),
  PRIMARY KEY (genero_id, filme_id),
  CONSTRAINT fk_genero_filme_genero
    FOREIGN KEY (genero_id) REFERENCES genero (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_genero_filme_filme
    FOREIGN KEY (filme_id) REFERENCES filme (id) ON DELETE NO ACTION ON UPDATE NO ACTION);

-- Países
INSERT INTO pais (nome) VALUES ('Brasil');
INSERT INTO pais (nome) VALUES ('Estados Unidos');
INSERT INTO pais (nome) VALUES ('Inglaterra');
INSERT INTO pais (nome) VALUES ('França');


-- Estados (UFs)
INSERT INTO uf (pais_id, sigla) VALUES (1, 'RS');
INSERT INTO uf (pais_id, sigla) VALUES (1, 'MG');
INSERT INTO uf (pais_id, sigla) VALUES (1, 'SP');
INSERT INTO uf (pais_id, sigla) VALUES (1, 'RJ');

-- Cidades
INSERT INTO cidade (uf_id, nome) VALUES (1, 'Porto Alegre');
INSERT INTO cidade (uf_id, nome) VALUES (1, 'Pelotas');
INSERT INTO cidade (uf_id, nome) VALUES (1, 'Santa Vitória do Palmar');
INSERT INTO cidade (uf_id, nome) VALUES (1, 'Arroio Grande');
INSERT INTO cidade (uf_id, nome) VALUES (2, 'São Paulo');
INSERT INTO cidade (uf_id, nome) VALUES (1, 'Baurú');

-- ators (Atores)
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Michael Douglas', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Angelina Jolie', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Tom Cruise', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Leonardo Dicaprio', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Adam Sandler', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Ben Stiller', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Will Smith', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Jannifer Aniston', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Meryl Streep', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Charlize Theron', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Kristen Stewart', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Denzel Washington', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Keira Knightley', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Jude Law', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('John Hawkes', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Helen Hunt', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Jamie Foxx', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Joaquim Phoenix', 3, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Edecio Iepsen', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Jessica Chastain', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Jason Clarke', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Jean-Louis Trintignant', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Emmanuelle Riva', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Kristen Connolly', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Chris Hemsworth', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Angelo Luz', 2, '1957-02-08');
  
-- Diretores (Diretores)
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Martin Scorsese', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Quentin Tarantino', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Roman Polanski', 1, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Steven Spilberg', 1, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Robert Zemeckis', 1, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Joe Wright', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Ben Lewin', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Paul Thomas Anderson', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('William Friedkin', 2, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Kathryn Bigelow', 1, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Michael Haneke', 3, '1957-02-08');
INSERT INTO ator (nome, pais_id, data_nas) VALUES ('Drew Goddard', 2, '1957-02-08');
  
-- Gêneros
INSERT INTO genero (nome) VALUES ('Comédia');
INSERT INTO genero (nome) VALUES ('Ficção');
INSERT INTO genero (nome) VALUES ('Drama');
INSERT INTO genero (nome) VALUES ('Ação');
INSERT INTO genero (nome) VALUES ('Suspense');
INSERT INTO genero (nome) VALUES ('Terror');
INSERT INTO genero (nome) VALUES ('Faroeste');
INSERT INTO genero (nome) VALUES ('Aventura');

-- Filmes
INSERT INTO filme (tituloOriginal, tituloPortugues, duracao, diretor_id, pais_id) VALUES ('Flight','O Voo',138,3,1);
INSERT INTO filme (tituloOriginal, tituloPortugues, duracao, diretor_id, pais_id) VALUES ('Anna Karenina','Anna Karenina',131,3,3);
INSERT INTO filme (tituloOriginal, tituloPortugues, duracao, diretor_id, pais_id) VALUES ('The Sessions','As Sessões',98,1,2);
INSERT INTO filme (tituloOriginal, tituloPortugues, duracao, diretor_id, pais_id) VALUES ('Django Unchained','Django Livre',164,7,2);
INSERT INTO filme (tituloOriginal, tituloPortugues, duracao, diretor_id, pais_id) VALUES ('The Master','O Mestre',144,3,2);
INSERT INTO filme (tituloOriginal, tituloPortugues, duracao, diretor_id, pais_id) VALUES ('Killer Joe','Killer Joe - Matador de Aluguel',102,4,2);
INSERT INTO filme (tituloOriginal, tituloPortugues, duracao, diretor_id, pais_id) VALUES ('Zero Dark Thirty','A Hora Mais Escura',157,5,2);
INSERT INTO filme (tituloOriginal, tituloPortugues, duracao, diretor_id, pais_id) VALUES ('Amour','Amor',127,3,4);
INSERT INTO filme (tituloOriginal, tituloPortugues, duracao, diretor_id, pais_id) VALUES ('The Cabin in The Woods','O Segredo da Cabana',105,6,2);
INSERT INTO filme (tituloOriginal, tituloPortugues, duracao, diretor_id, pais_id) VALUES ('La Murga Louca','A Murga Louca',30,26,4);

-- Gênero_Filme
INSERT INTO genero_filme (genero_id, filme_id) VALUES (3,1);
INSERT INTO genero_filme (genero_id, filme_id) VALUES (3,2);
INSERT INTO genero_filme (genero_id, filme_id) VALUES (3,3);
INSERT INTO genero_filme (genero_id, filme_id) VALUES (3,4);
INSERT INTO genero_filme (genero_id, filme_id) VALUES (2,5);
INSERT INTO genero_filme (genero_id, filme_id) VALUES (3,6);
INSERT INTO genero_filme (genero_id, filme_id) VALUES (3,7);
INSERT INTO genero_filme (genero_id, filme_id) VALUES (3,8);
INSERT INTO genero_filme (genero_id, filme_id) VALUES (3,9);
INSERT INTO genero_filme (genero_id, filme_id) VALUES (1,10);
-- Elenco
INSERT INTO elenco (filme_id, ator_id) VALUES (1,12);
INSERT INTO elenco (filme_id, ator_id) VALUES (1,26);
INSERT INTO elenco (filme_id, ator_id) VALUES (2,13);
INSERT INTO elenco (filme_id, ator_id) VALUES (2,14);
INSERT INTO elenco (filme_id, ator_id) VALUES (3,15);
INSERT INTO elenco (filme_id, ator_id) VALUES (3,16);
INSERT INTO elenco (filme_id, ator_id) VALUES (4,4);
INSERT INTO elenco (filme_id, ator_id) VALUES (4,17);
INSERT INTO elenco (filme_id, ator_id) VALUES (5,18);
INSERT INTO elenco (filme_id, ator_id) VALUES (6,19);
INSERT INTO elenco (filme_id, ator_id) VALUES (7,20);
INSERT INTO elenco (filme_id, ator_id) VALUES (7,21);
INSERT INTO elenco (filme_id, ator_id) VALUES (8,22);
INSERT INTO elenco (filme_id, ator_id) VALUES (8,23);
INSERT INTO elenco (filme_id, ator_id) VALUES (9,24);
INSERT INTO elenco (filme_id, ator_id) VALUES (9,25);

-- Cinemas
INSERT INTO cinema (nomeFantasia, endereco, bairro, cidade_id) VALUES ('Cine Art Pelotas', 'Rua Andrade Neves, 1510','Centro',2);
INSERT INTO cinema (nomeFantasia, endereco, bairro, cidade_id) VALUES ('CineFlix Pelotas', 'Shopping Pelotas, 9999','Areal',2);
INSERT INTO cinema (nomeFantasia, endereco, bairro, cidade_id) VALUES ('Cine Art Rio Grande', 'Av Oswaldo Barros, 251','Centro',3);
INSERT INTO cinema (nomeFantasia, endereco, bairro, cidade_id) VALUES ('Cine Art POA', 'Av das Nações, 665','Centro',1);

-- Salas
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (1, 'A', 500);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (4, 'B', 200);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (3, 'C', 200);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (1, 'X', 100);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (2, 'Z', 500);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (2, 'W', 400);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (2, 'C', 500);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (3, 'A', 500);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (1, 'F', 500);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (3, 'H', 500);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (4, 'Z', 100);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (2, 'A', 100);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (2, 'B', 100);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (3, 'X', 100);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (1, 'H', 100);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (4, 'F', 500);
INSERT INTO sala (cinema_id, nome, capacidade) VALUES (1, 'Z', 100);

-- Sessões
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (10,5,'2024-04-16','18:50:00',314);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (10,4,'2024-04-16','21:40:00',412);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (11,2,'2024-04-17','16:00:00',64);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (11,2,'2024-04-17','19:00:00',98);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (11,9,'2024-04-17','21:30:00',114);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (12,1,'2024-04-17','16:00:00',57);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (12,1,'2024-04-17','19:00:00',78);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (12,8,'2024-04-17','21:30:00',134);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (13,6,'2024-04-17','16:00:00',48);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (13,6,'2024-04-17','19:00:00',75);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (14,5,'2024-04-17','21:30:00',154);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (15,4,'2024-04-17','14:30:00',245);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (15,7,'2024-04-17','18:00:00',158);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (16,3,'2024-04-17','21:15:00',262);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (16,1,'2024-04-17','16:00:00',105);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (17,1,'2024-04-17','20:00:00',214);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (17,6,'2024-04-17','15:00:00',289);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (6,2,'2024-04-17','19:40:00',425);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (1,9,'2024-04-17','21:45:00',502);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (5,3,'2024-04-17','14:40:00',108);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (7,5,'2024-04-17','18:50:00',372);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (7,4,'2024-04-17','21:40:00',489);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (1,2,'2024-04-18','16:00:00',95);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (1,2,'2024-04-18','19:00:00',124);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (1,9,'2024-04-18','21:30:00',158);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (2,1,'2024-04-18','16:00:00',46);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (2,1,'2024-04-18','19:00:00',97);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (2,8,'2024-04-18','21:30:00',187);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (3,6,'2024-04-18','16:00:00',87);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (3,6,'2024-04-18','19:00:00',105);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (17,5,'2024-04-18','21:30:00',154);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (16,4,'2024-04-18','14:30:00',144);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (15,7,'2024-04-18','18:00:00',198);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (14,3,'2024-04-18','21:15:00',265);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (13,1,'2024-04-18','16:00:00',97);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (12,1,'2024-04-18','20:00:00',248);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (11,6,'2024-04-18','15:00:00',314);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (10,2,'2024-04-18','19:40:00',499);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (9,9,'2024-04-18','21:45:00',587);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (8,3,'2024-04-18','14:40:00',255);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (7,5,'2024-04-18','18:50:00',445);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (6,4,'2024-04-18','21:40:00',455);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (5,2,'2024-04-16','16:00:00',55);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (4,2,'2024-04-16','19:00:00',108);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (3,9,'2024-04-16','21:30:00',187);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (2,1,'2024-04-16','16:00:00',67);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (1,1,'2024-04-16','19:00:00',89);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (1,8,'2024-04-16','21:30:00',144);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (2,6,'2024-04-16','16:00:00',75);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (3,6,'2024-04-16','19:00:00',101);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (4,5,'2024-04-16','21:30:00',140);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (5,4,'2024-04-16','14:30:00',178);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (6,7,'2024-04-16','18:00:00',149);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (7,3,'2024-04-16','21:15:00',278);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (8,1,'2024-04-16','16:00:00',115);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (9,1,'2024-04-16','20:00:00',268);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (10,6,'2024-04-16','15:00:00',387);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (11,2,'2024-04-16','19:40:00',455);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (12,9,'2024-04-16','21:45:00',608);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (13,3,'2024-04-16','14:40:00',115);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (14,5,'2024-04-16','18:50:00',402);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (17,4,'2024-04-16','21:40:00',389);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (8,2,'2024-05-10','19:40:00',489);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (9,9,'2024-05-10','21:45:00',548);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (9,3,'2024-05-10','14:40:00',142);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (7,1,'2024-05-11','16:00:00',145);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (7,1,'2024-05-11','20:00:00',249);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (8,6,'2024-05-11','15:00:00',314);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (1,2,'2024-05-12','16:00:00',45);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (1,2,'2024-05-12','19:00:00',80);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (2,9,'2024-05-12','21:30:00',95);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (2,1,'2024-05-12','16:00:00',38);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (3,1,'2024-05-12','19:00:00',55);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (3,8,'2024-05-12','21:30:00',110);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (4,6,'2024-05-12','16:00:00',60);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (4,6,'2024-05-12','19:00:00',75);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (5,5,'2024-05-12','21:30:00',148);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (5,4,'2024-05-12','14:30:00',227);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (6,7,'2024-05-12','18:00:00',185);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (6,3,'2024-05-12','21:15:00',247);


INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (9,3,'2024-05-13','14:40:00',NULL);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (7,1,'2024-05-14','16:00:00',NULL);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (7,1,'2024-05-15','20:00:00',NULL);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (8,6,'2024-05-16','15:00:00',NULL);
INSERT INTO sessao (sala_id, filme_id, data, horaInicio, publico) VALUES (1,2,'2024-05-17','16:00:00',NULL);

SHOW TABLES;

SELECT * FROM pais;
SELECT * FROM uf;
SELECT * FROM cidade;
SELECT * FROM ator;
SELECT * FROM cinema;
SELECT * FROM filme;

-- Faça as seguintes consultas:

-- 1. Apuração do público por município
SELECT nomeFantasia 
FROM cinema 
JOIN cidade ON cinema.cidade_id = cidade.id
WHERE cidade.nome = 'Pelotas';



-- 2. Apuração do público por cinema
SELECT ci.nomeFantasia AS cinema, SUM(s.publico) AS total_publico
FROM sessao s
JOIN sala sa ON s.sala_id = sa.id
JOIN cinema ci ON sa.cinema_id = ci.id
GROUP BY ci.nomeFantasia
ORDER BY total_publico DESC;


-- 3. Apuração do público por sessão de cada cinema;
SELECT ci.nomeFantasia AS cinema, s.id AS sessao_id, s.data, s.horaInicio, s.publico
FROM sessao s
JOIN sala sa ON s.sala_id = sa.id
JOIN cinema ci ON sa.cinema_id = ci.id
ORDER BY ci.nomeFantasia, s.data, s.horaInicio;


-- 4. Permitir uma forma de consulta, que dado um determinado ator, sejam localizados todos os cinemas onde estão (ou estiveram) 
-- em cartaz os filmes em que este ator atua;
SELECT DISTINCT ci.nomeFantasia AS cinema
FROM cinema ci
JOIN sala sa ON ci.id = sa.cinema_id
JOIN sessao se ON sa.id = se.sala_id
JOIN filme f ON se.filme_id = f.id
JOIN elenco e ON f.id = e.filme_id
JOIN ator a ON e.ator_id = a.id
WHERE a.nome = 'Keira Knightley';





-- 5. Em quais cinemas está sendo exibido um determinado gênero de filme;
SELECT DISTINCT ci.nomeFantasia AS cinema
FROM cinema ci
JOIN sala sa ON ci.id = sa.cinema_id
JOIN sessao se ON sa.id = se.sala_id
JOIN filme f ON se.filme_id = f.id
JOIN genero_filme gf ON f.id = gf.filme_id
JOIN genero g ON gf.genero_id = g.id
WHERE g.nome = 'Ficção';






-- 6. Em quais cinemas estão sendo exibidos filmes nacionais;
SELECT DISTINCT ci.nomeFantasia AS cinema
FROM cinema ci
JOIN sala sa ON ci.id = sa.cinema_id
JOIN sessao se ON sa.id = se.sala_id
JOIN filme f ON se.filme_id = f.id
JOIN pais p ON f.pais_id = p.id
WHERE p.nome = 'Brasil';

