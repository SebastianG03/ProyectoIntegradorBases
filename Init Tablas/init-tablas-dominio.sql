-- Catálogo PAÍSES
CREATE TABLE dbo.Paises(
    Id INT IDENTITY,
    -- El nombre del país no puede ser NULL
    Nombre NVARCHAR(50) NOT NULL

    -- REESTRICCIONES:
        -- Llave Principal
    CONSTRAINT PK_Pais PRIMARY KEY(Id)
        -- El nombre del país no puede estar vacío
    CONSTRAINT CK_NombrePais CHECK (Nombre != '')
);

-- Tabla PERSONAS
-- Contiene a todas las personas relacionadas con el hotel:
-- huéspedes, personal y guías turísticos
CREATE TABLE dbo.Personas(
    -- Cédula de identidad de la persona
    Id NVARCHAR(11), -- Limitada a 11 carácteres
    -- El nombre de la persona no puede ser NULL
    Nombre NVARCHAR(10) NOT NULL,
    -- El apellido de la persona no puede ser NULL
    Apellido NVARCHAR(10) NOT NULL,
    -- * Se utilizará la fecha de nacimiento para calcular la edad de la persona *
    -- La fecha de nacimiento no puede ser NULL
    FechaNacimiento DATE NOT NULL,
    -- El país de origen no puede ser NULL
    IdPaisOrigen INT NOT NULL

    -- REESTRICCIONES
        -- Llave Principal
    CONSTRAINT PK_Persona PRIMARY KEY(Id),
        -- El nombre de la persona no puede estar vacío
    CONSTRAINT CK_NombrePersona CHECK (Nombre != ''),
        -- El apellido de la persona no puede estar vacío
    CONSTRAINT CK_ApellidoPersona CHECK (Apellido != ''),
        -- La fecha de nacimiento debe ser menor a la fecha actual
    CONSTRAINT CK_FechaNacimiento CHECK (FechaNacimiento < GETDATE()),
    -- Llaves Foráneas
    FOREIGN KEY (IdPaisOrigen) REFERENCES Paises(Id)
);

-- Tabla HUESPEDES
-- Contiene a todos los huéspedes del hotel
CREATE TABLE dbo.Huespedes(
    Id INT IDENTITY,
    -- * Para acceder a la información personal del huesped *
    -- La relación entre PERSONA-HUESPED no puede ser NULL
    IdPersona NVARCHAR(11) NOT NULL,
    -- * En el caso de que el huesped sea un acompañante o un menor de edad *
    IdAnfitrion INT NULL,

    -- REESTRICCIONES
        -- Llave Principal
    CONSTRAINT PK_Huesped PRIMARY KEY(Id),
    -- Llaves Foráneas
    FOREIGN KEY (IdPersona) REFERENCES Personas(Id),
    FOREIGN KEY (IdAnfitrion) REFERENCES Huespedes(Id)
);

-- Catálogo CARGOS
-- Contiene todos los cargos disponibles en el hotel
CREATE TABLE dbo.Cargos(
    Id INT IDENTITY,
    -- El nombre del cargo no puede ser NULL
    Nombre NVARCHAR(10) NOT NULL,
    EspaciosDisponibles TINYINT

    -- REESTRICCIONES
        -- Llave Principal
    CONSTRAINT PK_Cargo PRIMARY KEY(Id),
        -- El nombre del cargo no puede estar vacío
    CONSTRAINT CK_NombreCargo CHECK (Nombre != ''),
        -- Los espacios disponibles deben ser mayor a 0
    CONSTRAINT CK_EspaciosDisponibles CHECK (EspaciosDisponibles > 0)
);

-- Catálogo NIVELES DE EDUACIÓN
CREATE TABLE dbo.NivelesEducacion(
    Id INT IDENTITY,
    -- El nombre del nivel de educación no puede ser NULL
    Nombre NVARCHAR(20) NOT NULL

    -- REESTRICCIONES
        -- Llave Principal
    CONSTRAINT PK_NivelEducacion PRIMARY KEY(Id),
        -- El nombre del nivel de educación no puede estar vacío
    CONSTRAINT CK_NombreNivelEducacion CHECK (Nombre != '')
);

-- Tabla PERSONAL
-- Contiene a todo el personal contratado por el hotel
CREATE TABLE dbo.Personal(
    Id INT IDENTITY,
    -- * Para acceder a la información personal del empleado *
    -- La relación entre PERSONA-PERSONAL no puede ser NULL
    IdPersona NVARCHAR(11) NOT NULL,
    -- La relación entre CARGO-PERSONAL no puede ser NULL
    IdCargo INT NOT NULL,
    -- Los años de experiencia no pueden ser NULL
    AniosExperiencia TINYINT NOT NULL,
    -- El nivel de eduación no puede ser NULL
    IdNivelEducacion INT NOT NULL,
    Especialidad VARCHAR(50), -- [OPCIONAL]
    -- El idioma materno no puede ser NULL
    IdiomaMaterno VARCHAR(50) NOT NULL,
    -- El salario no puede ser NULL
    Salario DECIMAL(4,2) NOT NULL

    -- REESTRICCIONES
        -- Llave Primaria
    CONSTRAINT PK_Personal PRIMARY KEY(Id),
        -- Los años de experiencia deben ser mayor o igual a cero
    CONSTRAINT CK_AniosExperiencia CHECK (AniosExperiencia >= 0),
        -- La especialidad no puede estar vacía
    CONSTRAINT CK_Especialidad CHECK (Especialidad != ''),
        -- El idioma materno no puede estar vacío
    CONSTRAINT CK_IdiomaMaterno CHECK (IdiomaMaterno != ''),
        -- El salario debe ser mayor a cero
    CONSTRAINT CK_Salario CHECK (Salario > 0),
    -- Llaves Foráneas
    FOREIGN KEY (IdPersona) REFERENCES Personas(Id),
    FOREIGN KEY (IdCargo) REFERENCES Cargos(Id),
    FOREIGN KEY (IdNivelEducacion) REFERENCES NivelesEducacion(Id)
);

-- Variables que pueden ser calculadas con un STORE PROCEDURE:
-- 1. Edad de la persona