create database investigadores_equipos;
use investigadores_equipos;

DROP table IF EXISTS facultades;
DROP table IF EXISTS investigadores;
DROP table IF EXISTS equipos;
DROP table IF EXISTS reserva;

create table facultades(
	codigo INT AUTO_INCREMENT,
	nombre varchar(250),
    PRIMARY KEY(codigo)
);

insert into facultades (nombre)values('Miguel de Cervantes');
insert into facultades (nombre)values('Lazaro de Tormes');
insert into facultades (nombre)values('Hamlet');
insert into facultades (nombre)values('Lope de vega');
insert into facultades (nombre)values('Shakesphere');

CREATE TABLE investigadores(
	dni varchar(8),
	nom_apels varchar(250),
    cod_facultad INT,
    FOREIGN KEY (cod_facultad) REFERENCES facultades(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(dni)
);

insert into investigadores (dni, nom_apels,cod_facultad)values('qwertyui', 'Juan Lopez',1);
insert into investigadores (dni, nom_apels,cod_facultad)values('asdfghjk', 'Aitor Menta',2);
insert into investigadores (dni, nom_apels,cod_facultad)values('zxcvbnml', 'Elena Morada',3);
insert into investigadores (dni, nom_apels,cod_facultad)values('jhfkasdf', 'Javier Gonzalez',4);
insert into investigadores (dni ,nom_apels,cod_facultad)values('uyroqwer', 'Leo Perez',5);

CREATE TABLE equipos(
	num_serie varchar(4),
	nombre varchar(250),
    cod_facultad INT,
    FOREIGN KEY (cod_facultad) REFERENCES facultades(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(num_serie)
);

insert into equipos (num_serie, nombre, cod_facultad)values('asdf','Equipo de Literatura',1);
insert into equipos (num_serie, nombre, cod_facultad)values('qwer','Equipo de Linguistica',2);
insert into equipos (num_serie, nombre, cod_facultad)values('zxcv','Equipo de Lengua',3);
insert into equipos (num_serie, nombre, cod_facultad)values('mnbv','Equipo de Teatro',4);
insert into equipos (num_serie, nombre, cod_facultad)values('poiu','Equipo de Latin',5);

CREATE TABLE reservas(
    id INT AUTO_INCREMENT,
    dni_investigador varchar(8),
    num_equipo varchar(4),
    comienzo date DEFAULT NULL,
    fin date DEFAULT NULL,
    FOREIGN KEY (dni_investigador) REFERENCES investigadores(dni) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (num_equipo) REFERENCES equipos(num_serie) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (id)
);

INSERT INTO reservas (dni_investigador, num_equipo, comienzo, fin) VALUES ('qwertyui','asdf','2023-11-13','2023-12-13');
INSERT INTO reservas (dni_investigador, num_equipo, comienzo, fin) VALUES ('asdfghjk','qwer','2023-11-13','2023-12-13');
INSERT INTO reservas (dni_investigador, num_equipo, comienzo, fin) VALUES ('zxcvbnml','zxcv','2023-11-13','2023-12-13');
INSERT INTO reservas (dni_investigador, num_equipo, comienzo, fin) VALUES ('jhfkasdf','mnbv','2023-11-13','2023-12-13');
INSERT INTO reservas (dni_investigador, num_equipo, comienzo, fin) VALUES ('uyroqwer','poiu','2023-11-13','2023-12-13');