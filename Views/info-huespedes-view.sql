-- Crea un vista que contiene toda la información relevante de un huésped
CREATE VIEW info_huespedes_view
AS
SELECT
    P.Nombre + ' ' + P.Apellido AS 'Nombre completo', 
    P.FechaNacimiento AS 'Fecha de nacimiento',
    Ps.Nombre AS 'País de origen'
FROM dbo.Huespedes H
JOIN dbo.Personas P ON H.IdPersona = P.Id
JOIN dbo.Paises Ps ON P.IdPaisOrigen = Ps.Id;

-- Eliminar vista
-- DROP VIEW info_huespedes_view;

-- SELECT * FROM info_huespedes_view;