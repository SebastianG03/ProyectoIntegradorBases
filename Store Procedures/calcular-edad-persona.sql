-- Calcula la edad de una persona
CREATE PROC calcular_edad_persona
    @persona_id VARCHAR(11)
AS
BEGIN
    -- Verifica que la persona sí se encuentre en los registros del hotel
	IF NOT EXISTS(SELECT * FROM dbo.Personas WHERE Id = @persona_id)
	BEGIN
		PRINT 'La persona no se encuentra en los registros del hotel.';
		RETURN;
	END;
    -- Fecha de nacimiento del huésped
    DECLARE @fecha_nacimiento DATE;

    -- Se obtiene la fecha de nacimiento del húesped
    SELECT 
        @fecha_nacimiento = P.FechaNacimiento
    FROM dbo.Personas P
	WHERE P.Id = @persona_id;

	-- Declara las variables que almacenarán la diferencia en años, días y meses
    DECLARE @diff_anios INT;
    DECLARE @diff_meses INT;
    DECLARE @diff_dias INT;

	-- Calcula la diferencia de años, días y meses entre la fecha de nacimiento
	-- y la fecha actual
    SET @diff_anios = DATEDIFF(year,@fecha_nacimiento,GETDATE());
    SET @diff_meses = DATEDIFF(month,@fecha_nacimiento,GETDATE());
    SET @diff_dias = DATEDIFF(day,@fecha_nacimiento,GETDATE());

	-- Si la diferencia de meses y días es mayor a cero
    IF (@diff_meses > 0 OR @diff_dias > 0)
    BEGIN
		-- Entonces resta la diferencia de años en uno
        SET @diff_anios = @diff_anios - 1;
    END;

	-- Devuelve la diferencia de años [edad de la persona]
    RETURN @diff_anios;
END;

-- eliminar store procedure
IF OBJECT_ID ( 'calcular_edad_persona', 'P' ) IS NOT NULL
	DROP PROC  calcular_edad_persona;

-- ejecutar store procedure
DECLARE @persona_edad INT;
EXEC @persona_edad = calcular_edad_persona '00000111123';
PRINT CAST(@persona_edad AS NVARCHAR(4));