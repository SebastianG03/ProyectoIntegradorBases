-- Tabla GUIAS
-- Contiene todos los guías que ha contratado el hotel
CREATE TABLE Guias(
    Id INT IDENTITY,
    -- La relación entre PERSONAL-GUIAS no puede ser NULL
    -- Para acceder a la información de dominio del guía turítico
    IdPersonal INT NOT NULL,
    -- La segunda lengua materna del guía no puede ser NULL
    SegundaLengua NVARCHAR(10) NOT NULL
    -- REESTRICCIONES
        -- Llave Primaria
    CONSTRAINT PK_Guia PRIMARY KEY(Id)
        -- La segunda lengua materna del guía no puede estar vacía
    CONSTRAINT CK_SegundaLengua CHECK (SegundaLengua != '')
    -- Llaves Foráneas
    FOREIGN KEY (IdPersonal) REFERENCES Personal(Id)
);

-- Tabla ACTIVIDADES
-- Contiene todas las actividades que ofrece el hotel
CREATE TABLE Actividades(
    Id INT IDENTITY,
    -- El nombre de la actividad no puede ser NULL
    Nombre NVARCHAR(10) NOT NULL,
    -- La capacidad de personas no puede ser NULL
    Capacidad TINYINT NOT NULL,
    -- El precio de la actividad no puede ser NULL
    Precio DECIMAL(4,2) NOT NULL
    -- REESTRICCIONES
        -- Llave Primaria
    CONSTRAINT PK_Actividad PRIMARY KEY(Id)
        -- El nombre de la actividad no puede estar vacío
    CONSTRAINT CK_NombreActividad CHECK (Nombre != '')
        -- La capacidad de personas debe ser mayor a cero
    CONSTRAINT CK_CapacidadPersonas CHECK (Capacidad > 0)
        -- El precio de la actividad debe ser mayor a cero
    CONSTRAINT CK_PrecioActividad CHECK (Precio > 0)
);

-- Tabla ITINERARIO-ACTIVIDADES
-- Contiene el itinerario de actividades que ofrece el hotel
CREATE TABLE ItinerioActividades(
    Id INT IDENTITY,
    IdActividad INT,
    -- El intervalo de tiempo que dura la actividad no puede ser NULL
    Inicio DATETIME NOT NULL,
    Final DATETIME NOT NULL,
    -- En caso de que la actividad requiera de un guia
    IdGuiaEncargado INT,
    -- Los cupos disponibles no puedden ser NULL
    CuposDisponibles TINYINT NOT NULL
    -- REESTRICCIONES
        -- Llave Primaria
    CONSTRAINT PK_ItinerarioActividad PRIMARY KEY(Id)
        -- La realción entre GUIA-ITINERARIO ACTIVIDADES tiene como
        -- valor por defecto igual a NULL
    CONSTRAINT DF_IdGuiaEncargado DEFAULT NULL FOR IdGuiaEncargado
        -- Los cupos disponibles deben ser mayor a cero
    CONSTRAINT CK_CuposDisponibles CHECK (CuposDisponibles > 0)
    -- Llaves foráneas
    FOREIGN KEY (IdActividad) REFERENCES Actividades(Id)
    FOREIGN KEY (IdGuiaEncargado) REFERENCES Guias(Id)
);

-- Un huesped puede reservar una a varias actividades y una actividad puede
-- ser reservada por uno o varios huespedes

-- Tabla de ruptura CITAS
CREATE TABLE Citas(
    Id INT IDENTITY,
    -- La relación entre HUESPED-CITA no debe ser NULL
    IdHuesped INT NOT NULL,
    -- La relación entre ACTIVIDAD-CITA no debe ser NULL
    IdActividad INT NOT NULL
    -- REESTRICCIONES
        -- Llave Primaria
    CONSTRAINT PK_Cita PRIMARY KEY(Id)
    -- Llaves Foráneas
    FOREIGN KEY (IdHuesped) REFERENCES Huespedes(Id)
    FOREIGN KEY (IdActividad) REFERENCES ItinerarioActividades(Id)
);