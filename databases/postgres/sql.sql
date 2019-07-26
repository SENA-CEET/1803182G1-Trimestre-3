create database sena;

drop database sena;

create schema proyecto;

drop schema  proyecto;

create table proyecto.nivel_formacion
(
    nivel varchar(40) ,
    estado varchar(40) not null,
    constraint nivel_formacion_pk primary key (nivel),
);



create table proyecto.programa
(
  codigo varchar(50),
  version varchar(40),
  nombre varchar(500) not null,
  sigla varchar(40) not null,
  estado varchar(40) not null,
  nivel varchar(40) not null,
  constraint programa_pk primary key (codigo, version),
  constraint nive_forma_fk foreign key(nivel) references nivel_formacion(nivel)
    on update CASCADE on delete NO ACTION
);

create table competencia(
  codigo_competencia varchar(50),
  denominacion varchar(1000) not null,
  codigo_programa varchar(50),
  version_programa varchar(40),
  constraint competencia_pk primary key (codigo_competencia, codigo_programa, version_programa),
  constraint programa_fk foreign key (codigo_programa, version_programa) references programa(codigo, version)
);

