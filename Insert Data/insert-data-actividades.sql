-- Agrega información de la tabla GUIAS
INSERT INTO dbo.Guias (IdPersonal, SegundaLengua) VALUES
(3, 'Inglés'),
(4, 'Francés'),
(5, 'Alemán'),
(6, 'Italiano'),
(7, 'Portugués'),
(8, 'Ruso'),
(9, 'Chino'),
(10, 'Japonés'),
(11, 'Árabe'),
(12, 'Hindi');

-- Agrega información de la tabla ACTIVIDADES
INSERT INTO dbo.Actividades (Nombre, Capacidad, Precio) VALUES 
('Excursión a la jungla', 10, 50.00),
('Spa', 10, 80.00),
('Gimnasio', 30, 20.00),
('Clases de yoga', 15, 25.00),
('Paseo en bicicleta', 10, 15.00),
('Noche de cine al aire libre', 50, 10.00),
('Clases de cocina', 12, 30.00),
('Tour por la ciudad', 25, 40.00),
('Noche de música en vivo', 40, 15.00),
('Club de lectura', 20, 5.00);

-- Agrega información de la tabla ITINERARIO-ACTIVIDADES
INSERT INTO dbo.ItinerarioActividades (IdActividad, Inicio, Final, IdGuiaEncargado, CuposDisponibles) VALUES 
(1, '2024-02-01 09:00:00', '2024-02-01 09:30:00', 1, 10), -- Excursión a la jungla
(1, '2024-02-01 09:30:00', '2024-02-01 10:00:00', 2, 5), -- Excursión a la jungla
(1, '2024-02-01 10:00:00', '2024-02-01 10:30:00', 3, 6), -- Excursión a la jungla
(2, '2024-02-01 10:30:00', '2024-02-01 11:00:00', NULL, 10), -- Spa
(3, '2024-02-01 11:00:00', '2024-02-01 11:30:00', NULL, 30), -- Gimnasio
(4, '2024-02-02 11:30:00', '2024-02-02 12:00:00', NULL, 15), -- Clases de yoga
(5, '2024-02-02 12:00:00', '2024-02-02 12:30:00', NULL, 10), -- Paseo en bicicleta
(6, '2024-02-03 12:30:00', '2024-02-03 13:00:00', NULL, 50), -- Noche de cine al aire libre
(7, '2024-02-04 13:00:00', '2024-02-04 13:30:00', NULL, 12), -- Clases de cocina
(8, '2024-02-05 13:30:00', '2024-02-05 14:00:00', NULL, 25), -- Tour por la ciudad
(9, '2024-02-06 14:00:00', '2024-02-06 14:30:00', NULL, 40), -- Noche de música en vivo
(10, '2024-02-07 14:30:00', '2024-02-07 15:00:00', NULL, 20); -- Club de lectura

-- Agrega información de la tabla CITAS
INSERT INTO dbo.Citas (IdHuesped, IdActividad) VALUES 
(1, 3),
(2, 3),
(3, 3),
(4, 3)