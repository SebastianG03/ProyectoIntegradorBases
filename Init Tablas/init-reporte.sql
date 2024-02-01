CREATE TABLE dbo.Desalojo(
    Id INT IDENTITY,
    -- La relación entre HUESPED-DESALOJO no debe ser NULL
    IdHuesped INT NOT NULL,
    -- El motivo del desalojo no puede ser NULL
    Motivo VARCHAR(50) NOT NULL,
    FechaDeDesalojo DATETIME,
    -- REESTRICCIONES
        -- Llave Principal
    CONSTRAINT PK_Desalojo PRIMARY KEY(Id),
        -- El motivo del desalojo no puede estar vacío
    CONSTRAINT CK_MotivoDesalojo CHECK (Motivo != ''),
    -- Llaves Foráneas
    FOREIGN KEY (IdHuesped) REFERENCES dbo.Huespedes(Id)
);