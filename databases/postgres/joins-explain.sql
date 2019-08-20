select * from tipo_documento td inner join cliente c on td.id = c.id_tipo_documento
inner join aprendiz a on c.id = a.id_cliente
inner join estado_formacion ef on a.id_estado_formacion = ef.id

;