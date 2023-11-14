--CREATE DATABASE materiadbpia
use materiadbpia

create table sedes (
	idSedes int IDENTITY(1,1) PRIMARY KEY,
	nombre nvarchar(50) NOT NULL,
	ubicacion nvarchar(30) NOT NULL,
	capacidad int NOT NULL
)

create table roles (
	idRoles int IDENTITY(1,1) PRIMARY KEY,
	nombre nvarchar(15) NOT NULL,
)

INSERT INTO roles (nombre) VALUES ('Administrador')
INSERT INTO roles (nombre) VALUES ('Operador')
INSERT INTO roles (nombre) VALUES ('Usuario')

create table dependencias(
	idDependencias int IDENTITY(1,1) PRIMARY KEY,
	nombre nvarchar(60) NOT NULL
)

create table invitados(
	idInvitados int IDENTITY(1,1) PRIMARY KEY,
    nombres nvarchar(50) NOT NULL,
    apellidoPaterno nvarchar(50) NOT NULL,
    apellidoMaterno nvarchar(50) NOT NULL
)

create table usuarios(
	idUsuarios int IDENTITY(1,1) PRIMARY KEY,
    nombres nvarchar(50) NOT NULL,
    apellidoPaterno nvarchar(50) NOT NULL,
    apellidoMaterno nvarchar(50) NOT NULL,
	matricula int UNIQUE NOT NULL,
    contraseña nvarchar(60) NOT NULL,
    salt nvarchar(30) NOT NULL UNIQUE,
	idDependencias int NOT NULL FOREIGN KEY REFERENCES dependencias(idDependencias),
	idRoles int NOT NULL FOREIGN KEY REFERENCES roles(idRoles) default 3,
	activo bit default 1 NOT NULL -- Esta activo por default
)

create table eventos(
	idEventos int IDENTITY(1,1) PRIMARY KEY,
	nombre nvarchar(40) NOT NULL,
	fecha datetime NOT NULL,
	idSedes int NOT NULL FOREIGN KEY REFERENCES sedes(idSedes),
	idDependencias int NOT NULL FOREIGN KEY REFERENCES dependencias(idDependencias)
)

create table boletos(
    idBoletos int IDENTITY(1,1) PRIMARY KEY,
    codigoBarras int UNIQUE NOT NULL,
    idEventos int NOT NULL FOREIGN KEY REFERENCES eventos(idEventos)
)

create table asistenciaInvitados(
	idAsistenciaInvitados int IDENTITY(1,1) PRIMARY KEY,
	idBoletos int NOT NULL FOREIGN KEY REFERENCES boletos(idBoletos),
	asistencia bit default 1 NOT NULL, -- Si existe el registo por lo general asistira, si no, no hubiera sido creado
	idInvitados int NOT NULL FOREIGN KEY REFERENCES invitados(idInvitados)
)

create table asistenciaUsuarios(
    idAsistenciaUsuario int IDENTITY(1,1) PRIMARY KEY,
    idBoletos int NOT NULL FOREIGN KEY REFERENCES boletos(idBoletos),
    asistencia bit default 1 NOT NULL, -- Si existe el registo por lo general asistira, si no, no hubiera sido creado
    idUsuarios int NOT NULL FOREIGN KEY REFERENCES usuarios(idUsuarios)
)
