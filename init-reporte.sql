CREATE TABLE dbo.Desalojo(
    IdHuesped INT,
    Motivo VARCHAR(50) NOT NULL,
    FechaDeDesalojo DATETIME NOT NULL DEFAULT GETDATE(),

    -- Llaves Foráneas
    FOREIGN KEY (IdHuesped) 
    REFERENCES dbo.Huespedes(Id)

    -- CONSTRAINTS
    
);