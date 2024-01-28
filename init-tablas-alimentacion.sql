-- Tabla PROVEEDORES
-- Contiene a todos los proveedores
-- de ingredientes
CREATE TABLE dbo.Proveedores(
    Id INT IDENTITY,
    Nombre NVARCHAR(10),
    TiempoRespuesta DECIMAL(4,2)
);

-- Tabla INGREDIENTES
-- Contiene todos los ingredientes
-- necesarios para preparar las 
-- comidas que ofrece el hotel
CREATE TABLE dbo.Ingredientes(
    Id INT IDENTITY,
    Nombre NVARCHAR(10),
    IdProveedor INT,
    -- Número de unidades disponibles
    -- en stock
    UnidadesDisponibles INT

    -- Llaves foráneas
    FOREIGN KEY (IdProveedor)
    REFERENCES Proveedores(Id)
);

-- Tabla COMIDAS
-- Contiene todas las comidas
-- que conforman los menús que ofrece
-- el hotel
CREATE TABLE dbo.Comidas(
    Id INT IDENTITY,
    Nombre NVARCHAR(10),
    -- Describe la preparación de la comida
    Receta TEXT,
    -- Número de unidades que se
    -- obtiene por cada receta
    UnidadesPorReceta INT
);

-- Tabla MENUS
-- Contiene todos los menus que ofrece
-- el hotel
CREATE TABLE dbo.Menus(
    Id INT IDENTITY,
    Precio DECIMAL(4,2)
);

-- Cada comida se conforma de uno
-- a varios ingredientes y cada ingrediente
-- puede pertenecer a una o varias comidas

-- Tabla de ruptura INGREDIENTE-COMIDA
CREATE TABLE dbo.IngredienteComida(
    Id INT IDENTITY,
    IdIngrediente INT,
    IdComida INT

    -- Llaves foráneas
    FOREIGN KEY (IdIngrediente)
    REFERENCES Ingredientes(Id)
    FOREIGN KEY (IdComida)
    REFERENCES Comidas(Id)
);

-- Cada menú se compone de una o varias
-- comidas y cada comida puede pertenecer
-- a uno o varios menús

-- Tabla de ruptura COMIDA-MENÚ
CREATE TABLE dbo.ComidaMenu(
    Id INT IDENTITY,
    IdComida INT,
    IdMenu INT,
    -- Cantidad de cada comida
    Cantidad INT

    -- Llaves foráneas
    FOREIGN KEY (IdComida)
    REFERENCES Comidas(Id)
    FOREIGN KEY (IdMenu)
    REFERENCES Menus(Id)
);