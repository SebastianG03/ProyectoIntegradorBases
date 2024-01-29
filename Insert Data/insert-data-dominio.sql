-- Agrega información a la tabla PAISES
INSERT INTO PAISES (NombrePais) VALUES
('Estados Unidos'),
('China'),
('India'),
('Indonesia'),
('Pakistán'),
('Brasil'),
('Nigeria'),
('Bangladesh'),
('Rusia'),
('México'),
('Japón'),
('Filipinas'),
('Etiopía'),
('Egipto'),
('Vietnam'),
('República Democrática del Congo'),
('Turquía'),
('Irán'),
('Alemania'),
('Tailandia'),
('Reino Unido'),
('Francia'),
('Italia'),
('Tanzania'),
('Sudáfrica'),
('Myanmar'),
('Corea del Sur'),
('Kenia'),
('Colombia'),
('España');

-- Agrega la información a tabla de PERSONAS
INSERT INTO dbo.Personas (Id, Nombre, Apellido, FechaNacimiento, IdPaisOrigen) VALUES
('12345678901', 'Juan', 'Perez', '1990-05-15', 1),     -- Ejemplo de formato de fecha: 'YYYY-MM-DD'
('23456789012', 'Maria', 'Gomez', '1985-10-20', 2),
('34567890123', 'Pedro', 'Rodriguez', '1988-03-12', 3),
('45678901234', 'Ana', 'Lopez', '1992-07-05', 4),
('56789012345', 'Luis', 'Martinez', '1980-12-30', 5),
('67890123456', 'Laura', 'Hernandez', '1995-09-25', 6),
('78901234567', 'Carlos', 'Garcia', '1975-04-18', 7),
('89012345678', 'Sofia', 'Diaz', '1983-11-08', 8),
('90123456789', 'Diego', 'Sanchez', '1998-06-02', 9),
('01234567890', 'Marta', 'Torres', '1987-01-17', 10),
('12345098765', 'Alejandro', 'Rojas', '1991-08-11', 11),
('23450987654', 'Carmen', 'Flores', '1982-02-23', 12),
('34509876543', 'Javier', 'Santos', '1978-07-28', 13),
('45098765432', 'Elena', 'Vega', '1994-04-05', 14),
('50987654321', 'Pablo', 'Morales', '1989-09-09', 15),
('09876543210', 'Rosa', 'Iglesias', '1970-06-14', 16),
('98765432109', 'Gabriel', 'Ortega', '1986-03-19', 17),
('87654321098', 'Adriana', 'Navarro', '1993-12-22', 18),
('76543210987', 'Oscar', 'Cruz', '1979-05-07', 19),
('65432109876', 'Silvia', 'Perez', '1997-10-03', 20),
('54321098765', 'Raul', 'Alvarez', '1984-02-28', 21),
('43210987654', 'Paula', 'Molina', '1977-08-24', 22),
('32109876543', 'Mario', 'Gutierrez', '1990-11-01', 23),
('21098765432', 'Celia', 'Blanco', '1981-01-31', 24),
('10987654321', 'Jorge', 'Ramos', '1996-07-16', 25),
('21987654321', 'Fernanda', 'Castro', '1985-03-21', 26),
('32987654321', 'Arturo', 'Jimenez', '1973-09-12', 27),
('43987654321', 'Patricia', 'Serrano', '1992-04-26', 28),
('54987654321', 'Roberto', 'Duarte', '1988-12-09', 29),
('65987654321', 'Natalia', 'Delgado', '1976-06-05', 30),
('76987654321', 'Julio', 'Lara', '1993-11-30', 1),
('87987654321', 'Monica', 'Vargas', '1984-05-04', 2),
('98987654321', 'Victor', 'Reyes', '1979-02-19', 3),
('09987654321', 'Isabel', 'Pacheco', '1995-08-15', 4),
('20987654321', 'Hector', 'Guerrero', '1980-01-10', 5),
('31987654321', 'Ana', 'Montoya', '1987-04-06', 6),
('42987654321', 'David', 'Orozco', '1972-10-27', 7),
('53987654321', 'Laura', 'Mendez', '1990-03-02', 8),
('64987654321', 'Jose', 'Herrera', '1983-06-28', 9),
('75987654321', 'Diana', 'Gallego', '1998-09-23', 10),
('86987654321', 'Felipe', 'Rangel', '1971-12-18', 11),
('97987654321', 'Carolina', 'Puentes', '1986-07-13', 12),
('08987654321', 'Andres', 'Bermudez', '1994-04-07', 13),
('19987654321', 'Tatiana', 'Salazar', '1974-01-02', 14),
('30987654321', 'Roberto', 'Cortes', '1989-05-27', 15);

-- Agregar la información a la tabla HUESPEDES
INSERT INTO dbo.Huespedes (IdPersona)
SELECT TOP 30 Id
FROM dbo.Personas;

-- Agregar la información a la tabla HUESPEDES (ACOMPAÑANTES)
INSERT INTO dbo.Huespedes (IdPersona, IdAnfitrion)
SELECT TOP 15 P.Id, H.Id
FROM dbo.Personas P, dbo.Huespedes H
WHERE P.Id != H.IdPersona;