-- Crear base de datos
CREATE DATABASE hotel_amazonas;
GO
-- Eliminar base de datos
IF DB_ID (N'hotel_amazonas') IS NOT NULL
BEGIN
    DROP DATABASE hotel_amazonas;
    PRINT 'La base de datos ha sido eliminada';
END
GO