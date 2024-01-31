CREATE PROCEDURE ActualizarDiasVacaciones
AS
BEGIN
    UPDATE Personal
    SET DiasVacaciones = DiasVacaciones + 15,
        FechaAgregarVacaciones = DATEADD(YEAR, 1, FechaAgregarVacaciones)
    WHERE FechaAgregarVacaciones <= CONVERT(DATE, GETDATE());
END;