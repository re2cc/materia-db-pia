CREATE PROCEDURE requestSalt(
    @matricula int
) AS BEGIN
    SELECT usuarios.salt FROM usuarios WHERE matricula = @matricula
end

CREATE PROCEDURE requestLogin(
    @matricula int,
    @contraseña nvarchar(60)
) AS BEGIN
    IF EXISTS(SELECT usuarios.idUsuarios FROM usuarios WHERE @matricula = matricula AND @contraseña = contraseña)
    BEGIN
        SELECT usuarios.nombres, usuarios.apellidoPaterno, usuarios.apellidoMaterno, boletos.codigoBarras,
        asistenciaUsuarios.asistencia, eventos.nombre, eventos.fecha, dependencias.nombre FROM usuarios
            INNER JOIN asistenciaUsuarios ON usuarios.idUsuarios = asistenciaUsuarios.idUsuarios
            INNER JOIN boletos ON asistenciaUsuarios.idBoletos = boletos.idBoletos
            INNER JOIN eventos ON boletos.idEventos = eventos.idEventos
            INNER JOIN dependencias ON eventos.idDependencias = dependencias.idDependencias
            WHERE @matricula = matricula
    END
end

CREATE PROCEDURE requestCrearInvitado(
    @nombres nvarchar(50),
    @apellidoPaterno nvarchar(50),
    @apellidoMaterno nvarchar(50)
) AS BEGIN
    INSERT INTO invitados (nombres, apellidoPaterno, apellidoMaterno) VALUES (@nombres, @apellidoPaterno, @apellidoMaterno)
end

CREATE PROCEDURE requestEliminarBoletoUsuario(
    @codigoBarras int
) AS BEGIN
    DELETE asistenciaUsuarios FROM asistenciaUsuarios INNER JOIN boletos
        ON boletos.idBoletos = asistenciaUsuarios.idBoletos WHERE codigoBarras = @codigoBarras
    DELETE FROM boletos WHERE codigoBarras = @codigoBarras
end

CREATE PROCEDURE updatePassword(
    @matricula int,
    @contraseñaActual varchar(60),
    @contraseñaNueva varchar(60),
    @saltNuevo varchar(30)
) AS BEGIN
    UPDATE usuarios SET contraseña = @contraseñaNueva, salt = @saltNuevo
        WHERE matricula = @matricula AND contraseña = @contraseñaActual
end

EXEC updatePassword 100, juan, juana, aaa