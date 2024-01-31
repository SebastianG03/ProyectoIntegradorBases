CREATE TRIGGER insert_huesped_trigger
ON dbo.Huespedes
AFTER INSERT
AS
BEGIN
    -- Ningún huésped que sea menor de edad puede ser
    -- cliente directo del hotel, por ello debe viajar
    -- acompañado de un adulto de custodia.
    
    -- Variables que almacenarán la id del huesped y su anfitrión
	DECLARE @huesped_id NVARCHAR(11);
	DECLARE @anfitrion_id NVARCHAR(11);

	-- Obtiene la id del huesped
	SELECT
		@huesped_id = I.IdPersona
	FROM inserted I;

	-- Obtiene la id del anfitrión
	SELECT
		@anfitrion_id = H.IdPersona
	FROM inserted I
	JOIN dbo.Huespedes H ON I.IdAnfitrion = H.Id;

	-- Variables que almacenarán la edad del huesped y su anfitrión
	DECLARE @huesped_edad INT;
	DECLARE @anfitrion_edad INT

	-- Calcula la edad del huesped
	EXEC @huesped_edad = calcular_edad_persona @huesped_id;

	-- Verifica que el huésped sea mayor de edad
	IF (@huesped_edad < 18)
	BEGIN
		-- Verifica que el menor de edad tenga un adulto en custodia
		IF (@anfitrion_id IS NULL)
		BEGIN
			raiserror ('El menor de edad debe viajar acompañado de un adulto de custodia', 16, 1)
            rollback transaction
			RETURN;
		END;
		-- Verifica que el anfitrión sea un adulto [> 18 años]
		EXEC @anfitrion_edad = calcular_edad_persona @anfitrion_id;
		IF (@anfitrion_edad < 18)
		BEGIN
			raiserror ('La persona que acompaña al menor de edad debe ser un adulto', 16, 1)
            rollback transaction
			RETURN;
		END;
	END;
END;

-- elimina el trigger
IF OBJECT_ID('insert_huesped_trigger', 'P') IS NOT NULL
    DROP TRIGGER insert_huesped_trigger;

-- Pruebas
INSERT INTO dbo.Personas (Id, Nombre, Apellido, FechaNacimiento, IdPaisOrigen) VALUES
('17216242500', 'Christian', 'Jácome', '2006-06-06', 1)
INSERT INTO dbo.Personas (Id, Nombre, Apellido, FechaNacimiento, IdPaisOrigen) VALUES
('17216242501', 'Xavier', 'Jácome', '2007-07-07', 1)
INSERT INTO dbo.Huespedes (IdPersona, IdAnfitrion) VALUES
('17216242500',49)