create table covid_muestra(X int,
FECHA_ACTUALIZACION date,
ID_REGISTRO varchar,
ORIGEN int,
SECTOR int,
ENTIDAD_UM int,
SEXO int,
ENTIDAD_NAC int,
ENTIDAD_RES int,
MUNICIPIO_RES int,
TIPO_PACIENTE int,
FECHA_INGRESO date,
FECHA_SINTOMAS date,
FECHA_DEF varchar,
INTUBADO int,
NEUMONIA int,
EDAD int,
NACIONALIDAD int,
EMBARAZO int,
HABLA_LENGUA_INDIG int,
INDIGENA int,
DIABETES int,
EPOC int,
ASMA int,
INMUSUPR int,
HIPERTENSION int,
OTRA_COM int,
CARDIOVASCULAR int,
OBESIDAD int,
RENAL_CRONICA int,
TABAQUISMO int,
OTRO_CASO int,
TOMA_MUESTRA_LAB int,
RESULTADO_LAB int,
TOMA_MUESTRA_ANTIGENO int,
RESULTADO_ANTIGENO int,
CLASIFICACION_FINAL int,
MIGRANTE int,
PAIS_NACIONALIDAD varchar,
PAIS_ORIGEN varchar,
UCI int);

select * from covid_muestra;

copy covid_muestra from 'C:\Users\Public\Documents\aabd_sql_2021\covid_muestra.csv'
delimiter ',' CSV header;

select * from covid_muestra;

create table catalogo_entidades(clave_entidad numeric, entidad_federativa varchar, entidad_abreviatura varchar); 
copy catalogo_entidades from 'C:\Users\Public\Documents\aabd_sql_2021\catalogo_entidades.csv' 
delimiter ',' csv header encoding 'latin1'; 

select * from catalogo_entidades;

select count(*) from covid_muestra;

select * from covid_muestra;

select distinct clasificacion_final from covid_muestra;

select * from covid_muestra where clasificacion_final between 1 and 3;

/* quiero a las personas enfermas, donde sepa dónde viven y sepa la unidad médida
donde se descubrieron*/

create table covid_enfermos as
select * from covid_muestra where (clasificacion_final between 1 and 3) 
and (entidad_res between 1 and 32) 
and (entidad_um between  1 and 32);

select count(*) from covid_enfermos;

select * from covid_enfermos;

create table covid_traducido_1 as
select * from covid_enfermos
inner join catalogo_entidades
on covid_enfermos.entidad_um = catalogo_entidades.clave_entidad;

select * from covid_traducido_1;

alter table covid_traducido_1 drop column clave_entidad;
alter table covid_traducido_1 rename column entidad_federativa to entidad_um_nombre;
alter table covid_traducido_1 rename column entidad_abreviatura to entidad_um_abr;

select * from covid_traducido_1;

create table covid_traducido as
select * from covid_traducido_1
inner join catalogo_entidades
on covid_traducido_1.entidad_res = catalogo_entidades.clave_entidad;

select * from covid_traducido;

alter table covid_traducido drop column clave_entidad;
alter table covid_traducido rename column entidad_federativa to entidad_res_nombre;
alter table covid_traducido rename column entidad_abreviatura to entidad_res_abr;

select count(*) from covid_traducido  where entidad_um_nombre != entidad_res_nombre;

select * from covid_traducido;

create table covid_difuntos as
select *,
case 
when fecha_def = '9999-99-99' then Null
else 1
end as "deceso"
from covid_traducido;

select count(*) from covid_difuntos where deceso = 1;

create table covid_limpio as
select *,
case
when edad between 0 and 5 then '0-5'
when edad between 6 and 10 then '6-10'
when edad between 11 and 15 then '11-15'
when edad between 16 and 20 then '16-20'
when edad between 21 and 25 then '21-25'
when edad between 26 and 30 then '26-30'
when edad between 31 and 35 then '31-35'
when edad between 36 and 40 then '36-40'
when edad between 41 and 45 then '41-45'
when edad between 46 and 50 then '46-50'
when edad between 51 and 55 then '51-55'
when edad between 56 and 60 then '56-60'
when edad between 61 and 65 then '61-65'
when edad between 66 and 70 then '66-70'
when edad > 70 then '71_o_mas'
end "grupo_edad"
from covid_difuntos;


select * from covid_limpio 

select count(deceso) from covid_limpio where entidad_res_nombre = 'Tlaxcala'


select * from covid_limpio