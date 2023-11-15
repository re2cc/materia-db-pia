-- create database materiadbpia
use materiadbpia

INSERT INTO dependencias (nombre) VALUES ('FCFM')
INSERT INTO dependencias (nombre) VALUES ('FARQ')
INSERT INTO dependencias (nombre) VALUES ('FIME')
INSERT INTO dependencias (nombre) VALUES ('FACPYA')
INSERT INTO dependencias (nombre) VALUES ('FCB')

INSERT INTO sedes (nombre, ubicacion, capacidad) VALUES ('Auditorio 1', 'Planta baja', 100)
INSERT INTO sedes (nombre, ubicacion, capacidad) VALUES ('Auditorio 2', 'Primer piso', 75)
INSERT INTO sedes (nombre, ubicacion, capacidad) VALUES ('Plaza cultural', 'Planta baja', 300)
INSERT INTO sedes (nombre, ubicacion, capacidad) VALUES ('Laboratorio', 'Segundo piso', 35)

INSERT INTO invitados (nombres, apellidoPaterno, apellidoMaterno) VALUES ('Tomasa', 'Palma', 'Perez')
INSERT INTO invitados (nombres, apellidoPaterno, apellidoMaterno) VALUES ('Karima', 'Rosell', 'Gomez')
INSERT INTO invitados (nombres, apellidoPaterno, apellidoMaterno) VALUES ('Santos', 'Farina', 'Rojas')

INSERT INTO boletos (codigoBarras, idEventos) VALUES (15125212, 1)
INSERT INTO asistenciaUsuarios (idBoletos, asistencia, idUsuarios) VALUES (3, 1, 1)

-- TODO

-- INSERT INTO usuarios (nombres,apellidoPaterno,apellidoMaterno, matricula, contraseña, idDependencias, idRoles)
-- VALUES ('Yeray Bastida','Chavez','Lopez', 5124561, '!@nBu4M', 2, 2)
-- INSERT INTO usuarios (nombres,apellidoPaterno,apellidoMaterno, matricula, contraseña, idDependencias, idRoles)
-- VALUES ('Vicente Jose','Echeverria','Juarez', 1536568, 'B!aJ3i!', 3, 1)
-- INSERT INTO usuarios (nombres,apellidoPaterno,apellidoMaterno, matricula, contraseña, idDependencias, idRoles)
-- VALUES ('Maria','Lopez','Garcia', 6653568, '2Q8S*^z', 4, 2)
-- INSERT INTO usuarios (nombres,apellidoPaterno,apellidoMaterno, matricula, contraseña, idDependencias, idRoles)
-- VALUES ('Jaime','Cuesta','Palmeros', 7134561, 'r$WB&h5', 5, 2)
-- INSERT INTO usuarios (nombres,apellidoPaterno,apellidoMaterno, matricula, contraseña, idDependencias, idRoles)
-- VALUES ('Esteban','Leon','Vazquez', 8653563, 'Z92wM@*', 1, 2)
-- INSERT INTO usuarios (nombres,apellidoPaterno,apellidoMaterno, matricula, contraseña, idDependencias, idRoles)
-- VALUES ('Judit','Suarez','Benitez', 9503562, '@5%fK92', 2, 2)
-- INSERT INTO usuarios (nombres,apellidoPaterno,apellidoMaterno, matricula, contraseña, idDependencias, idRoles)
-- VALUES ('Blanca','Lagos','Sanchez', 2368203, 'Vt2Cb!^', 3, 1)
-- INSERT INTO usuarios (nombres,apellidoPaterno,apellidoMaterno, matricula, contraseña, idDependencias, idRoles)
-- VALUES ('Anais Saavedra','Rodriguez','Ramirez', 1384570, '*BV!fA6', 4, 1)
-- INSERT INTO usuarios (nombres,apellidoPaterno,apellidoMaterno, matricula, contraseña, idDependencias, idRoles)
-- VALUES ('Sonia Maria','Blazquez','Prados', 4089271, '&3^uGL2', 5, 2)

-- Considera que en la fecha esta YYYYMMDD HH:MM de acuerdo a
-- https://learn.microsoft.com/en-us/sql/t-sql/data-types/datetime-transact-sql?view=sql-server-ver16
INSERT INTO eventos (nombre, fecha, idSedes, idDependencias)
VALUES ('Orquesta Sinfonica #23', '20221210 15:30:00', 3, 2)
INSERT INTO eventos (nombre, fecha, idSedes, idDependencias)
VALUES ('Orquesta Sinfonica #24', '20231210 15:45:00', 3, 2)
INSERT INTO eventos (nombre, fecha, idSedes, idDependencias)
VALUES ('Confrencia Mate Salud', '20231101 08:15:00', 1, 1)
INSERT INTO eventos (nombre, fecha, idSedes, idDependencias)
VALUES ('Exposicion Robotica #1', '20231128 18:00:00', 4, 3)

-- Los valores de idEventos pueden cambiar ya que en la base de datos actual,
-- no existen los campos 3, 5, 6, 7, 8 por errores en la base de datos local
INSERT INTO asistenciaInvitados (asistencia, idInvitados, idInvitados) VALUES  (1, 1, 1)
INSERT INTO asistenciaInvitados (asistencia, idInvitados, idInvitados) VALUES  (1, 2, 1)
INSERT INTO asistenciaInvitados (asistencia, idInvitados, idInvitados) VALUES  (0, 1, 2)
INSERT INTO asistenciaInvitados (asistencia, idInvitados, idInvitados) VALUES  (1, 2, 2)
INSERT INTO asistenciaInvitados (asistencia, idInvitados, idInvitados) VALUES  (1, 3, 2)
INSERT INTO asistenciaInvitados (asistencia, idInvitados, idInvitados) VALUES  (1, 2, 4)
INSERT INTO asistenciaInvitados (asistencia, idInvitados, idInvitados) VALUES  (1, 3, 4)
INSERT INTO asistenciaInvitados (asistencia, idInvitados, idInvitados) VALUES  (0, 3, 9)

INSERT INTO boletos (codigoBarras, idEventos) VALUES (15125212,1)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (13225212,1)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (15122312,1)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (15658522,1)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (15138959,1)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (24726212,2)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (32727212,2)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (23525312,2)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (10032502,2)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (15474759,2)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (54737352,2)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (15265462,2)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (24624639,2)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (57324639, 4)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (86824639, 4)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (97724639, 4)
INSERT INTO boletos (codigoBarras, idEventos) VALUES (11114634, 9)