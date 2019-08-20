select * from ceet_natural.tipo_documento td inner join cliente c on td.sigla = c.sigla
inner join aprendiz a on c.numero_documento = a.numero_documento and c.sigla = a.sigla
inner join estado_formacion ef on a.nombre_estado = ef.nombre_estado

;


select * from ceet_surrogate.tipo_documento td inner join ceet_surrogate.cliente c on td.id = c.id_tipo_documento
inner join ceet_surrogate.aprendiz a on c.id = a.id_cliente
inner join ceet_surrogate.estado_formacion ef on a.id_estado_formacion = ef.id;


select * from ceet_natural.nivel_formacion nf inner join ceet_natural.programa p on nf.nivel = p.nivel
inner join ceet_natural.ficha f on p.codigo = f.codigo and p.version = f.version
where f.codigo = '1803182G1'
;


select * from ceet_natural.sede s inner join ceet_natural.ambiente a on s.nombre_sede = a.nombre_sede
inner join ceet_natural.tipo_ambiente on a.tipo = tipo_ambiente.tipo
where s.nombre_sede = 'barrio colombia';

