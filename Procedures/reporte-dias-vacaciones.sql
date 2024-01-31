CREATE PROCEDURE ReporteVacaciones
    @IdPersonal INT
AS 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Personal WHERE Id = @IdPersonal)
    BEGIN
        PRINT 'El empleado con código ' + @IdPersonal + ' no existe.';
        RETURN;
    END

    DECLARE @FechaProximasVacaciones DATE
    DECLARE @DiasVacaciones INT
    DECLARE @NombreEmpleado NVARCHAR(60), @ApellidoEmpleado NVARCHAR(50)
    DECLARE @NombreCargo NVARCHAR(10)

    SELECT @NombreEmpleado = pe.Nombre, @ApellidoEmpleado = pe.Apellido, 
        @NombreCargo = c.Nombre, @DiasVacaciones = p.DiasVacaciones,
        @FechaProximasVacaciones = p.FechaAgregarVacaciones
    FROM Personal p
    JOIN Personas pe ON pe.Id = p.IdPersona 
    JOIN Cargos c ON p.IdCargo = c.Id
    WHERE p.Id = @IdPersonal 

    SET DATEFORMAT ymd

    PRINT 'Empleado: ' + @NombreEmpleado + ' ' + @ApellidoEmpleado;
    PRINT 'Cargo: ' + @NombreCargo;
    PRINT 'Días de vacaciones disponibles: ' + @DiasVacaciones;
    PRINT 'Fecha para agregar próximas vacaciones: ' + CONVERT(VARCHAR(20), @FechaProximasVacaciones, 102); -- 102: yyyy.mm.dd
END