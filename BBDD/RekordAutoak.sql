/*
*
* CREACION DE BBDD Y TABLAS
*
*/
DROP DATABASE IF EXISTS RekordAutoak;
create database RekordAutoak;
use RekordAutoak;

CREATE TABLE Role (
    id INT NOT NULL COMMENT 'Identificador de la entidad',
    name VARCHAR (50) UNIQUE NOT NULL COMMENT 'Nombre del rol',

   	PermisoDeLectura  BOOLEAN,
    PermisoDeEscritura BOOLEAN ,
    PermisoDeEliminacion BOOLEAN ,
    PermisoDeAdministracion BOOLEAN ,

    CONSTRAINT PK_ROLE PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT 'Rol';


create table empleado (
	id int(5) not null,
	dniEmple char(9),
	dniJefe char(9),
	email varchar(100) unique not null,
	password varchar(250) not null,
	telefono char(9) unique not null,
	salBase float(6,2),
	comision float(6,2),
	nombre varchar(20) not null,
	apellidos varchar (50) not null,
	fecNac date not null,
	direccion varchar(50),
	tipoEmpleado enum('Administrador', 'Recepcionista', 'Mecanico', 'Jefe') not null,
	fecAltaContrato date not null default CURDATE(),
	estado enum('activo','inactivo') default 'activo' not null,
	idRole INT NOT NULL,

	primary key (dniEmple),
	index (id),
	foreign key (idRole) REFERENCES Role (id),
    foreign key (dniJefe) REFERENCES empleado(dniEmple) on update cascade
);

create table cliente (
	dniCliente char(9) primary key,
	estado enum('activo','inactivo') default 'activo' not null,
	nombre varchar(20) not null,
	apellidos varchar (50) not null,
	email varchar(100) unique not null,
	telefono char(9) unique not null,
	direccion varchar(50),
	fecAlta date not null default CURDATE()
);

create table vehiculo (
	matricula varchar(20) primary key,
	dniCliente char(9) not null,
	estado enum('activo','inactivo') default 'activo' not null,
	nBastidor char(17) unique not null, 
	marca varchar(25) not null,
	modelo varchar(25) not null,
	tipoCombustible enum('Diesel', 'Gasolina', 'Electrico') not null,
	fecFabric date,
	FOREIGN KEY (dniCliente) REFERENCES cliente(dniCliente) on update cascade
);

create table pieza (
	idPieza char(6) primary key,
	marca varchar(25) not null,
	nombre varchar(250) not null,
	stock int(6) unsigned not null default 0,
	pvp float(6,2) unsigned not null,
	precioCompra float(6,2) unsigned not null,
	estado enum('activo','inactivo') default 'activo' not null
);

CREATE TABLE estado (
    id INT NOT NULL COMMENT 'Identificador de la entidad',
    name VARCHAR(50) NOT NULL COMMENT 'Nombre',

    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT 'Estado de la orden de trabajo';

create table ordenTrabajo (
	idOrden char(6) primary key,
	matricula varchar(20) not null,
	idEmple int not null,
	fecInicio date not null default CURDATE(),
	fecFin date,
	tiempoHoras int(4) unsigned default 1,
	descTrabajo varchar (250),
	idestado INT NOT NULL,

	FOREIGN KEY (idestado) REFERENCES estado(id) ON UPDATE CASCADE,
	FOREIGN KEY (matricula) REFERENCES vehiculo(matricula) ON UPDATE CASCADE,
	FOREIGN KEY (idEmple) REFERENCES empleado(id) ON UPDATE CASCADE
	
);

create table factura (
	idFactura char(6) primary key,
	idOrden char(6) not null,
	metodoPago enum('Metalico','Tarjeta','Cripto') not null,
	pagada enum('pendiente','pagada') default 'pendiente' not null,
	descuento int(2) unsigned not null default 0,
	fecha date not null default CURDATE(),
	FOREIGN KEY (idOrden) REFERENCES ordenTrabajo(idOrden) ON UPDATE CASCADE
);



create table reparacion (
	idReparacion char(6) primary key,
	descripcion varchar(250) not null,
	estado enum('activo','inactivo') default 'activo' not null
);

create table requiere (
	idOrden char(6),
	idReparacion char(6),
	idPieza char(6),
	precioHistorico float(6,2) unsigned not null,
	cantidad int(6) unsigned default '1' not null,
	
	PRIMARY KEY(idOrden, idReparacion, idPieza),
	FOREIGN KEY (idOrden) REFERENCES ordenTrabajo(idOrden) ON UPDATE CASCADE on delete cascade,
	FOREIGN KEY (idReparacion) REFERENCES reparacion(idReparacion) ON UPDATE CASCADE,
	FOREIGN KEY (idPieza) REFERENCES pieza(idPieza) ON UPDATE CASCADE
);

create table proveedor (
	cif char(9) primary key,
	nombre varchar(20) unique not null,
	direccion varchar(50),
	telefono char(9) unique not null,
	email varchar(100) unique not null,
	estado enum('activo','inactivo') default 'activo' not null
);

create table pedido (
	idPedido char(6) primary key,
	cif char(9) not null,
	fecPedido date default CURDATE() not null,
	fecEntrega date,
	FOREIGN KEY (cif) REFERENCES proveedor(cif) ON UPDATE CASCADE
);

create table suministra (
	idPedido char(6),
	idPieza char(6),
	precioHistorico float(6,2) unsigned not null,
	cantidad int(6) unsigned not null default 1,
	PRIMARY KEY(idPedido, idPieza),
	FOREIGN KEY (idPedido) REFERENCES pedido(idPedido) ON UPDATE CASCADE,
	FOREIGN KEY (idPieza) REFERENCES pieza(idPieza) ON UPDATE CASCADE
);