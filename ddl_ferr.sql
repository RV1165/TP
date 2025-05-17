-- Tabla: marca
CREATE TABLE marca (
    marca_cod SERIAL PRIMARY KEY,
    nombre_marca VARCHAR(255) NOT NULL,
    pais_origen VARCHAR(255)
);

-- Tabla: cantidad
CREATE TABLE cantidad (
    id_cantidad SERIAL PRIMARY KEY,
    und_medida VARCHAR(50),
    unidades INTEGER
);

-- Tabla: stock
CREATE TABLE stock (
    id_stock SERIAL PRIMARY KEY,
    disponible INTEGER,
    pasillo VARCHAR(50),
    lugar VARCHAR(50)
);

-- Tabla: categoria
CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nombre_cod VARCHAR(255) NOT NULL,
    descripcion TEXT,
    id_marca INTEGER NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES marca(marca_cod) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabla: productos
CREATE TABLE productos (
    produc_cod SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    precio_unitario DECIMAL(10,2),
    precio_iva DECIMAL(10,2),
    id_stock INTEGER NOT NULL,
    id_marca INTEGER NOT NULL,
    id_categoria INTEGER NOT NULL,
    id_cantidad INTEGER NOT NULL,
    FOREIGN KEY (id_stock) REFERENCES stock(id_stock) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_marca) REFERENCES marca(marca_cod) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_cantidad) REFERENCES cantidad(id_cantidad) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabla: usuario
CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre_usuario VARCHAR(255),
    contraseña VARCHAR(255)
);

-- Tabla: cliente
CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    telefono VARCHAR(50),
    direccion TEXT,
    id_usuario INTEGER NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabla: ventas
CREATE TABLE ventas (
    id_ventas SERIAL PRIMARY KEY,
    fecha DATE,
    total DECIMAL(10,2),
    tipo_pago VARCHAR(50),
    estado VARCHAR(50),
    id_usuario INTEGER NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabla: detalle_ventas
CREATE TABLE detalle_ventas (
    id_detalle SERIAL PRIMARY KEY,
    venta_cod INTEGER NOT NULL,
    producto_cod INTEGER NOT NULL,
    cantidad INTEGER,
    precio_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (venta_cod) REFERENCES ventas(id_ventas) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (producto_cod) REFERENCES productos(produc_cod) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabla: compra
CREATE TABLE compra (
    id_compra SERIAL PRIMARY KEY,
    fecha_compra DATE,
    total DECIMAL(10,2),
    estado VARCHAR(50)
);

-- Tabla: detalle_compra
CREATE TABLE detalle_compra (
    id_detalle SERIAL PRIMARY KEY,
    producto_cod INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    precio_unitario DECIMAL(10,2),
    id_compra INTEGER NOT NULL,
    FOREIGN KEY (producto_cod) REFERENCES productos(produc_cod) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_compra) REFERENCES compra(id_compra) ON DELETE RESTRICT ON UPDATE CASCADE
);