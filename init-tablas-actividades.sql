-- Tabla GUIAS
-- Contiene todos los guías
-- que ha contratado el hotel
CREATE TABLE Guias(
    Id INT IDENTITY,
    -- Para acceder a la información
    -- de dominio del guía turítico
    IdPersonal INT,
    SegundaLengua NVARCHAR(10),

    -- Llaves foráneas
    FOREIGN KEY (IdPersonal)
    REFERENCES Personal(Id)
);

-- Tabla ACTIVIDADES
-- Contiene todas las actividades
-- que ofrece el hotel
CREATE TABLE Actividades(
    Id INT IDENTITY,
    Nombre NVARCHAR(10),
    CuposDisponibles TINYINT
);