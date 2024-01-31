CREATE TRIGGER insert_persona
ON dbo.Personas
AFTER INSERT
AS
BEGIN
    
    -- Verificar que la relación PERSONA-HUESPED no se repita
END;