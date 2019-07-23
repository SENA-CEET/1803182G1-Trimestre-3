#DCL(data control lenguaje)

# muestra los motores de bases de datos que soporta el mysql
show engines; 

#crear una base de datos
create database ejemplo2;

#borrar base de datos
drop database ejemplo;

#crear un esquema
create schema ejemplo3;

#borrar un esquema
drop schema ejemplo3;

# modificar un schema
ALTER SCHEMA `ejemplo3`  DEFAULT CHARACTER SET euckr  DEFAULT COLLATE euckr_korean_ci ;
ALTER SCHEMA `ejemplo3`  DEFAULT CHARACTER SET euckr;
ALTER SCHEMA `ejemplo3`  DEFAULT COLLATE euckr_bin ;

ALTER SCHEMA `ejemplo3`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_spanish_ci ;



#charsets
SHOW CHARACTER SET;
SHOW CHARACTER SET LIKE 'utf%';

#collations
SHOW COLLATION;
SHOW COLLATION WHERE Charset = 'utf8';





# comando use sirve moverme entre esquemas o bases de datos
use ejemplo;

# mostras las tablas de un esquema
show tables;


