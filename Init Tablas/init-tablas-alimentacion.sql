-- Tabla PROVEEDORES
-- Contiene a todos los proveedores de ingredientes
CREATE TABLE dbo.Proveedores(
    Id INT IDENTITY,
    -- El nombre del proveedor no puede ser NULL
    Nombre NVARCHAR(10) NOT NULL,
    -- El tiempo de respuesta no puede ser NULL
    TiempoRespuesta DECIMAL(4,2) NOT NULL
    -- REESTRICCIONES
        -- Llave Primaria
    CONSTRAINT PK_Proveedor PRIMARY KEY(Id),
        -- El nombre del proveedor no puede estar vacío
    CONSTRAINT CK_NombreProveedor CHECK (Nombre != ''),
        -- El tiempo de respuesta debe ser mayor a cero
    CONSTRAINT CK_TiempoRespuesta CHECK (TiempoRespuesta > 0)
);

-- Tabla INGREDIENTES
-- Contiene todos los ingredientes necesarios para preparar las 
-- comidas que ofrece el hotel
CREATE TABLE dbo.Ingredientes(
    Id INT IDENTITY,
    -- El nombre del ingrediente no puede ser NULL
    Nombre NVARCHAR(10) NOT NULL,
    -- La relación entre PROVEEDOR-INGREDIENTE no puede ser NULL
    IdProveedor INT NOT NULL,
    -- El número de unidades disponibles no puede ser NULL
    UnidadesDisponibles INT -- "STOCK"
    -- REESTRICCIONES
        -- Llave Primaria
    CONSTRAINT PK_Ingrediente PRIMARY KEY(Id),
        -- El nombre del ingrediente no puede estar vacío
    CONSTRAINT CK_NombreIngrediente CHECK (Nombre != ''),
        -- Las unidades disponibles deben ser igual o mayor a cero
    CONSTRAINT CK_UnidadesDisponibles CHECK (UnidadesDisponibles >= 0),
    -- Llaves Foráneas
    FOREIGN KEY (IdProveedor) REFERENCES Proveedores(Id)
);

-- Catálogo TIPO-ALIMENTO
CREATE TABLE dbo.TiposAlimentos(
    Id INT IDENTITY,
    -- El nombre del tipo de alimento no puede ser NULL
    Nombre NVARCHAR(20),
    -- REESTRICCIONES
        -- Llave Primaria
    CONSTRAINT PK_TipoComida PRIMARY KEY(Id),
        -- El nombre del tipo de alimento no puede estar vacío
    CONSTRAINT CK_NombreTipoComida CHECK (Nombre != '')
);

-- Tabla ALIMENTOS
-- Contiene todas los alimentos que conforman los menús que ofrece el hotel
CREATE TABLE dbo.Alimentos(
    Id INT IDENTITY,
    -- El nombre del alimento no puede ser NULL
    Nombre NVARCHAR(10) NOT NULL,
    -- La relación entre TIPO ALIMENTO-ALIMENTO no puede ser NULL
    IdTipo INT NOT NULL,
    -- Describe la preparación de la comida [OPCIONAL]
    Receta VARCHAR(MAX),
    -- Número de unidades que se obtiene por cada receta [OPCIONAL]
    UnidadesPorReceta INT
    -- REESTRICCIONES
        -- Llave Primaria
    CONSTRAINT PK_Alimento PRIMARY KEY(Id),
        -- El nombre del alimento no puede estar vacío
    CONSTRAINT CK_NombreAlimento CHECK (Nombre != ''),
        -- La receta del alimento no puede estar vacía
    CONSTRAINT CK_RecetaAlimento CHECK (Receta != ''),
        -- Las unidades que se obtiene por receta deben ser mayor a cero
    CONSTRAINT CK_UnidadesPorReceta CHECK (UnidadesPorReceta > 0),
    -- Llaves Foráneas
    FOREIGN KEY (IdTipo) REFERENCES TiposAlimentos(Id)
);

-- Tabla MENUS
-- Contiene todos los menus que ofrece el hotel
CREATE TABLE dbo.Menus(
    Id INT IDENTITY,
    -- El precio del menú no puede ser NULL
    Precio DECIMAL(4,2) NOT NULL,
    -- Fecha de la última vez que se utilizó el menú
    Usado DATE NULL,
    -- EL diferenciador entre menú de huésped y personal no puede ser NULL
    MenuHuesped BIT NOT NULL, -- [0: Huésped], [1: Personal]
    -- REESTRICCIONES
        -- Llave Principal
    CONSTRAINT PK_Menu PRIMARY KEY(Id),
        -- El precio del menú debe ser mayor a cero
    CONSTRAINT CK_PrecioMenu CHECK (Precio > 0)
);

-- Cada alimento se conforma de uno a varios ingredientes y cada ingrediente
-- puede pertenecer a uno o varios alimentos

-- Tabla de ruptura INGREDIENTE-ALIMENTO
CREATE TABLE dbo.IngredienteAlimento(
    Id INT IDENTITY,
    -- La relación entre INGREDIENTE-INGREDIENTE ALIMENTO no puede ser NULL
    IdIngrediente INT NOT NULL,
    -- La relación entre ALIMENTO-INGREDIENTE ALIMENTO no puede ser NULL
    IdAlimento INT NOT NULL,
    -- REESTRICCIONES
        -- Llave Primaria
    CONSTRAINT PK_IngredienteAlimento PRIMARY KEY(Id),
    -- Llaves foráneas
    FOREIGN KEY (IdIngrediente) REFERENCES Ingredientes(Id),
    FOREIGN KEY (IdAlimento) REFERENCES Alimentos(Id)
);

-- Cada menú se compone de uno o varios alimentos y cada alimento puede pertenecer
-- a uno o varios menús

-- Tabla de ruptura ALIMENTO-MENÚ
CREATE TABLE dbo.AlimentoMenu(
    Id INT IDENTITY,
    -- La relación entre ALIMENTO-ALIMENTO MENÚ no puede ser NULL
    IdAlimento INT NOT NULL,
    -- La relación entre MENU-ALIMENTO MENÚ no puede ser NULL
    IdMenu INT NOT NULL,
    -- La cantidad de cada comida no puede ser NULL
    Cantidad INT NOT NULL,
    -- REESTRICCIONES
        -- Llave Primaria
    CONSTRAINT PK_AlimentoMenu PRIMARY KEY(Id),
        -- La cantidad de cada comida debe ser mayor a cero
    CONSTRAINT CK_CantidadComida CHECK (Cantidad > 0),
    -- Llaves foráneas
    FOREIGN KEY (IdAlimento) REFERENCES Alimentos(Id),
    FOREIGN KEY (IdMenu) REFERENCES Menus(Id)
);