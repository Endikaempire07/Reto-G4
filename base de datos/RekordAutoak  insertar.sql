# Roles
INSERT INTO Role VALUES  (1, "Mecanico", true, true, false, false);
INSERT INTO Role VALUES  (2, "Recepcionista ", true, true, true, false);
INSERT INTO Role VALUES  (3, "Administrador", true, true, true, true);
INSERT INTO Role VALUES  (4, "Jefe", true, false, false, false);

# Empleado
INSERT INTO empleado VALUES ("90000","99999999M", null, "jefe@gmail.com", "b17e1e0450dac425ea318253f6f852972d69731d6c7499c001468b695b6da219", "699999999", "5000", "890", "Lewis", "Villarroel", "1998-01-29", "Calle 1", "Jefe", default, default, 4);
INSERT INTO empleado VALUES ("10000","22345678X", "99999999M", "mecanico1@gmail.com", "b17e1e0450dac425ea318253f6f852972d69731d6c7499c001468b695b6da219", "612343678", "1600.55", "160", "Raul", "Gonzalez", "1998-01-29", "Calle 1", "Mecanico", default, default,1);
INSERT INTO empleado VALUES ("30000","32345678X", "99999999M", "recepcionista1@gmail.com", "b17e1e0450dac425ea318253f6f852972d69731d6c7499c001468b695b6da219", "612325678", "1330.55", "160", "Jongo", "Zalez", "1998-01-29", "Calle 1", "Recepcionista", default, default,2);
INSERT INTO empleado VALUES ("50000","42345678X", "99999999M", "admin1@gmail.com", "b17e1e0450dac425ea318253f6f852972d69731d6c7499c001468b695b6da219", "611345678", "2100.55", "160", "Richard", "Pato", "1998-01-29", "Calle 1", "Administrador", default, default,3);

# Cliente
INSERT INTO cliente VALUES ("12345678X", default, "Alberto", "Mendez", "test1@gmail.com", "612345678", "Calle 1", default);
INSERT INTO cliente VALUES ("22345678X", "inactivo", "Lander", "Sarac", "test2@gmail.com", "612375678", "Calle 1", default);
INSERT INTO cliente VALUES ("33345678X", default, "Paco", "Garcia", "test3@gmail.com", "619375678", "Calle 1", default);
INSERT INTO cliente VALUES ("44345678X", default, "Anselmo", "Rodriguez", "test4@gmail.com", "655375678", "Calle 1", default);

# Vehiculo
INSERT INTO vehiculo VALUES ("3333AAA", "12345678X", default, "12345678901234567", "FORD", "2012", "Diesel", "1998-01-29");
INSERT INTO vehiculo VALUES ("3223AAA", "12345678X", default, "12345679901234567", "RENAULT", "2012", "Gasolina", "1998-01-29");
INSERT INTO vehiculo VALUES ("1133AAA", "22345678X", default, "12345672901234567", "AUDI", "2012", "Gasolina", "1998-01-29");
INSERT INTO vehiculo VALUES ("1323AAA", "33345678X", default, "12345672933234567", "AUDI", "2012", "Electrico", "1998-01-29");
INSERT INTO vehiculo VALUES ("9933ACV", "44345678X", "inactivo", "12355672901234567", "AUDI", "2012", "Electrico", "1998-01-29");

# Pieza
INSERT INTO pieza VALUES ("P00001", "Bridgestone", "Antenas", "21", "26.55", "15.55", default);
INSERT INTO pieza VALUES ("P00002", "Bridgestone", "Embrague", "22", "626.55", "115.55", default);
INSERT INTO pieza VALUES ("P00003", "Bridgestone", "Llantas", "11", "263.55", "166.55", default);
INSERT INTO pieza VALUES ("P00004", "Michelin", "Aceite", "61", "126.55", "101.55", default);
INSERT INTO pieza VALUES ("P00005", "Michelin", "Neumatico", "1", "226.55", "159.55", default);

# Estado
INSERT INTO estado (id, name)
VALUES  (1, "Definición"),
		(2, "Aprobada"),
		(3, "Pendiente"),
		(4, "Solucionada"),
		(5, "Cancelada"),
		(6, "Finalizada");

# Orden Trabajo
INSERT INTO ordenTrabajo VALUES ("OT0001", "3333AAA", "30000", default, null, "5", "Requeire de cambio de Neumatico", 1);
INSERT INTO ordenTrabajo VALUES ("OT0002", "1133AAA", "10000", default, "2021-04-29", "5",  "Requeire de cambio de Neumatico y aceita", 2);
INSERT INTO ordenTrabajo VALUES ("OT0003", "9933ACV", "10000", default, null, "5",  "Requeire de cambio de embrague", 3);

# Factura
INSERT INTO factura VALUES ("F00001", "OT0001", "Metalico", 'pagada', default, "2021-04-26");
INSERT INTO factura VALUES ("F00002", "OT0002", "Tarjeta", default, default, "2021-04-26");
INSERT INTO factura VALUES ("F00003", "OT0003", "Cripto", default, default, "2021-04-26");

# Reparacion
INSERT INTO reparacion VALUES ("R00001", "cambio llantas", default);
INSERT INTO reparacion VALUES ("R00002", "cambio de Neumatico", default);
INSERT INTO reparacion VALUES ("R00003", "cambio de aceite", default);
INSERT INTO reparacion VALUES ("R00004", "Cambio embrague", default);

# Requiere
INSERT INTO requiere VALUES ("OT0001", "R00002", "P00005", "226.55", "4");
INSERT INTO requiere VALUES ("OT0002", "R00002", "P00005", "226.55", "4");
INSERT INTO requiere VALUES ("OT0002", "R00003", "P00004", "126.55", "1");
INSERT INTO requiere VALUES ("OT0003", "R00004", "P00002", "626.55", "1");

# Proveedor
INSERT INTO proveedor VALUES ("A12345678", "Bridgestone", "Direccion 1", "612345678", "email-e1@gmail.com", "activo");
INSERT INTO proveedor VALUES ("B12345678", "Michelin", "Direccion 3", "612335678", "email-e2122@gmail.com", "activo");
INSERT INTO proveedor VALUES ("C12345678", "Pieziqui", "Direccion 55", "612125678", "email-e5@gmail.com", "inactivo");

# Pedido
INSERT INTO pedido VALUES ("DI0001", "A12345678", default, null);
INSERT INTO pedido VALUES ("DI0002", "A12345678", default, CURDATE());
INSERT INTO pedido VALUES ("DI0003", "B12345678", default, CURDATE());

# Suministra
INSERT INTO suministra VALUES ("DI0001", "P00004", "101.55", 35);
INSERT INTO suministra VALUES ("DI0001", "P00005", "159.55", 11);
INSERT INTO suministra VALUES ("DI0002", "P00001", "15.55", 2);
INSERT INTO suministra VALUES ("DI0003", "P00002", "115.55", 1);