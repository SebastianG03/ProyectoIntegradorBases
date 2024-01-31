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
    DECLARE @tickets INT

    SELECT @tickets = tickets
    FROM Citas c
    JOIN inserted ON inserted.IdActividad = c.IdActividad 
    WHERE c.IdActividad = inserted.IdActividad

    IF (@tickets >= (SELECT Capacidad FROM Actividades WHERE Id = inserted.IdActividad))
    BEGIN
	    UPDATE Actividades
        SET Capacidad = Capacidad - tickets
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
