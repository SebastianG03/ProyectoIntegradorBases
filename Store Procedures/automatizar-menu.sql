DROP PROCEDURE PlanificarMenu;

GO

CREATE PROCEDURE PlanificarMenu
AS
BEGIN
    -- Variables para almacenar la fecha actual y la fecha límite para no repetir menús en 15 días
    DECLARE @FechaActual DATE = GETDATE();
    DECLARE @FechaLimite DATE = DATEADD(DAY, -15, @FechaActual);

    -- Actualizar la fecha de uso de todos los menús a NULL si han pasado más de 15 días desde su última utilización
    UPDATE dbo.Menus
    SET Usado = NULL
    WHERE Usado < @FechaLimite;

    -- Seleccionar un menú que no haya sido utilizado en los últimos 15 días
    DECLARE @MenuId INT;

    SELECT TOP 1 @MenuId = Id
    FROM dbo.Menus
    WHERE Usado IS NULL
    ORDER BY NEWID(); -- Ordenar aleatoriamente para variar la selección

    -- Actualizar la fecha de uso del menú seleccionado a la fecha actual
    UPDATE dbo.Menus
    SET Usado = @FechaActual
    WHERE Id = @MenuId;

    -- Imprimir el menú del día
    SELECT
        Id,
        Precio,
        MenuHuesped
    FROM
        dbo.Menus
    WHERE
        Id = @MenuId;
END;

GO