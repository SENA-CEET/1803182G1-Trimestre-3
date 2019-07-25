-- DDL(data definition lenguaje) estructura


create schema ddl;
use ddl;

create table if not exists cliente
(
    tipo_documento varchar(10),
    numero_documento varchar(40),
    primer_nombre varchar(40) not null,
    segundo_nombre varchar(40) null
);


create table if not exists tipo_documento
(
    sigla varchar(10) primary key,
    nombre varchar(30) unique

);

create table producto
(
    id int auto_increment,
    serial varchar(255) unique,
    nombre varchar(100),
    precio numeric(65, 2)

);

-- Creación de tablas con restricciones de integridad

-- not null, el null, default
create table if not exists cliente
(
    tipo_documento varchar(10),
    numero_documento varchar(40),
    primer_nombre varchar(40) not null,
    segundo_nombre varchar(40) null,
    sexo varchar(10) default 'hombre' -- default pone el valor cuando es null
);

-- unique
create table producto
(
    id INT PRIMARY KEY auto_increment,
    serial varchar(255) not null unique, -- generar un indice
    nombre varchar(100),
    precio numeric(65, 29)
);

create table producto
(
    id INT PRIMARY KEY auto_increment,
    serial varchar(255) not null, -- generar un indice
    nombre varchar(100),
    precio numeric(65, 29),
    unique (serial)
);

create table producto
(
    id INT PRIMARY KEY auto_increment,
    serial varchar(255) not null, -- generar un indice
    nombre varchar(100),
    precio numeric(65, 29),
    constraint seria_idx unique (serial)
);
drop table cliente;
create table if not exists cliente
(
    id int primary key auto_increment,
    tipo_documento varchar(10),
    numero_documento varchar(40),
    primer_nombre varchar(40) not null,
    segundo_nombre varchar(40) null,
    constraint clienet_uq unique (tipo_documento, numero_documento)
);


drop table producto;

-- primary key

-- compuestas


create table if not exists cliente
(
    tipo_documento varchar(10),
    numero_documento varchar(40),
    primer_nombre varchar(40) not null,
    segundo_nombre varchar(40) null,
	primary key (tipo_documento, numero_documento) -- pk compuesta
);


create table if not exists cliente
(
    tipo_documento varchar(10),
    numero_documento varchar(40),
    primer_nombre varchar(40) not null,
    segundo_nombre varchar(40) null,
	constraint llave_primaria primary key (tipo_documento, numero_documento) -- pk compuesta
);

-- llave primaria simple

create table producto
(
    id INT PRIMARY KEY auto_increment,
    serial varchar(255) not null, -- generar un indice
    nombre varchar(100),
    precio numeric(65, 29),
    constraint seria_idx unique (serial)
);

-- llave foranea

create table tipo_documento
(
    sigla varchar(10) primary key,
    nombre_documento varchar(40) not null ,
    estado boolean
);

create table cliente
(
    sigla varchar(10),
    numero_documento varchar(40),
    nombre varchar(100) not null,
    primary key (sigla, numero_documento),
    constraint fk_tipo_documento foreign key (sigla) references tipo_documento(sigla)

);
drop table cliente;

-- alter table sirve para cambiar la estructura de una tabla

alter table ddl.cliente add column (
    telefono varchar(15) not null
    );



-- ejemplo de create table
create table tipo_ambiente
(
    tipo varchar(50) primary key,
    descripcion varchar(100) not null,
    estado varchar(40) not null
);

create table sede(
    nombre_sede varchar(50) primary key ,
    direccion varchar(400) not null ,
    estado varchar(40) not null
);

create table ambiente
(
    numero_ambiente varchar(50),
    nombre_sede varchar(50),
    descripcion varchar(1000) not null ,
    estado varchar(40) not null ,
    limitacion varchar(40) not null ,
    tipo varchar(50) not null ,
    primary key (numero_ambiente, nombre_sede),
    constraint fk_tipo_ambi foreign key (tipo) references tipo_ambiente(tipo),
    constraint fk_sede foreign key (nombre_sede) references sede(nombre_sede)
);















