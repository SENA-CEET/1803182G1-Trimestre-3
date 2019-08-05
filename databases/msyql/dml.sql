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







