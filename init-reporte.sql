CREATE TABLE dbo.Desalojo(
    IdHuesped INT,
    Motivo VARCHAR(50),
    FechaDeDesalojo DATETIME,

    -- Llaves Foráneas
    FOREIGN KEY (IdHuesped) 
    REFERENCES dbo.Huespedes(Id)
);