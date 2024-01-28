-- CATÁLOGO OPCIONES
-- Contiene las opciones de estancia que
-- tiene el hotel
CREATE TABLE dbo.Opciones(
    Id INT IDENTITY,
    NumeroDias INT,
    PrecioAdulto DECIMAL(4,2),
    PrecioMenorEdad DECIMAL(4,2)
);

-- TABLA RESERVACIONES
-- Contiene todas las reservaciones que
-- se han efectuado en e hotel
CREATE TABLE dbo.Reservaciones(
    Id INT IDENTITY,
    IdHuesped INT,
    IdOpcion INT,
    FechaLLegada DATETIME,

    -- Llaves Foráneas
    -- Una reservación está asociada
    -- a un solo huésped
    FOREIGN KEY (IdHuesped)
    REFERENCES Huespedes(Id),
    -- Hace referencia a la opción
    -- que eligió el huésped (no puede ser alterada)
    FOREIGN KEY (IdOpcion)
    REFERENCES Opciones(Id)
);

-- Variables que pueden ser calculadas con un STORE PROCEDURE:
-- 1. Fecha de Salida
-- 2. Número de acompañantes (Adultos y niños)
-- 3. Total de la reservación