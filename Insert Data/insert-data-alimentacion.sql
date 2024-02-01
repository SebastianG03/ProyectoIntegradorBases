-- Agrega información en la tabla TIPO-ALIMENTO
INSERT INTO dbo.TiposAlimentos (Nombre) VALUES
('Buffet'),
('Entrada'),
('Plato fuerte'),
('Postre')

-- Agrega información en la tabla ALIMENTOS
INSERT INTO dbo.Alimentos (Nombre, IdTipo, Receta, UnidadesPorReceta) VALUES
-- Alimentos tipo Buffet
('Arroz blanco', 1, 'Arroz cocido al vapor', 20),
('Pollo a la brasa', 1, 'Pollo marinado y asado lentamente', 12),
('Papas fritas', 1, 'Papas cortadas y fritas hasta dorar', 15),
('Ensalada de frutas', 1, 'Frutas variadas cortadas en trozos', 8),
('Pasta al pesto', 1, 'Pasta con salsa pesto y tomates cherry', 18),
-- Alimentos tipo Entrada
('Sopa de tomate', 2, 'Sopa de tomate casera con hierbas frescas.', 2),
('Ceviche de camarón', 2, 'Ceviche fresco de camarón con limón, cebolla, y cilantro.', 6),
('Gazpacho', 2, 'Sopa fría de tomate, pepino, pimiento, cebolla y ajo.', 7),
('Rollitos de primavera', 2, 'Rollitos de primavera rellenos de vegetales y camarones, servidos con salsa agridulce.', 18),
('Sushi variado', 2, 'Selección de sushi fresco con variedad de pescados y mariscos.', 20),
-- Alimentos tipo Plato fuerte
('Lasaña', 3, 'Lasaña de carne con salsa de tomate y queso gratinado.', 4),
('Salmón a la parrilla', 3, 'Salmón fresco marinado y cocido a la parrilla.', 3),
('Pollo al horno', 3, 'Muslos de pollo marinados al horno con hierbas mediterráneas.', 5),
('Arroz con pollo', 3, 'Arroz cocido con trozos de pollo y verduras.', 6),
('Pasta Alfredo', 3, 'Pasta cocida con salsa Alfredo cremosa y parmesano rallado.', 3),
-- Alimentos tipo Postre
('Tarta de queso', 4, 'Tarta de queso horneada con una base de galleta y cubierta de frutos rojos.', 1),
('Crepas de chocolate', 4, 'Crepas rellenas de chocolate y servidas con salsa de frambuesa.', 8),
('Helado de vainilla', 4, 'Helado cremoso de vainilla con salsa de caramelo y nueces.', 10),
('Fruta fresca', 4, 'Selección de frutas de temporada cortadas y servidas.', 12),
('Mousse de chocolate', 4, 'Mousse de chocolate ligero y aireado, decorado con virutas de chocolate.', 9)
