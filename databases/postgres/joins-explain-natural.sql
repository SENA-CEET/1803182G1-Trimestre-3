select * from tipo_documento td inner join cliente c on td.sigla = c.sigla
inner join aprendiz a on c.numero_documento = a.numero_documento and c.sigla = a.sigla
inner join estado_formacion ef on a.nombre_estado = ef.nombre_estado
where c.numero_documento= '123'
and td.sigla= 'CC'
;