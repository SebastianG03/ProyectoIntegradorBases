CREATE TRIGGER insert_huesped
ON dbo.Huespedes
AFTER INSERT
AS
BEGIN
    DECLARE @a INT;
    -- Verificar que la relación PERSONA-HUESPED no se repita
END;