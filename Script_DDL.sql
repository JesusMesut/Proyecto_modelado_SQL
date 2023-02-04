--CREACIÓN ESQUEMA
create schema PROYECTO_JGV authorization qrejwljc;

--CREACIÓN TABLA 'GRUPO_EMPRESARIAL'
create table PROYECTO_JGV.grupo_empresarial(
	cod_grupo serial not null, --PK
	grupo varchar(20) not null
);

--PK
alter table PROYECTO_JGV.grupo_empresarial
add constraint grupo_empresarial_PK primary key (cod_grupo);

--CREACIÓN TABLA 'MARCA'
create table PROYECTO_JGV.marca(
	cod_marca serial not null, --PK
	marca varchar(20) not null,
	cod_grupo serial not null --FK grupo_empresarial
);

--PK
alter table PROYECTO_JGV.marca
add constraint marca_PK primary key (cod_marca);

--FK
alter table PROYECTO_JGV.marca
add constraint marca_grupo_empresarial_FK foreign key (cod_grupo)
references PROYECTO_JGV.grupo_empresarial(cod_grupo);

--CREACIÓN TABLA 'MODELO'
create table PROYECTO_JGV.modelo(
	cod_modelo serial not null, --PK
	modelo varchar(20) not null,
	cod_marca serial not null --FK marca
);

--PK
alter table PROYECTO_JGV.modelo
add constraint modelo_PK primary key (cod_modelo);

--FK
alter table PROYECTO_JGV.modelo
add constraint modelo_marca_FK foreign key (cod_marca)
references PROYECTO_JGV.marca(cod_marca);

--CREACIÓN TABLA 'ASEGURADORA'
create table PROYECTO_JGV.aseguradora(
	cod_aseguradora serial not null, --PK
	aseguradora varchar(20) not null
);

--PK
alter table PROYECTO_JGV.aseguradora
add constraint aseguradora_PK primary key (cod_aseguradora);

--CREACIÓN TABLA 'MONEDA'
create table PROYECTO_JGV.moneda(
	cod_moneda serial not null, --PK
	moneda varchar(20) not null
);
	
--PK
alter table PROYECTO_JGV.moneda
add constraint moneda_PK primary key (cod_moneda);

--CREACIÓN TABLA 'REVISIÓN'
create table PROYECTO_JGV.revision(
	cod_revision serial not null, --PK
	cod_coche serial not null, --FK coche
	KM integer not null,
	fecha date not null,
	importe numeric (8,2) not null,
	cod_moneda serial not null --FK moneda
);

--PK
alter table PROYECTO_JGV.revision
add constraint revision_PK primary key (cod_revision);

--FK
alter table PROYECTO_JGV.revision
add constraint revision_moneda_FK foreign key (cod_moneda)
references PROYECTO_JGV.moneda(cod_moneda);

--CREACIÓN TABLA 'COCHE'
create table PROYECTO_JGV.coche(
	cod_coche serial not null, --PK
	cod_modelo serial not null, --FK modelo
	matricula varchar(20) not null,
	color varchar(20) not null,
	km integer not null,
	num_poliza integer not null,
	cod_aseguradora serial not null, --FK aseguradora 
	fecha_compra date not null,
	fecha_baja date null
);

--PK
alter table PROYECTO_JGV.coche
add constraint coche_PK primary key (cod_coche);

--FK
alter table PROYECTO_JGV.coche
add constraint coche_modelo_FK foreign key (cod_modelo)
references PROYECTO_JGV.modelo(cod_modelo);

--FK
alter table PROYECTO_JGV.coche
add constraint coche_aseguradora_FK foreign key (cod_aseguradora)
references PROYECTO_JGV.aseguradora(cod_aseguradora);

--FK
alter table PROYECTO_JGV.revision
add constraint revision_coche_FK foreign key (cod_coche)
references PROYECTO_JGV.coche(cod_coche);

-------------------------------------------------------------------------------------------------------------------------

--INTRODUCCIÓN DATOS TABLA 'GRUPO_EMPRESARIAL'
insert into PROYECTO_JGV.grupo_empresarial (grupo) values ('SAV');
insert into PROYECTO_JGV.grupo_empresarial (grupo) values ('COR');
insert into PROYECTO_JGV.grupo_empresarial (grupo) values ('PDM');

--INTRODUCCIÓN DATOS TABLA 'MARCA'
insert into PROYECTO_JGV.marca (marca,cod_grupo) values ('Seat',1);
insert into PROYECTO_JGV.marca (marca,cod_grupo) values ('Audi',1);
insert into PROYECTO_JGV.marca (marca,cod_grupo) values ('Volkswagen',1);
insert into PROYECTO_JGV.marca (marca,cod_grupo) values ('Citroen',2);
insert into PROYECTO_JGV.marca (marca,cod_grupo) values ('Opel',2);
insert into PROYECTO_JGV.marca (marca,cod_grupo) values ('Renault',2);
insert into PROYECTO_JGV.marca (marca,cod_grupo) values ('Peugeot',3);
insert into PROYECTO_JGV.marca (marca,cod_grupo) values ('Dacia',3);
insert into PROYECTO_JGV.marca (marca,cod_grupo) values ('Mercedes',3);

--INTRODUCCIÓN DATOS TABLA 'MODELO'
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('Ibiza',1);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('León',1);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('Q3',2);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('A3',2);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('Golf',3);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('Lupo',3);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('C4',4);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('C3',4);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('Astra',5);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('Corsa',5);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('Clio',6);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('Arkana',6);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('208',7);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('3008',7);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('Sandero',8);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('Logan',8);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('AMG',9);
insert into PROYECTO_JGV.modelo (modelo,cod_marca) values ('CLASE A',9);

--INTRODUCCIÓN DATOS TABLA 'ASEGURADORA'
insert into PROYECTO_JGV.aseguradora (aseguradora) values ('Mapfre');
insert into PROYECTO_JGV.aseguradora (aseguradora) values ('Mutua Madrileña');
insert into PROYECTO_JGV.aseguradora (aseguradora) values ('MMT');
insert into PROYECTO_JGV.aseguradora (aseguradora) values ('Línea Directa');
insert into PROYECTO_JGV.aseguradora (aseguradora) values ('Reale Seguros');

--INTRODUCCIÓN DATOS TABLA 'COCHE'
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra,fecha_baja) values (1,'1456 GTV','rojo',87000,56776675,2,'2000-4-27','2022-8-27');
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra,fecha_baja) values (5,'2202 SLD','azul',22000,49066606,1,'2004-8-26','2019-12-2');
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra,fecha_baja) values (9,'3443 GTV','verde',135700,71742326,3,'2008-2-2','2021-11-16');
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra,fecha_baja) values (3,'9076 LJR','amarillo',279500,52372141,5,'1995-3-5','2019-5-3');
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra,fecha_baja) values (12,'5824 VXZ','amarillo',56500,23913603,4,'2014-7-16','2022-12-15');
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra,fecha_baja) values (14,'6655 MHP','gris',99000,70525842,2,'2005-7-18','2018-11-2');
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra,fecha_baja) values (16,'8744 ZZS','negro',212000,54103926,3,'2008-11-2','2023-1-19');
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra,fecha_baja) values (18,'1232 RRD','morado',66500,18633397,1,'2008-11-19','2020-8-30');
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra,fecha_baja) values (2,'5881 CCC','rojo',76000,37842466,2,'2004-12-3','2022-1-11');
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra,fecha_baja) values (4,'9900 AAB','blanco',44000,42157006,5,'2000-12-17','2022-6-24');
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra) values (6,'7660 EDE','blanco',22000,75521524,5,'2000-8-22');--sin baja
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra) values (2,'5000 KFC','negro',55000,40862490,4,'2021-6-8');--sin baja
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra) values (13,'1044 ROS','verde',110000,32650808,4,'2001-6-30');--sin baja
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra) values (17,'8080 NMJ','negro',62000,33600090,1,'2007-8-3');--sin baja
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra) values (1,'2468 LKL','azul',80000,14470972,1,'2009-5-30');--sin baja
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra) values (8,'3355 HGT','gris',34000,21796616,2,'2011-1-27');--sin baja
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra) values (10,'1900 BVB','rojo',65000,11078135,3,'2020-1-3');--sin baja
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra) values (11,'7000 CNN','azul',330000,67269575,2,'2014-3-6');--sin baja
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra) values (15,'6621 SPA','rojo',250000,28019185,5,'2013-3-4');--sin baja
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra) values (5,'6031 HJI','morado',100000,56776675,2,'2015-2-8');--sin baja
insert into PROYECTO_JGV.coche (cod_modelo,matricula,color,km,num_poliza,cod_aseguradora,fecha_compra) values (13,'9040 ACC','amarillo',240000,55615983,4,'2021-10-18');--sin baja

--INTRODUCCIÓN DATOS TABLA 'MONEDA'
insert into PROYECTO_JGV.moneda (moneda) values ('Euro');
insert into PROYECTO_JGV.moneda (moneda) values ('Dolar');
insert into PROYECTO_JGV.moneda (moneda) values ('Peso');
insert into PROYECTO_JGV.moneda (moneda) values ('Yen');
insert into PROYECTO_JGV.moneda (moneda) values ('Libra');

--INTRODUCCIÓN DATOS TABLA 'REVISIÓN'
insert into PROYECTO_JGV.revision (cod_coche,km,fecha,importe,cod_moneda) values (6,60000,'2023-1-14',245.32,2);
insert into PROYECTO_JGV.revision (cod_coche,km,fecha,importe,cod_moneda) values (9,15000,'2022-8-27',300.21,5);
insert into PROYECTO_JGV.revision (cod_coche,km,fecha,importe,cod_moneda) values (15,65000,'2022-2-28',172.50,4);
insert into PROYECTO_JGV.revision (cod_coche,km,fecha,importe,cod_moneda) values (3,30000,'2021-3-1',100.80,2);
insert into PROYECTO_JGV.revision (cod_coche,km,fecha,importe,cod_moneda) values (8,10000,'2018-6-10',275,3);
insert into PROYECTO_JGV.revision (cod_coche,km,fecha,importe,cod_moneda) values (4,160000,'2019-7-2',90.32,1);
insert into PROYECTO_JGV.revision (cod_coche,km,fecha,importe,cod_moneda) values (14,220000,'2021-1-13',450.99,1);
insert into PROYECTO_JGV.revision (cod_coche,km,fecha,importe,cod_moneda) values (17,75000,'2022-12-9',580.62,4);
insert into PROYECTO_JGV.revision (cod_coche,km,fecha,importe,cod_moneda) values (2,100000,'2023-11-9',45.40,5);
insert into PROYECTO_JGV.revision (cod_coche,km,fecha,importe,cod_moneda) values (1,175000,'2021-10-29',410.55,3);
insert into PROYECTO_JGV.revision (cod_coche,km,fecha,importe,cod_moneda) values (11,50000,'2020-5-3',120.90,3);

---------------------------------------------------------------------------------------------------------------










