-- Agrega información a la tabla OPCIONES
INSERT INTO dbo.Opciones (NumeroDias, PrecioAdulto, PrecioMenorEdad) VALUES
(3, 13.00, 7.00),
(4, 26.00, 14.00),
(5, 52.00, 21.00),
(7, 90.00, 28.00)

-- Agrega información a la tabla de RESERVACIONES
INSERT INTO dbo.Reservaciones (IdHuesped, IdOpcion, FechaLLegada) VALUES
(1, 1, '2024-01-31 10:30:00'),
(2, 2, '2024-01-31 10:30:00'),
(3, 3, '2024-01-31 10:30:00'),
(4, 4, '2024-01-31 10:30:00'),
(5, 1, '2024-01-31 10:30:00'),
(6, 2, '2024-01-31 10:30:00'),
(7, 3, '2024-01-31 10:30:00')