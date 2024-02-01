SELECT * FROM Citas;
SELECT * FROM Actividades;
GO
DROP TRIGGER cantidad_reservas
GO

CREATE TRIGGER cantidad_reservas
ON Citas
FOR INSERT
AS
BEGIN

    SELECT *
    FROM Citas c
    JOIN inserted ON inserted.IdActividad = c.IdActividad 
    WHERE c.IdActividad = inserted.IdActividad

    IF ((SELECT Capacidad FROM Actividades WHERE Id = inserted.IdActividad) > 0)
    BEGIN
	    UPDATE Actividades
        SET Capacidad = Capacidad - 1
        FROM Actividades
        JOIN inserted ON inserted.IdActividad = Actividades.IdActividad
        WHERE Actividades.IdActividad = inserted.IdActividad
	END
	ELSE
    BEGIN
        RAISERROR ('Hay menos puestos disponibles que los solicitados para la venta', 16, 1)
        ROLLBACK TRANSACTION
	END
END
GO
