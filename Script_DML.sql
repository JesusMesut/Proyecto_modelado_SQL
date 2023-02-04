--CONSULTA SQL(DML)
select c.modelo, b.marca, a.grupo, d.fecha_compra, d.matricula, d.color, d.km, e.aseguradora, d.num_poliza
from PROYECTO_JGV.grupo_empresarial a inner join PROYECTO_JGV.marca b on a.cod_grupo = b.cod_grupo
inner join PROYECTO_JGV.modelo c on b.cod_marca = c.cod_marca inner join PROYECTO_JGV.coche d 
on c.cod_modelo = d.cod_modelo inner join PROYECTO_JGV.aseguradora e on d.cod_aseguradora = e.cod_aseguradora
where fecha_baja is not null;