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
    CuposDisponibles TINYINT,
    Precio DECIMAL(4,2)
);

-- Un huesped puede reservar una a varias
-- actividades y una actividad puede
-- ser reservada por uno o varios huespedes

-- Tabla de ruptura CITAS
CREATE TABLE Citas(
    Id INT IDENTITY,
    IdHuesped INT,
    IdActividad INT,
    -- En caso de que la actividad
    -- requiera de un guia:
    IdGuiaEncargado INT DEFAULT NULL,
    -- Para saber conocer el estado
    -- de la actividad:
    Finalizada BOOLEAN

    -- Llaves Foráneas
    FOREIGN KEY (IdHuesped)
    REFERENCES Huespedes(Id)
    FOREIGN KEY (IdActividad)
    REFERENCES Actividades(Id)
    FOREIGN KEY (IdGuiaEncargado)
    REFERENCES Guias(Id)
);