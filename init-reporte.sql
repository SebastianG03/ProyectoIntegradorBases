CREATE TABLE dbo.Desalojo(
    IdHuesped INT,
    Motivo VARCHAR(50),
    FechaDeDesalojo DATETIME,
    FOREIGN KEY (IdHuesped) REFERENCES dbo.Huespedes(IdHuesped)
);