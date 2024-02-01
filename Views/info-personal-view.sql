-- Crea un vista que contiene toda la información relevante de un empleado
CREATE VIEW info_personal_view
AS
SELECT
    P.Nombre + ' ' + P.Apellido AS 'Nombre completo', 
    P.FechaNacimiento AS 'Fecha de nacimiento',
    C.Nombre AS 'Cargo',
    Pl.AniosExperiencia AS 'Años de experiencia',
    NE.Nombre AS 'Nivel de educación',
    Pl.Especialidad AS 'Especialidad',
    Pl.DiasVacaciones AS 'Días de vacaciones',
    Pl.IdiomaMaterno AS 'Idioma materno',
    Pl.Salario AS 'Salario'
FROM dbo.Personal Pl
JOIN dbo.Personas P ON Pl.IdPersona = P.Id
JOIN dbo.Cargos C ON Pl.IdCargo = C.Id
JOIN dbo.NivelesEducacion NE ON Pl.IdNivelEducacion = NE.Id;

-- Eliminar vista
-- DROP VIEW info_personal_view;

-- SELECT * FROM info_personal_view;