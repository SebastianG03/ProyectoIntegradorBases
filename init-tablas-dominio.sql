-- Catálogo PAÍSES
CREATE TABLE dbo.Paises(
    Id INT IDENTITY,
    Nombre NVARCHAR(10)
);

-- Tabla PERSONAS
-- Contiene a todas las personas
-- relacionadas con el hotel:
-- huéspedes, personal y guías
-- turísticos
CREATE TABLE dbo.Personas(
    -- Cédula de identidad
    Id NVARCHAR(10) IDENTITY,
    Nombre NVARCHAR(10),
    Apellido NVARCHAR(10),
    -- Se utilizará la fecha de nacimiento para
    -- calcular la edad de la persona
    FechaNacimiento DATE,
    IdPaisOrigen INT,

    -- Llaves foráneas
    FOREIGN KEY (IdPaisOrigen)
    REFERENCES Paises(Id)
);

-- Tabla HUESPEDES
-- Contiene a todos los huéspedes
-- del hotel
CREATE TABLE dbo.Huespedes(
    Id INT IDENTITY,
    -- Para acceder a la información
    -- personal del huesped
    IdPersona INT,
    -- En el caso de que el huesped
    -- sea un acompañante o un menor de edad
    -- este campo debe ser diferente de NULL
    IdAnfitrion NVARCHAR(10) DEFAULT NULL

    -- Llaves Foráneas
    FOREIGN KEY (IdPersona)
    REFERENCES Personas(Id)
    FOREIGN KEY (IdAnfitrion)
    REFERENCES Huespedes(Id)
);

-- Catálogo CARGOS
-- Contiene todos los cargos
-- disponibles en el hotel
CREATE TABLE dbo.Cargos(
    Id INT IDENTITY,
    Nombre NVARCHAR(10) NOT NULL,
    EspaciosDisponibles TINYINT NOT NULL
);

-- Tabla PERSONAL
-- Contiene a todo el personal
-- contratado por el hotel
CREATE TABLE dbo.Personal(
    Id INT IDENTITY,
    -- Para acceder a la información
    -- personal del empleado
    IdPersona INT,
    IdCargo INT,
    AniosExperiencia TINYINT,
    NivelEducacion VARCHAR(50),
    Especialidad VARCHAR(50),
    IdiomaMaterno VARCHAR(50),
    Salario DECIMAL(4,2)

    -- Llaves Foráneas
    FOREIGN KEY (IdPersona)
    REFERENCES Personas(Id)
    FOREIGN KEY (IdCargo)
    REFERENCES Cargos(Id)
);

-- Variables que pueden ser calculadas con un STORE PROCEDURE:
-- 1. Edad de la persona