CREATE PROCEDURE requestSalt(
    @matricula int
) AS BEGIN
    SELECT usuarios.salt FROM usuarios WHERE matricula = @matricula
end

CREATE PROCEDURE requestLogin(
    @matricula int,
    @contraseña int
) AS BEGIN
    IF EXISTS(SELECT usuarios.nombres, usuarios.apellidoPaterno, usuarios.apellidoMaterno FROM usuarios where @matricula = matricula and @contraseña = contraseña)
    SELECT usuarios.nombres, usuarios.apellidoPaterno, usuarios.apellidoMaterno FROM usuarios where @matricula = matricula and @contraseña = contraseña
    SELECT boletos.codigoBarras, eventos.nombre, eventos.fecha, dependencias.nombre FROM usuarios
    INNER JOIN asistenciaUsuarios on usuarios.idUsuarios = asistenciaUsuarios.idUsuarios
    INNER JOIN boletos on asistenciaUsuarios.idBoletos = boletos.idBoletos
    INNER JOIN eventos on boletos.idEventos = eventos.idEventos
    INNER JOIN dependencias on eventos.idDependencias = dependencias.idDependencias
    WHERE @matricula = matricula
end

EXEC requestSalt 222
EXEC requestLogin 222, 123