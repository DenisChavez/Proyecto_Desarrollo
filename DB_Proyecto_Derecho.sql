create database ConsultorioJuridico

use ConsultorioJuridico

---Tablas

create table  IniciarSesi�n(
userID int primary key identity(1,1),
username varchar(50) not null,
pass varchar(50) not null,
TipoUsuario varchar(50) not null
)
go

create table Cliente(
ID_Cliente int primary key identity(1,1),
FK___userID int foreign key references IniciarSesi�n(userID),
Nombre_Cliente varchar(30) NOT NULL,
DNI varchar(13) NOT NULL,
Edad int NOT NULL,
FechaNacimiento varchar(15) NOT NULL,
Sexo char(1) NOT NULL,
Tel�fono varchar(15), 
Profesi�n varchar(15),
Direcci�n varchar(50) NOT NULL,
)
go

create table Director(
ID_Director int primary key identity(1,1),
FK__userID int foreign key references IniciarSesi�n(userID),
Nombre_Director varchar(30) NOT NULL,
DNI varchar(13) NOT NULL,
CorreoElectronico varchar(20),
Tel�fono varchar(15) NOT NULL
)
go

create table Procurador(
ID_Procurador int primary key identity(1,1),
FK_ID_Director int foreign key references Director(ID_Director),
FK_userID int foreign key references IniciarSesi�n(userID),
Nombre_Procurador varchar(30) NOT NULL,
DNI varchar(13) NOT NULL,
Tel�fono varchar(15),
CorreoElectronico varchar(20),
Horarios varchar(50) NOT NULL
)
go

create table Autorizaci�n(
ID_Autorizaci�n int primary key identity(1,1),
Nombre varchar(20) NOT NULL,
DNI varchar(13) NOT NULL,
Tipo_proceso varchar(20),
Nombre_demandado varchar(30) NOT NULL,
Nombre_juzgado varchar(40) NOT NULL,
Fecha date NOT NULL,
Firma varchar(15) NOT NULL
)
go

create table Excitativa(
ID_Excitativa int primary key identity(1,1),
Nombre_Exitativa varchar(30) NOT NULL,
Nombre_Procurador varchar(30) NOT NULL,
Nombre_Cliente varchar(30) NOT NULL,
Fecha_Hora_presentarse datetime NOT NULL,
Fecha date NOT NULL
)
go

create table Exoneraci�n(
ID_Exoneraci�n int primary key identity(1,1),
Nombre_Exoneraci�n varchar(30) NOT NULL,
DNI varchar(13) NOT NULL,
Telefono int NOT NULL,
Tipo_Proceso varchar(20) NOT NULL,
Nombre_Juzgado varchar(40) NOT NULL,
Fecha date NOT NULL,
Firma varchar(15)NOT NULL
)
go

create table RolAtenci�n(
ID_Atenci�n int primary key identity(1,1),
FK_ID_Cliente int foreign key references Cliente(ID_Cliente),
FK_ID_Procurador int foreign key references Procurador(ID_Procurador),
Fecha_Hora_atencion datetime NOT NULL,
)
go

create table Expediente(
ID_Expediente int primary key identity(1,1),
FK_ID__Cliente int foreign key references Cliente(ID_Cliente),
FK_ID__Procurador int foreign key references Procurador(ID_Procurador),
Medios_Prueba varchar(500)NOT NULL,
Firma_Cliente varchar(20)NOT NULL,
Acta_Conciliaci�n varchar(100)NOT NULL,
Fecha date NOT NULL
)
go

create table Caso(
ID_Caso int primary key identity(1,1),
FK_ID___Procurador int foreign key references Procurador(ID_Procurador),
FK_ID___Cliente int foreign key references Cliente(ID_Cliente),
FK_ID___Expediente int foreign key references Expediente(ID_Expediente),
Procediemtio_a_seguir varchar(100)NOT NULL,
Tipo�rea varchar(30)NOT NULL,
TipoCaso varchar(30)NOT NULL
)
go

create table Constancia(
ID_Constancia int primary key identity(1,1),
FK_ID__Expediente int foreign key references Expediente(ID_Expediente),
Nombre varchar(30)NOT NULL,
DNI varchar(13)NOT NULL,
Tipo_Demanda varchar(50)NOT NULL,
Fecha date NOT NULL,
Firma varchar(20) NOT NULL
)
go

create table TipoRedacci�n(
ID_TipoRedacci�n int primary key identity(1,1),
FK_ID_Constancia int foreign key references Constancia(ID_Constancia),
FK_ID_Autorizaci�n int foreign key references Autorizaci�n(ID_Autorizaci�n),
FK_ID_Exoneraci�n int foreign key references Exoneraci�n(ID_Exoneraci�n),
FK_ID_Excitativa int foreign key references Excitativa(ID_Excitativa)
)
go

---Inserts

insert into IniciarSesi�n (username, pass,TipoUsuario) values 
('Carol', '123', 'Director'),
('BenjaDen', '456', 'Procurador'),
('EnocAS', '789', 'Cliente')

select * from IniciarSesi�n

insert into Cliente (FK___userID,Nombre_Cliente,DNI,Edad,FechaNacimiento,Sexo,Tel�fono,Profesi�n,Direcci�n) values
(3,'Enoc Garcia', '0813197006849', '19', '11/1/2005', 'M', '93943159', 'Ingeniero', 'Colonis Miraflores')

select * from Cliente

insert into Director (FK__userID,Nombre_Director,DNI,CorreoElectronico,Tel�fono) values
(1,'Carolina', '0801196987496', 'carol89@gamil.com', '94874520')

select * from Director

insert into Procurador (FK_ID_Director,FK_userID,Nombre_Procurador, DNI, Tel�fono, CorreoElectronico, Horarios) values
(1,2,'Benjamin', '0801220406448', '89220389', 'benja10@gmail.com', '9:00 a.m a 5:00 p.m')

select * from Cliente

insert into Cliente (Nombre_Cliente, DNI, Edad, FechaNacimiento, Sexo, Tel�fono, Profesi�n, Direcci�n)
insert into Cliente


---Procedimientos almacenados
