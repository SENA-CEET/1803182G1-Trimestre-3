-- tipos de datos

-- ---------------------------------------------- NUMERICOS

create schema ejemplo;
use ejemplo;

-- bit
create table t1
(
    llave  int primary key,
    campo1 bit
);

drop schema ejemplo;

create schema ejemplo;
use ejemplo;
-- tinyint 1 byte
create table t1
(
    llave  int primary key,
    campo1 tinyint,
    campo2 tinyint unsigned,
    campo3 tinyint unsigned zerofill, -- 255  001
    campo4 tinyint(1)
);

drop schema ejemplo;

create schema ejemplo;
use ejemplo;
-- tinyint 1 byte
create table tboolean
(
    llave  int primary key,
    campo1 bool,
    campo2 boolean
);

drop schema ejemplo;


drop schema ejemplo;

create schema ejemplo;
use ejemplo;
-- smallint 2 byte
create table tsmallint
(
    llave  int primary key,
    campo1 smallint,
    campo2 smallint(3),
    campo3 smallint unsigned zerofill
);

drop schema ejemplo;

create schema ejemplo;
use ejemplo;
-- mediumint 3 byte
create table tmediumint
(
    llave  int primary key,
    campo1 mediumint,
    campo2 mediumint(3),
    campo3 mediumint unsigned zerofill
);

drop schema ejemplo;

create schema ejemplo;
use ejemplo;
-- int 4 byte
create table tint
(
    llave  int primary key,
    campo1 int,
    campo2 int(3),
    campo3 int unsigned zerofill
);

drop schema ejemplo;

create schema ejemplo;
use ejemplo;
-- INTEGER 4 byte
create table tinteger
(
    llave  int primary key,
    campo1 INTEGER,
    campo2 INTEGER(3),
    campo3 INTEGER unsigned zerofill
);

drop schema ejemplo;


create schema ejemplo;
use ejemplo;
-- BIGINT 8 byte
create table tbigint
(
    llave  int primary key,
    campo1 BIGINT,
    campo2 BIGINT(3),
    campo3 BIGINT unsigned zerofill
);

drop schema ejemplo;


create schema ejemplo;
use ejemplo;
--  decimal      byte
create table tdecimal
(
    llave  int primary key,
    campo1 decimal,
    campo2 decimal(65, 7), -- 19+2 bytes maximo es 65
    campo3 decimal unsigned zerofill
);

drop schema ejemplo;

create schema ejemplo;
use ejemplo;
--  decimal      byte
create table tnumeric
(
    llave  int primary key,
    campo1 numeric,
    campo2 numeric(65, 5), -- 19+2 bytes maximo es 65
    campo3 numeric unsigned zerofill
);

drop schema ejemplo;

create schema ejemplo;
use ejemplo;
--  dec
create table tdec
(
    llave  int primary key,
    campo1 dec,
    campo2 dec(65, 5),
    campo3 dec unsigned zerofill
);

drop schema ejemplo;


create schema ejemplo;
use ejemplo;
--  float
create table tfloat
(
    llave  int primary key,
    campo1 float,
    campo2 float(23),               -- precisión simple 0 a 24 donde pesa 4 bytes
    campo3 float(34),               -- precisión double 25 a 53 donde pesa 8 bytes
    campo4 float unsigned zerofill, --
    campo5 float(29, 5),            -- 8 bytes precisión
    campo6 float(30, 6) unsigned zerofill
);

create schema ejemplo;
use ejemplo;
--  double
create table tfdouble
(
    llave  int primary key,
    campo1 double,
    campo2 double(23, 3),
    campo3 double unsigned zerofill,
    campo4 double precision,
    campo5 double precision(20, 7),
    campo6 double precision(20, 7) unsigned zerofill
);

create schema ejemplo;
use ejemplo;
--  double
create table treal
(
    llave  int primary key,
    campo1 real,
    campo2 real(23, 3),
    campo3 real unsigned zerofill
);

drop schema ejemplo;


-- ---------------------------------------------- TEMPORALES

CREATE TABLE tdate
(
    campo1 int primary key,
    campo2 date
);

CREATE TABLE tdatetime
(
    campo1 int primary key,
    campo2 datetime
);

CREATE TABLE ttimestamp
(
    campo1 int primary key,
    campo2 timestamp
);

CREATE TABLE ttime
(
    campo1 int primary key,
    campo2 time,
    campo3 year
);

-- ----------------------------------------------Los tipos caracteres

create table cadenas(
    campo1 int primary key,
    campo2 char, -- 1 byte
    campo3 char(10), -- 10 bytes
    campo4 char binary,

    campo5 varchar(10),
    campo6 varchar(10) binary,

    campo7 tinyblob, -- este sirve para guardar imagenes o archivos muy pequeños

    campo8 tinytext -- almacena hasta 25 caracteres

);

create table cadenaslargas(
    campo1 int primary key,
    campo2 blob, -- archivos
    campo3 text, -- text
    campo4 mediumblob, -- archivos
    campo5 MEDIUMTEXT, -- texto
    campo6 varchar(10) binary,

    campo7 longblob, -- archivos

    campo8 longtext,-- texto
    campo9 enum('masculino', 'femenino'),
    campo10 set('1','2','3','4')
);
















