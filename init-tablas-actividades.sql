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
    Nombre NVARCHAR(10) NOT NULL,
    -- Capacidad de personas
    Capacidad TINYINT NOT NULL,
    Precio DECIMAL(4,2) NOT NULL
);

-- Tabla ITINERARIO-ACTIVIDADES
-- Contiene el itinerario de
-- actividades que ofrece el hotel
CREATE TABLE ItinerioActividades(
    Id INT IDENTITY,
    IdActividad INT,
    -- Intervalo de tiempo en el que
    -- se va a realizar la actividad:
    Inicio DATETIME,
    Final DATETIME,
    -- En caso de que la actividad
    -- requiera de un guia:
    IdGuiaEncargado INT DEFAULT NULL,
    -- Los cupos disponibles deben ser
    -- menor o igual a la capacidad de 
    -- la actividad:
    CuposDisponibles TINYINT

    -- Llaves foráneas
    FOREIGN KEY (IdActividad)
    REFERENCES Actividades(Id)
    FOREIGN KEY (IdGuiaEncargado)
    REFERENCES Guias(Id)
);

-- Un huesped puede reservar una a varias
-- actividades y una actividad puede
-- ser reservada por uno o varios huespedes

-- Tabla de ruptura CITAS
CREATE TABLE Citas(
    Id INT IDENTITY,
    IdHuesped INT,
    IdActividad INT

    -- Llaves Foráneas
    FOREIGN KEY (IdHuesped)
    REFERENCES Huespedes(Id)
    FOREIGN KEY (IdActividad)
    REFERENCES ItinerarioActividades(Id)
);