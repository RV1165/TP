-- Marca
INSERT INTO marca (nombre_marca, pais_origen) VALUES
('Truper', 'México'),
('Stanley', 'EE.UU.'),
('Bosch', 'Alemania');

-- Cantidad
INSERT INTO cantidad (und_medida, unidades) VALUES
('Unidad', 1),
('Caja', 10),
('Paquete', 25);

-- Stock
INSERT INTO stock (disponible, pasillo, lugar) VALUES
(100, 'A1', 'Estante 1'),
(50, 'B2', 'Estante 4'),
(200, 'C3', 'Almacén');

-- Categoría
INSERT INTO categoria (nombre_cod, descripcion, id_marca) VALUES
('Herramientas Manuales', 'Martillos, destornilladores, llaves', 1),
('Eléctricas', 'Taladros, amoladoras, sierras eléctricas', 3),
('Pintura', 'Pinturas, brochas, rodillos', 2);

-- Productos
INSERT INTO productos (nombre, precio_unitario, precio_iva, id_stock, id_marca, id_categoria, id_cantidad) VALUES
('Martillo de acero', 8.50, 10.21, 1, 1, 1, 1),
('Taladro inalámbrico', 55.00, 66.55, 2, 3, 2, 1),
('Pintura blanca 1L', 12.00, 14.28, 3, 2, 3, 2);

-- Usuarios
INSERT INTO usuario (nombre_usuario, contraseña) VALUES
('admin', 'admin123'),
('vendedor1', 'ventas2025');

-- Clientes
INSERT INTO cliente (nombre, telefono, direccion, id_usuario) VALUES
('Carlos Pérez', '987654321', 'Av. Central 123', 1),
('Lucía Gómez', '912345678', 'Calle Real 456', 2);

-- Ventas
INSERT INTO ventas (fecha, total, tipo_pago, estado, id_usuario) VALUES
('2025-05-15', 76.76, 'Efectivo', 'Completado', 2),
('2025-05-16', 14.28, 'Tarjeta', 'Pendiente', 1);

-- Detalle de ventas
INSERT INTO detalle_ventas (venta_cod, producto_cod, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 1, 10.21, 10.21),
(1, 2, 1, 66.55, 66.55),
(2, 3, 1, 14.28, 14.28);

-- Compras
INSERT INTO compra (fecha_compra, total, estado) VALUES
('2025-05-10', 150.00, 'Recibido'),
('2025-05-12', 250.00, 'Pendiente');

-- Detalle de compras
INSERT INTO detalle_compra (producto_cod, cantidad, precio_unitario, id_compra) VALUES
(1, 10, 8.00, 1),
(2, 5, 50.00, 1),
(3, 20, 11.00, 2);