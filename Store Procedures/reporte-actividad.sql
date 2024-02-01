-- Calcula la edad de una persona
CREATE PROC reporte_itinerario_actividad
    @itinerario_actividad_id INT
AS
BEGIN
	-- Variable que almacena el nombre de la actividad
	DECLARE @actividad_nombre NVARCHAR(50);
	-- Obtiene el nombre de la actividad
	SELECT
		@actividad_nombre = A.Nombre
	FROM dbo.ItinerarioActividades IA
	JOIN dbo.Actividades A ON IA.IdActividad = A.Id
	WHERE IA.Id = @itinerario_actividad_id;
	-- Muestra el nombre de la actividad
	PRINT 'Nombre de la actividad: ' + @actividad_nombre;
	PRINT '';

	-- Variable que almacena la Id del guía encargado de la actividad
	DECLARE @guia_id INT;
	-- Obtiene la id del guia
	SELECT
		@guia_id = IdGuiaEncargado
	FROM dbo.ItinerarioActividades
	WHERE Id = @itinerario_actividad_id;

	-- En el caso de que la actividad cuente con un guía encargado
	IF (@guia_id IS NOT NULL)
	BEGIN
		-- Variables que almacenan información importante del guía
		DECLARE @guia_nombre NVARCHAR(10);
		DECLARE @guia_apellido NVARCHAR(10);
		DECLARE @guia_anios_experiencia INT;
		DECLARE @guia_idioma_materno VARCHAR(50);
		DECLARE @guia_segunda_lengua NVARCHAR(10);
		-- Obtiene la información del guía
		SELECT 
			@guia_nombre = P.Nombre,
			@guia_apellido = P.Apellido,
			@guia_anios_experiencia = Pl.AniosExperiencia,
			@guia_idioma_materno = Pl.IdiomaMaterno,
			@guia_segunda_lengua = G.SegundaLengua
		FROM dbo.Guias G
		JOIN dbo.Personal Pl ON G.IdPersonal = Pl.Id
		JOIN dbo.Personas P ON Pl.IdPersona = P.Id
		WHERE G.Id = @guia_id;
		-- Muestra la información del guía
		PRINT 'Información del guía encargado: '
		PRINT 'Nombre: ' + @guia_nombre + ' ' + @guia_apellido;
		PRINT 'Años de experiencia: ' + CAST(@guia_anios_experiencia AS NVARCHAR(2));
		PRINT 'Idioma materno: ' + @guia_idioma_materno;
		PRINT 'Segunda lengua: ' + @guia_segunda_lengua;
		PRINT '';
	END;

	PRINT 'Información de los huéspedes que participarán en la actividad: '

	-- Variables que almacenan la información de cada huésped
	DECLARE @huesped_nombre NVARCHAR(10);
	DECLARE @huesped_apellido NVARCHAR(10);

	-- Declara el cursor
	DECLARE huespedes_cursor CURSOR FOR
	-- Define información de cada huésped
	SELECT DISTINCT
		P.Nombre,
		P.Apellido
	FROM dbo.Citas C
	JOIN dbo.Huespedes H ON C.IdHuesped = H.Id
	JOIN dbo.Personas P ON H.IdPersona = P.Id
	WHERE C.IdActividad = @itinerario_actividad_id
	GROUP BY P.Nombre, P.Apellido;

	OPEN huespedes_cursor;
	-- Lleva a cabo la primera busqueda.  
	FETCH NEXT FROM huespedes_cursor 
	INTO 
		@huesped_nombre,
		@huesped_apellido
	
	-- Verifica @@FETCH_STATUS para ver si hay más filas para recuperar. 
	WHILE @@FETCH_STATUS = 0  
	BEGIN   
		-- Muestra los datos del huésped
		PRINT @huesped_nombre + ' ' + @huesped_apellido;

		-- Selecciona la siguiente fila 
		FETCH NEXT FROM huespedes_cursor 
		INTO 
			@huesped_nombre,
			@huesped_apellido
	END;
	
	CLOSE huespedes_cursor;  
	DEALLOCATE huespedes_cursor; 
END;

-- eliminar store procedure
IF OBJECT_ID ( 'reporte_itinerario_actividad', 'P' ) IS NOT NULL
	DROP PROC  reporte_itinerario_actividad;

-- ejecutar store procedure
EXEC reporte_itinerario_actividad 3;