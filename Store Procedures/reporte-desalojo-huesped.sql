-- Muestra un reporte del desalojo de un huésped del hotel.
CREATE PROCEDURE reporte_desalojo_huesped
    @huesped_id INT
AS 
BEGIN
	-- Verifica que el huésped sí fue desalojado
	IF NOT EXISTS(SELECT * FROM dbo.Desalojo WHERE IdHuesped = @huesped_id)
	BEGIN
		PRINT 'El cliente no ha sido desalojado del hotel';
		RETURN;
	END;

	PRINT 'Información del desalojo: ';
	PRINT '';

	-- Variables que almacenarán la información del huésped
	DECLARE @persona_id NVARCHAR(11);
	DECLARE @huesped_nombre NVARCHAR(10);
	DECLARE @huesped_apellido NVARCHAR(10);
	DECLARE @huesped_edad INT;
	-- Variables que almacenarán la información del desalojo
	DECLARE @desalojo_motivo NVARCHAR(50);
	DECLARE @desalojo_fecha DATETIME;

	-- Obtiene la información del huésped
	SELECT 
		@persona_id = P.Id,
		@huesped_nombre = P.Nombre,
		@huesped_apellido = P.Apellido
	FROM dbo.Huespedes H
	JOIN dbo.Personas P ON H.IdPersona = P.Id
	WHERE H.Id = @huesped_id;
	-- Calcula la edad del huésped
	EXEC @huesped_edad = calcular_edad_persona @persona_id;

	-- Muestra la información del huésped
	PRINT 'Información del huésped desalojado: ';
	PRINT 'Nombre: ' + @huesped_nombre + ' ' + @huesped_apellido;
	PRINT 'Edad: ' + CAST(@huesped_edad AS NVARCHAR(3));
	PRINT '';

	-- Obtiene la información del desalojo
	SELECT 
		@desalojo_motivo = Motivo,
		@desalojo_fecha = FechaDeDesalojo
	FROM dbo.Desalojo
	WHERE IdHuesped = @huesped_id;

	-- Muestra la información del desalojo
	PRINT 'Motivo del desalojo: ' + @desalojo_motivo;
	PRINT 'Fecha del desalojo: ' + CAST(@desalojo_fecha AS NVARCHAR(20));
	PRINT '';
END;

-- eliminar store procedure
IF OBJECT_ID ( 'reporte_desalojo_huesped', 'P' ) IS NOT NULL
	DROP PROC  reporte_desalojo_huesped;

-- ejecutar store procedure
EXEC reporte_desalojo_huesped 40;