create table programador(
dni varchar(10) primary key,
nombre varchar(20) not null,
apellidouno varchar(20) not null,
apellidodos varchar(20),
direccion varchar(50) not null,
cuenta int not null,
telefono int not null,
tipo varchar(10) not null
cod_departamento int not null
);

alter table programador add column progrmentor varchar(10);
alter table programador add constraint fk_progrmentor foreign key (progrmentor) references programador(dni);

create table sede(
codsede int primary key,
nombre varchar(40) not null,
direccion varchar(60) not null
);

create table departamento(
cod_departamento int primary key,
nombre varchar(40) not null,
ubicacion varchar(40) not null,
codsede int not null
);

alter table departamento add constraint fk_codsede foreign key(codsede) references sede(codsede);

alter table programador add column cod_departamento int;
alter table programador add constraint fk_cod_departamento foreign key(cod_departamento) references departamento(cod_departamento);

create table equipo(
cod_equipo int primary key,
descripcion varchar(60) not null,
jefedni varchar(10) not null 
);

alter table equipo add constraint fk_jefedni foreign key (jefedni) references programador(dni);

create table equipo_programadores(
dni varchar(10),
cod_equipo int
);

alter table equipo_programadores add constraint primary key(dni, cod_equipo);
alter table equipo_programadores add constraint fk_dni foreign key(dni) references programador(dni);
alter table equipo_programadores add constraint fk_cod_equipo foreign key(cod_equipo) references equipo(cod_equipo);

create table proyecto(
codproyecto int primary key,
descripcion varchar(40) not null,
fechaIni date not null,
fechaFin date,
sub_proyecto int,
cod_equipo int
);

alter table proyecto add constraint fk_subproyecto foreign key(sub_proyecto) references proyecto(codproyecto);
alter table proyecto add constraint fk2_cod_equipo foreign key(cod_equipo) references equipo(cod_equipo);

alter table proyecto add constraint chk_fecha_fin check (fechaFin <= '2025-12-31');


