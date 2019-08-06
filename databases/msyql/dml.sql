-- DML(data manipulation lenguaje)

-- INSERT
use observador_de_proyectos;

insert into tipo_documento (documento, descripcion, estado)
    value ('pasaporte', 'numero de pasaporte', true);

insert into tipo_documento
    value ( 'pasaporte', 'numero de pasaporte', true); -- ojo este se debe tener en cuenta el orden de las columnas

insert into ceet_natural.tipo_documento(sigla, nombre_documento, estado)
value ('CC', 'Cédula de ciudadanía','Activo');

insert into ceet_natural.user(login, password, email, activated, lang_key)
value ('kikke','asdfasdfasdf','hemoreno33@misena.edu.co',true,'es');

insert into ceet_natural.cliente(numero_documento, sigla, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, id_user, login)
VALUE ('80013833', 'CC','hernando','enrique','moreno',null,1,'kikke');

-- segunda forma de inserta con una subconsulta

insert into ceet_surrogate.tipo_documento(sigla, nombre_documento, estado)
value ('CC', 'Cédula de ciudadanía','Activo');

insert into ceet_surrogate.user(login, password, email, activated, lang_key)
value ('kikke','asdfasdfasdf','hemoreno33@misena.edu.co',true,'es');

insert into ceet_surrogate.cliente(id_tipo_documento, numero_documento, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, id_user)
VALUE ((select id from ceet_surrogate.tipo_documento where sigla='CC'),'80013833','hernando','enrique','moreno','moreno',(select id from ceet_surrogate.user
where login='kikke'));

-- tercera forma de insertar

insert into ceet_natural.tipo_documento
    set sigla='TI',
        estado= true,
        nombre_documento='targeta de identidad';


-- select

select * from ceet_surrogate.user;
select id from ceet_surrogate.user
where login='kikke'
;
select id from ceet_surrogate.tipo_documento where sigla='CC';

-- replace
replace into ceet_natural.tipo_documento(sigla, nombre_documento, estado) VALUE ('CC','Cedula colombiana','activo');

-- update
update ceet_natural.cliente
    set primer_nombre ='jose'
where sigla='CC' and numero_documento='80013833'; -- siempre poner la llave primaria


-- delete
DELETE FROM ceet_surrogate.cliente WHERE (id_tipo_documento=(select id from ceet_surrogate.tipo_documento where sigla='CC') and numero_documento='80013833');
delete from ceet_surrogate.user where (id='2');
delete from ceet_surrogate.tipo_documento where (id=2);

delete from ceet_natural.cliente;


-- truncate
truncate table ceet_surrogate.tipo_documento;
truncate table ceet_surrogate.user;
truncate table ceet_surrogate.cliente;


insert into ceet_surrogate.tipo_documento(sigla, nombre_documento, estado) VALUE ('RT','rastro','Activo');

-- select
select * from observador_de_proyectos.cliente;
select tipo_documento,numero_documento from observador_de_proyectos.cliente;

select null;
select 1+2;
select 'hola';
select now();

SELECT * FROM observador_de_proyectos.ficha
where numero_ficha!='1803182G2'; -- en el where se puede usar los operadores relacionales > < = != >= <=
select * from observador_de_proyectos.cliente
where primer_nombre='hernando';
select count(*) from observador_de_proyectos.cliente_has_rol
where fecha_terminacion>'2019-08-06'
;

select * from observador_de_proyectos.cliente where segundo_apellido is null;
select * from observador_de_proyectos.cliente where segundo_apellido is not null;


-- between

select count(*) from observador_de_proyectos.cliente_has_rol
where   fecha_terminacion>='2019-01-01' and fecha_terminacion<='2019-12-31'
;
select count(*) from observador_de_proyectos.cliente_has_rol
where fecha_terminacion between  '2019-01-01' and '2019-12-31'
;

-- like

select * from observador_de_proyectos.cliente where primer_nombre like '%z%';

select * from observador_de_proyectos.cliente where primer_nombre like '___W%';

-- in
select * from observador_de_proyectos.cliente_has_rol where rol = 'Líder de área' or rol = 'Instructor' or rol= 'Aprendiz';

select *
from observador_de_proyectos.cliente_has_rol where rol in ('Líder de área', 'Insructor', 'aprendiz');

-- when
select tipo_documento,numero_documento, case rol when 'Aprendiz' then 'estudiante' else 'profesor'  end from observador_de_proyectos.cliente_has_rol
;

-- is
select numero_documento, tipo_documento >= 'TI' is true as 'menor de edad' from observador_de_proyectos.cliente
where numero_documento='1001174847'
;

-- binary
select * from observador_de_proyectos.cliente where binary (primer_nombre) Like 'JOHN';

-- regex
select * from observador_de_proyectos.usuario where !(correo regexp '^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$') ;

--

create table ddl.ejemplo(
    id int primary key auto_increment,
    campo1 int,
    campo2 float,
    campo3 varchar(100)
);













