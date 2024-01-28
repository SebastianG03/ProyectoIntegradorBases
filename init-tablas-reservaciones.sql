-- CATÁLOGO OPCIONES
-- Contiene las opciones de estancia que
-- tiene el hotel
CREATE TABLE dbo.Opciones(
    Id INT IDENTITY,
    -- El número de días no puede ser NULL
    NumeroDias INT NOT NULL,
    -- El precio por adulto no puede ser NULL
    PrecioAdulto DECIMAL(4,2) NOT NULL,
    -- El precio por menor de edad no puede ser NULL
    PrecioMenorEdad DECIMAL(4,2) NOT NULL

    -- REESTRICCIONES
        -- Llave Primaria
    CONSTRAINT PK_Opcion PRIMARY KEY(Id)
        -- El número de días debe ser mayor a cero
    CONSTRAINT CK_NumeroDias CHECK (NumeroDias > 0)
        -- El precio por adulto debe ser mayor a cero
    CONSTRAINT CK_PrecioAdulto CHECK (PrecioAdulto > 0)
        -- El precio por menor de edad debe ser mayor a cero
    CONSTRAINT CK_PrecioMenorEdad CHECK (PrecioMenorEdad > 0)
);

-- TABLA RESERVACIONES
-- Contiene todas las reservaciones que
-- se han efectuado en e hotel
CREATE TABLE dbo.Reservaciones(
    Id INT IDENTITY,
    -- La relación entre HUESPED-RESERVACION no puede ser NULL
    IdHuesped INT NOT NULL,
    -- La relación entre OPCION-RESERVACION no puede ser NULL
    IdOpcion INT NOT NULL,
    -- La fecha y hora de llegada del huesped no puede ser NULL
    FechaLLegada DATETIME NOT NULL

    -- REESTRICCIONES
        -- Llave Primaria
    CONSTRAINT PK_Reservacion PRIMARY KEY(Id)
    -- Llaves Foráneas
    -- Una reservación está asociada a un solo huésped
    FOREIGN KEY (IdHuesped) REFERENCES Huespedes(Id),
    -- Hace referencia a la opción que eligió el huésped (no puede ser alterada)
    FOREIGN KEY (IdOpcion) REFERENCES Opciones(Id)
);

-- Variables que pueden ser calculadas con un STORE PROCEDURE:
-- 1. Fecha de Salida
-- 2. Número de acompañantes (Adultos y niños)
-- 3. Total de la reservación