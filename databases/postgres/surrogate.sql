create database sena2;

create schema proyecto;

set search_path = "proyecto"; -- use proyecto en mysql

create table proyecto.nivel_formacion
(
    id serial,
    nivel varchar(40) not null ,
    estado varchar(40) not null,
    constraint nivel_formacion_pk primary key (id),
    constraint estado_uk unique (nivel)
);

create table proyecto.programa
(
  id serial,
  codigo varchar(50) not null,
  version varchar(40) not null,
  nombre varchar(500) not null,
  sigla varchar(40) not null,
  estado varchar(40) not null,
  id_nivel_formacion serial not null,
  constraint programa_pk primary key (id),
  constraint nive_forma_fk foreign key(id_nivel_formacion) references nivel_formacion(id)
    on update CASCADE on delete NO ACTION
);

CREATE INDEX programa_uk
    ON proyecto.programa
    (codigo , version )
    ;


create table competencia(
    id serial,
    id_programa serial not null,
    codigo_competencia varchar(50) not null,
    denoinacion varchar(1000) NOT NULL,
    constraint competencia_pk primary key (id),
    constraint programa_fk foreign key (id_programa) references programa(id)
                        on update RESTRICT on delete restrict

);

CREATE INDEX comprencia_uk
    ON proyecto.competencia
    (id_programa , codigo_competencia )
    ;