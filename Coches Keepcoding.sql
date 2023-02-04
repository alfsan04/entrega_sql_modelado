--- Nuevo modelo

create schema cocheskeepcoding authorization cjyzzinw;

-- Tabla de colores
create table cocheskeepcoding.colores(
	idColor varchar(10) not null, --PK
	color varchar(200) not null
);

alter table cocheskeepcoding.colores
add constraint colores_PK primary key (idColor);

-- Tabla de tipo de moneda
create table cocheskeepcoding.tipos_moneda(
	idMoneda varchar(10) not null, --PK
	nombre varchar(200) not null
);

alter table cocheskeepcoding.tipos_moneda
add constraint tipos_moneda_PK primary key (idMoneda);

--Tabla aseguradoras
create table cocheskeepcoding.aseguradoras(
	idAseguradora varchar(10) not null, --PK
	nombre varchar(200)
);

alter table cocheskeepcoding.aseguradoras
add constraint aseguradoras_PK primary key (idAseguradora);

--Tabla grupo empresarial
create table cocheskeepcoding.grupo_empresarial(
	idGrupoEmpresarial varchar(10) not null, --PK
	nombre varchar (200)
);

alter table cocheskeepcoding.grupo_empresarial
add constraint grupo_empresarial_PK primary key (idGrupoEmpresarial);

--Tabla marcas
create table cocheskeepcoding.marcas(
	idMarca varchar(10) not null, --PK
	nombre varchar(200) not null,
	idGrupoEmpresarial varchar(10) not null
);

alter table cocheskeepcoding.marcas
add constraint marcas_PK primary key (idMarca);

alter table cocheskeepcoding.marcas
add constraint marcas_grupo_empresarial_FK foreign key (idGrupoEmpresarial)
references cocheskeepcoding.grupo_empresarial(idGrupoEmpresarial);

--Tabla modelos
create table cocheskeepcoding.modelos(
	idModelo varchar(10) not null, --PK
	nombre varchar(200) not null,
	idMarca varchar(10) not null
);

alter table cocheskeepcoding.modelos
add constraint modelos_PK primary key (idModelo);

alter table cocheskeepcoding.modelos
add constraint modelos_marcas_FK foreign key (idMarca)
references cocheskeepcoding.marcas(idMarca);

create table cocheskeepcoding.coches(
	idCoche varchar(10) not null, --PK
	idModelo varchar(10) not null, --FK
	idColor varchar(10) not null, --FK
	matricula varchar(20) not null,
	kilometros integer not null,
	fecha_compra date not null,
	fecha_baja date not null default '4000-01-01',
	numero_poliza varchar(100) not null default 'por asignar',
	idAseguradora varchar(10) not null
);

alter table cocheskeepcoding.coches
add constraint coches_PK primary key (idCoche);

alter table cocheskeepcoding.coches
add constraint coches_modelos_FK foreign key (idModelo)
references cocheskeepcoding.modelos(idModelo);

alter table cocheskeepcoding.coches
add constraint coches_colores_FK foreign key (idColor)
references cocheskeepcoding.colores(idColor);

alter table cocheskeepcoding.coches
add constraint coches_aseguradoras_FK foreign key (idAseguradora)
references cocheskeepcoding.aseguradoras(idAseguradora);

--Tabla revisiones
create table cocheskeepcoding.revisiones(
	idRevision varchar(10) not null, --PK
	idCoche varchar(10) not null, --FK
	fecha_revision date not null,
	km_revision integer not null,
	importe float not null,
	idMoneda varchar(10) not null --FK
);

alter table cocheskeepcoding.revisiones
add constraint revisiones_PK primary key (idRevision);

alter table cocheskeepcoding.revisiones
add constraint revisiones_tipos_moneda_FK foreign key (idMoneda)
references cocheskeepcoding.tipos_moneda(idMoneda);

alter table cocheskeepcoding.revisiones
add constraint revisiones_tipos_moneda_FK2 foreign key (idCoche)
references cocheskeepcoding.coches(idCoche);

--Introduzco grupos empresariales
insert into cocheskeepcoding.grupo_empresarial (idGrupoEmpresarial,nombre) values('GE001','Toyota Motor');
insert into cocheskeepcoding.grupo_empresarial (idGrupoEmpresarial,nombre) values('GE002','Grupo Volkswagen');
insert into cocheskeepcoding.grupo_empresarial (idGrupoEmpresarial,nombre) values('GE003','Grupo PSA');
insert into cocheskeepcoding.grupo_empresarial (idGrupoEmpresarial,nombre) values('GE004','Grupo FCA');
insert into cocheskeepcoding.grupo_empresarial (idGrupoEmpresarial,nombre) values('GE005','Alianza Renault-Nissan-Mitsubishi');
insert into cocheskeepcoding.grupo_empresarial (idGrupoEmpresarial,nombre) values('GE006','General Motors');
insert into cocheskeepcoding.grupo_empresarial (idGrupoEmpresarial,nombre) values('GE007','Ford');
insert into cocheskeepcoding.grupo_empresarial (idGrupoEmpresarial,nombre) values('GE008','BMW');
insert into cocheskeepcoding.grupo_empresarial (idGrupoEmpresarial,nombre) values('GE009','Daimler');

--Introduzco marcas
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M001','Toyota','GE001');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M002','Lexus','GE001');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M003','Volkswagen','GE002');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M004','Audi','GE002');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M005','Seat','GE002');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M006','Skoda','GE002');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M007','Citroën','GE003');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M008','Peugeot','GE003');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M009','Opel','GE003');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M010','Fiat','GE004');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M011','Chrysler','GE004');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M012','Renault','GE005');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M013','Nissan','GE005');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M014','Mitsubishi','GE005');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M015','Dacia','GE005');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M016','Chevrolet','GE006');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M017','Cadillac','GE006');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M018','Ford','GE007');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M019','BMW','GE008');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M020','Mini','GE008');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M021','Mercedes Benz','GE009');
insert into cocheskeepcoding.marcas (idMarca,nombre,idGrupoEmpresarial) values('M022','Smart','GE009');

--Introduzco modelos de coches
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD001','Yaris','M001');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD002','Corolla','M001');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD003','RAV4','M001');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD004','UX','M002');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD005','NX','M002');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD006','ES','M002');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD007','Polo','M003');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD008','Golf','M003');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD009','Touareg','M003');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD010','A3','M004');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD011','A4','M004');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD012','A5','M004');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD013','Ibiza','M005');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD014','León','M005');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD015','Ateca','M005');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD016','Fabia','M006');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD017','Octavia','M006');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD018','Kodiaq','M006');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD019','C3 Aircross','M007');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD020','C4','M007');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD021','C5 Aircross','M007');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD022','308','M008');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD023','3008','M008');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD024','508','M008');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD025','Corsa','M009');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD026','Astra','M009');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD027','Crossland','M009');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD028','500','M010');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD029','Panda','M010');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD030','Tipo','M010');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD031','Grand Voyager','M011');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD032','Clio','M012');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD033','Capture','M012');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD034','Megane','M012');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD035','Juke','M013');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD036','Qashqai','M013');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD037','X-Trail','M013');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD038','Space Star','M014');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD039','Eclipse','M014');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD040','Stepway','M015');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD041','Sandero','M015');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD042','Duster','M015');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD043','Trax','M016');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD044','SRX','M017');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD045','Focus','M018');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD046','K','M018');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD047','Fiesta','M018');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD048','X1','M019');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD049','Serie 5','M019');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD050','Serie 3','M019');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD051','Mini','M020');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD052','Countryman','M020');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD053','Clase A','M021');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD054','GLC','M021');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD055','Clase E','M021');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD056','1','M022');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD057','Forfour','M022');
insert into cocheskeepcoding.modelos (idModelo, nombre, idMarca) values ('MOD058','ForTwo','M022');

--Introduzco colores
insert into cocheskeepcoding.colores (idColor, color) values ('COL001','Blanco');
insert into cocheskeepcoding.colores (idColor, color) values ('COL002','Negro');
insert into cocheskeepcoding.colores (idColor, color) values ('COL003','Gris');
insert into cocheskeepcoding.colores (idColor, color) values ('COL004','Rojo');
insert into cocheskeepcoding.colores (idColor, color) values ('COL005','Azul claro');
insert into cocheskeepcoding.colores (idColor, color) values ('COL006','Azul oscuro');
insert into cocheskeepcoding.colores (idColor, color) values ('COL007','Verde claro');
insert into cocheskeepcoding.colores (idColor, color) values ('COL008','Verde oscuro');
insert into cocheskeepcoding.colores (idColor, color) values ('COL009','Plata');
insert into cocheskeepcoding.colores (idColor, color) values ('COL010','Dorado');
insert into cocheskeepcoding.colores (idColor, color) values ('COL011','Amarillo');
insert into cocheskeepcoding.colores (idColor, color) values ('COL012','Naranja');
insert into cocheskeepcoding.colores (idColor, color) values ('COL013','Marron');

--Introduzco aseguradoras
insert into cocheskeepcoding.aseguradoras (idAseguradora, nombre) values ('ASE001','Mapfre');
insert into cocheskeepcoding.aseguradoras (idAseguradora, nombre) values ('ASE002','Mutua Automovilista');
insert into cocheskeepcoding.aseguradoras (idAseguradora, nombre) values ('ASE003','Linea directa');
insert into cocheskeepcoding.aseguradoras (idAseguradora, nombre) values ('ASE004','AXA');
insert into cocheskeepcoding.aseguradoras (idAseguradora, nombre) values ('ASE005','Qualitas');
insert into cocheskeepcoding.aseguradoras (idAseguradora, nombre) values ('ASE006','Allianz');

--Introduzco tipos de moneda
insert into cocheskeepcoding.tipos_moneda (idMoneda, nombre) values ('MON001','Euro');
insert into cocheskeepcoding.tipos_moneda (idMoneda, nombre) values ('MON002','Dolar');
insert into cocheskeepcoding.tipos_moneda (idMoneda, nombre) values ('MON003','Libra');
insert into cocheskeepcoding.tipos_moneda (idMoneda, nombre) values ('MON004','Bitcoin');
insert into cocheskeepcoding.tipos_moneda (idMoneda, nombre) values ('MON005','Dinar');

--Introduzco coches
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0001','MOD010','COL004','3821LKW','118549','2018-01-01','4000-01-01','AB13447433','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0002','MOD033','COL012','3822QYU','60840','2018-01-15','4000-01-01','AB24920151','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0003','MOD018','COL012','3823DLG','32826','2018-02-01','4000-01-01','AB39506804','ASE002');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0004','MOD030','COL013','3824MGR','0','2018-02-15','2020-01-15','AB41516811','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0005','MOD037','COL006','3825BCC','89367','2018-03-01','4000-01-01','AB57005807','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0006','MOD018','COL002','3826UOA','127159','2018-03-15','4000-01-01','AB63424602','ASE001');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0007','MOD056','COL001','3827EBS','102999','2018-04-01','4000-01-01','AB71320080','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0008','MOD016','COL013','3828WLG','10575','2018-04-15','4000-01-01','AB87380732','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0009','MOD012','COL005','3829EDU','0','2018-05-01','4000-01-01','AB98195828','ASE002');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0010','MOD004','COL004','3830ZRB','120893','2018-05-01','4000-01-01','AB108094308','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0011','MOD014','COL013','3831HIX','60077','2018-06-15','4000-01-01','AB114211916','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0012','MOD015','COL006','3832GWR','0','2018-06-01','4000-01-01','AB123475544','ASE001');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0013','MOD040','COL009','3833SJK','0','2018-07-15','4000-01-01','AB131663298','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0014','MOD031','COL006','3834ZQA','103274','2018-07-01','4000-01-01','AB144177536','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0015','MOD012','COL007','3835GUZ','123604','2018-08-15','4000-01-01','AB153455580','ASE001');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0016','MOD025','COL006','3836YEQ','71348','2018-08-01','4000-01-01','AB16458425','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0017','MOD035','COL005','3837OVM','141590','2018-09-15','4000-01-01','AB172127112','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0018','MOD019','COL009','3838TGI','58603','2018-09-01','4000-01-01','AB188135352','ASE002');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0019','MOD047','COL005','3839VYL','45915','2018-10-01','4000-01-01','AB197034418','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0020','MOD022','COL012','3840FZQ','0','2018-10-15','4000-01-01','AB206280646','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0021','MOD030','COL011','3841HUP','23150','2018-11-01','2020-09-01','AB215699880','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0022','MOD010','COL011','3842GYV','142367','2018-11-15','4000-01-01','AB225876720','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0023','MOD035','COL011','3843UMR','127632','2018-12-01','4000-01-01','AB234313852','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0024','MOD021','COL002','3844HHB','0','2018-12-15','4000-01-01','AB244144559','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0025','MOD037','COL009','3845UOB','126518','2019-01-01','4000-01-01','AB256104448','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0026','MOD026','COL005','3846WQT','89693','2019-01-15','4000-01-01','AB265185051','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0027','MOD052','COL002','3847BIT','114936','2019-02-01','4000-01-01','AB278020574','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0028','MOD020','COL002','3848UIS','120029','2019-02-01','4000-01-01','AB285939832','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0029','MOD040','COL011','3849CRI','117885','2019-03-15','4000-01-01','AB294961824','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0030','MOD002','COL003','3850XVS','82718','2019-03-01','4000-01-01','AB309604333','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0031','MOD035','COL011','3851ZJF','120557','2019-04-15','4000-01-01','AB312712969','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0032','MOD014','COL006','3852TEE','0','2019-04-01','4000-01-01','AB328599275','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0033','MOD053','COL009','3853FTI','0','2019-05-15','4000-01-01','AB339592278','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0034','MOD048','COL003','3854LLF','63219','2019-05-01','4000-01-01','AB348665387','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0035','MOD022','COL012','3855GJQ','73308','2019-06-15','4000-01-01','AB358379040','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0036','MOD035','COL012','3856MAO','22832','2019-06-01','4000-01-01','AB363850442','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0037','MOD001','COL006','3857SBZ','0','2019-07-01','4000-01-01','AB378184615','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0038','MOD001','COL009','3858WXG','112765','2019-07-15','4000-01-01','AB384667057','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0039','MOD040','COL008','3859MIO','132155','2019-08-01','4000-01-01','AB398347232','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0040','MOD037','COL001','3860QOC','76839','2019-08-15','4000-01-01','AB409046940','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0041','MOD008','COL012','3861HTS','43386','2019-09-01','2021-07-01','AB419148636','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0042','MOD052','COL011','3862EEW','94057','2019-09-15','2021-08-15','AB425783312','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0043','MOD013','COL013','3863NBC','58309','2019-10-01','4000-01-01','AB437941555','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0044','MOD014','COL011','3864BIU','38830','2019-10-15','4000-01-01','AB442042921','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0045','MOD018','COL008','3865NVX','0','2019-11-01','4000-01-01','AB453272783','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0046','MOD021','COL004','3866ZMU','81970','2019-11-01','4000-01-01','AB467045250','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0047','MOD052','COL007','3867LJQ','116765','2019-12-15','4000-01-01','AB474255256','ASE001');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0048','MOD001','COL007','3868CKR','0','2019-12-01','4000-01-01','AB482925727','ASE002');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0049','MOD052','COL004','3869GAD','46123','2020-01-15','4000-01-01','AB495362713','ASE001');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0050','MOD035','COL012','3870ANO','31464','2020-01-01','4000-01-01','AB507246907','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0051','MOD043','COL002','3871MVB','121374','2020-02-15','4000-01-01','AB519357074','ASE001');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0052','MOD027','COL011','3872BUJ','114805','2020-02-01','4000-01-01','AB523444999','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0053','MOD011','COL006','3873UPP','35666','2020-03-15','4000-01-01','AB537937298','ASE001');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0054','MOD038','COL013','3874LFZ','115928','2020-03-01','4000-01-01','AB541745541','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0055','MOD007','COL011','3875IZO','32769','2020-04-01','4000-01-01','AB554080679','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0056','MOD040','COL008','3876LBN','29449','2020-04-15','2021-06-15','AB56971756','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0057','MOD039','COL013','3877LQI','9184','2020-05-01','4000-01-01','AB57506042','ASE002');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0058','MOD005','COL008','3878HJM','76145','2020-05-15','4000-01-01','AB584870718','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0059','MOD035','COL006','3879RHC','138308','2020-06-01','4000-01-01','AB595181454','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0060','MOD044','COL003','3880BJC','29757','2020-06-15','4000-01-01','AB608388054','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0061','MOD056','COL004','3881SAE','96579','2020-07-01','4000-01-01','AB615746386','ASE001');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0062','MOD034','COL010','3882CBH','23140','2020-07-15','4000-01-01','AB626122071','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0063','MOD014','COL010','3883HKF','148170','2020-08-01','4000-01-01','AB638175096','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0064','MOD040','COL013','3884HAQ','26662','2020-08-01','4000-01-01','AB64146800','ASE001');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0065','MOD012','COL007','3885CMM','40694','2020-09-15','4000-01-01','AB652040658','ASE002');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0066','MOD054','COL009','3886YGE','0','2020-09-01','4000-01-01','AB664922963','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0067','MOD017','COL005','3887AUC','0','2020-10-15','2021-11-15','AB675599792','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0068','MOD029','COL012','3888GUP','0','2020-10-01','4000-01-01','AB681052135','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0069','MOD005','COL005','3889QVK','0','2020-11-15','4000-01-01','AB696620619','ASE002');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0070','MOD037','COL001','3890HWC','0','2020-11-01','4000-01-01','AB708406614','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0071','MOD028','COL001','3891GSU','69205','2020-12-15','4000-01-01','AB711667837','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0072','MOD054','COL013','3892YLJ','138355','2020-12-01','4000-01-01','AB727393504','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0073','MOD001','COL002','3893HJG','139062','2021-01-01','4000-01-01','AB739902595','ASE001');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0074','MOD002','COL013','3894QLQ','137514','2021-01-15','4000-01-01','AB746542368','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0075','MOD040','COL008','3895FZA','42105','2021-02-01','4000-01-01','AB758593544','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0076','MOD005','COL002','3896CNG','0','2021-02-15','4000-01-01','AB761221140','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0077','MOD048','COL001','3897TLL','70256','2021-03-01','4000-01-01','AB777978158','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0078','MOD013','COL008','3898SEI','140503','2021-03-15','4000-01-01','AB783462808','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0079','MOD020','COL011','3899ODB','19064','2021-04-01','4000-01-01','AB791502197','ASE002');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0080','MOD042','COL012','3900EMB','116523','2021-04-15','4000-01-01','AB807677135','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0081','MOD029','COL006','3901LHO','111185','2021-05-01','4000-01-01','AB817554075','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0082','MOD005','COL006','3902CIH','146262','2021-05-01','4000-01-01','AB824927359','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0083','MOD057','COL011','3903VVI','97949','2021-06-15','4000-01-01','AB834939511','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0084','MOD011','COL013','3904IHV','132878','2021-06-01','4000-01-01','AB841794627','ASE001');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0085','MOD016','COL012','3905ZAI','46614','2021-07-15','4000-01-01','AB851510984','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0086','MOD049','COL013','3906PRD','92775','2021-07-01','4000-01-01','AB863754742','ASE002');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0087','MOD049','COL004','3907FSI','141986','2021-08-15','4000-01-01','AB873512713','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0088','MOD010','COL011','3908FKA','52496','2021-08-01','4000-01-01','AB889847830','ASE004');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0089','MOD012','COL013','3909BGK','79952','2021-09-15','4000-01-01','AB898972756','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0090','MOD044','COL006','3910BUA','64404','2021-09-01','4000-01-01','AB902475353','ASE002');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0091','MOD018','COL007','3911AYW','45430','2021-10-01','4000-01-01','AB914002821','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0092','MOD034','COL001','3912RME','112923','2021-10-15','4000-01-01','AB921077743','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0093','MOD024','COL007','3913BVM','44097','2021-11-01','4000-01-01','AB934747995','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0094','MOD026','COL010','3914RDB','136603','2021-11-15','4000-01-01','AB944995124','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0095','MOD011','COL011','3915IQS','109707','2021-12-01','4000-01-01','AB959793120','ASE003');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0096','MOD019','COL013','3916FAX','147873','2021-12-15','4000-01-01','AB969332324','ASE006');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0097','MOD050','COL013','3917DEB','50957','2021-01-01','4000-01-01','AB978321387','ASE001');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0098','MOD046','COL001','3918QRF','29427','2021-01-15','4000-01-01','AB983624858','ASE005');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0099','MOD039','COL007','3919SJU','91410','2021-02-01','4000-01-01','AB999361006','ASE002');
insert into cocheskeepcoding.coches (idCoche, idModelo, idColor, matricula, kilometros, fecha_compra, fecha_baja, numero_poliza, idAseguradora) values ('COC0100','MOD034','COL004','3920FCB','73020','2021-02-01','4000-01-01','AB1004745758','ASE005');

--Introduzco revisiones
insert into cocheskeepcoding.revisiones(idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0001','COC0001','2021-02-15','138549','602.13','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0002','COC0002','2021-03-01','80840','184.87','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0003','COC0003','2021-03-15','52826','511.38','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0004','COC0004','2021-04-01','20000','847.21','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0005','COC0005','2021-04-15','109367','649.41','MON002');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0006','COC0006','2021-05-01','147159','280.11','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0007','COC0007','2021-05-01','122999','209.88','MON003');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0008','COC0008','2021-06-15','30575','447.04','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0009','COC0009','2021-06-01','20000','90.75','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0010','COC0010','2021-07-15','140893','228.34','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0011','COC0011','2021-07-01','80077','455.28','MON002');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0012','COC0012','2021-08-15','20000','228.61','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0013','COC0013','2021-08-01','20000','925.71','MON002');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0014','COC0014','2021-09-15','123274','677.79','MON002');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0015','COC0015','2021-09-01','143604','137.63','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0016','COC0016','2021-10-01','91348','829.73','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0017','COC0017','2021-10-15','161590','203.86','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0018','COC0001','2021-11-01','158549','112.92','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0019','COC0018','2021-11-15','65915','271.78','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0020','COC0019','2021-12-01','20000','0.02589682','MON004');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0021','COC0002','2021-12-15','100840','940.62','MON001');
insert into cocheskeepcoding.revisiones (idRevision, idCoche, fecha_revision, km_revision, importe, idMoneda) values ('REV0022','COC0001','2021-01-01','178549','862.71','MON001');

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