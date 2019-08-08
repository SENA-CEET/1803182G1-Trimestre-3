-- alias

-- alias para columna
select tipo_documento as 'TIPO DE DOCUMENTO' from observador_de_proyectos.cliente;

select tipo_documento 'TIPO DE DOCUMENTO' from observador_de_proyectos.cliente;

-- alias para una tabla
select * from observador_de_proyectos.cliente as c
where c.numero_documento = '80013833'
;

select * from observador_de_proyectos.cliente c
where c.numero_documento = '80013833'
;


-- subconsultas

-- subconsulta en el where
SELECT * FROM observador_de_proyectos.cliente
where tipo_documento=(SELECT documento FROM observador_de_proyectos.tipo_documento
where descripcion='Cédula de Ciudadanía')
;

-- subconsulta en el from
SELECT * FROM (SELECT primer_nombre, primer_apellido FROM observador_de_proyectos.cliente) as sub
where sub.primer_nombre= 'hernando'
;

SELECT
    *
FROM
    (SELECT 
		c.tipo_documento,
        c.numero_documento,
        t.descripcion,
            c.primer_nombre,
            c.primer_apellido,
            cr.rol,
            cr.fecha_terminacion,
            cr.estado,
            r.descripcion as des
    FROM
        observador_de_proyectos.cliente c, observador_de_proyectos.cliente_has_rol cr, observador_de_proyectos.rol r, observador_de_proyectos.tipo_documento t
    WHERE
        (c.tipo_documento = cr.tipo_documento
            AND c.numero_documento = cr.numero_documento
            AND cr.rol = r.id_rol
            AND t.documento = c.tipo_documento)) as a
WHERE
    a.tipo_documento = 'CC'
        AND a.numero_documento = '80013834';

-- distinct
SELECT distinct(rol) FROM observador_de_proyectos.cliente_has_rol; -- une los registros que son silimares

-- joins

select * from tipo_documento t inner join cliente c; -- esta mal por que hace el producto cartesiano

select count(*) from cliente; -- 3265
select count(*) from tipo_documento; -- 7

-- join explicito
select * from observador_de_proyectos.tipo_documento as t inner join observador_de_proyectos.cliente as c
on (t.documento =c.tipo_documento) 
where c.numero_documento='80013833'
;

-- join explicito
select * from observador_de_proyectos.tipo_documento t, observador_de_proyectos.cliente c
where (t.documento =c.tipo_documento) and c.numero_documento='80013833'
;

-- ejemplo semantica explicito

select * from ceet_natural.nivel_formacion n inner join ceet_natural.programa p on n.nivel = p.nivel
    INNER join ceet_natural.competencia c on p.codigo = c.codigo_programa and p.version = c.version_programa
    inner join ceet_natural.resultado_aprendizaje r on c.codigo_competencia = r.codigo_competencia and c.codigo_programa = r.codigo_programa and c.version_programa = r.version_programa
    inner join ceet_natural.planeacion_trimestre pt on r.codigo_resultado = pt.codigo_resultado and r.codigo_competencia = pt.codigo_competencia and r.codigo_programa = pt.codigo_programa and r.version_programa = pt.version_programa
    inner join ceet_natural.actividad_planeacion ap on pt.codigo_resultado = ap.codigo_resultado and pt.codigo_competencia = ap.codigo_competencia and pt.codigo_programa = ap.codigo_programa and pt.version_programa = ap.version_programa and pt.sigla_jornada = ap.sigla_jornada and pt.nivel = ap.nivel and pt.nombre_trimestre = ap.nombre_trimestre and pt.codigo = ap.codigo2
	where n.nivel='tecnico'
;


-- ejemplo semantica implicito
select * from ceet_natural.nivel_formacion n,
              ceet_natural.programa p,
              ceet_natural.competencia c,
              ceet_natural.resultado_aprendizaje r,
              ceet_natural.planeacion_trimestre pt,
              ceet_natural.actividad_planeacion ap
where
    n.nivel = p.nivel and
    p.codigo = c.codigo_programa and p.version = c.version_programa and
    c.codigo_competencia = r.codigo_competencia and c.codigo_programa = r.codigo_programa and c.version_programa = r.version_programa and
    r.codigo_resultado = pt.codigo_resultado and r.codigo_competencia = pt.codigo_competencia and r.codigo_programa = pt.codigo_programa and r.version_programa = pt.version_programa AND
    pt.codigo_resultado = ap.codigo_resultado and pt.codigo_competencia = ap.codigo_competencia and pt.codigo_programa = ap.codigo_programa and pt.version_programa = ap.version_programa and pt.sigla_jornada = ap.sigla_jornada and pt.nivel = ap.nivel and pt.nombre_trimestre = ap.nombre_trimestre and pt.codigo = ap.codigo2
    AND n.nivel='tecnico'
;

-- join explicito surrogate
select * from ceet_surrogate.nivel_formacion as n inner join ceet_surrogate.programa as p on n.id = p.id_nivel_formacion
    inner join ceet_surrogate.competencia as c on p.id = c.id_programa
    inner join ceet_surrogate.resultado_aprendizaje as ra on c.id = ra.id_competencia
    inner join ceet_surrogate.programacion_trimestre as pt on ra.id = pt.id_resultado_aprendizaje
    inner join ceet_surrogate.actividad_planeacion as ap on pt.id = ap.id_planeacion_trimestre
    where n.nivel='tecnico'
;

-- ejemplo de join implicito surrogate

select * from ceet_surrogate.nivel_formacion n,
              ceet_surrogate.programa p,
              ceet_surrogate.competencia c,
              ceet_surrogate.resultado_aprendizaje ra,
              ceet_surrogate.programacion_trimestre pt,
              ceet_surrogate.actividad_planeacion ap
where n.id = p.id_nivel_formacion and
      p.id= c.id_programa and
      c.id= ra.id_competencia and
      ra.id= pt.id_resultado_aprendizaje and
      pt.id= ap.id_planeacion_trimestre and
      n.nivel='tecnico'
;

-- left join

select * from observador_de_proyectos.cliente c left join observador_de_proyectos.aprendiz a
on c.tipo_documento = a.tipo_documento and c.numero_documento = a.numero_documento
inner join observador_de_proyectos.cliente_has_rol chr on c.tipo_documento = chr.tipo_documento and c.numero_documento = chr.numero_documento
where a.numero_documento is not null and chr.rol= 'Aprendiz' and primer_nombre='luis' and primer_apellido='carrillo'
;

-- right join

select * from observador_de_proyectos.aprendiz a right join observador_de_proyectos.cliente c
on c.tipo_documento = a.tipo_documento and c.numero_documento = a.numero_documento
inner join observador_de_proyectos.cliente_has_rol chr on c.tipo_documento = chr.tipo_documento and c.numero_documento = chr.numero_documento
where a.numero_documento is not null and chr.rol= 'Aprendiz' and primer_nombre='luis' and primer_apellido='carrillo'
;







