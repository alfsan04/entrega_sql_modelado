SELECT a.nombre,b.nombre,c.nombre,p.fecha_compra,p.matricula,d.color,p.kilometros,e.nombre,p.numero_poliza
FROM cocheskeepcoding.coches p
	INNER JOIN cocheskeepcoding.modelos a
ON p.idModelo = a.idModelo
	INNER JOIN cocheskeepcoding.marcas b
ON a.idMarca = b.idMarca
	inner join cocheskeepcoding.grupo_empresarial c
on b.idGrupoEmpresarial = c.idGrupoEmpresarial
	inner join cocheskeepcoding.colores d
on p.idColor = d.idColor
	inner join cocheskeepcoding.aseguradoras e
on p.idAseguradora = e.idAseguradora
where p.fecha_baja > '2024-01-01';