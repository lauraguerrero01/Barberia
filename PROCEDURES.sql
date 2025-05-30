USE Barberia;

-- Procedimiento para TipoDocumento
DELIMITER //
CREATE PROCEDURE Insertar_TipoDocumento (
    IN p_idTipo INT,
    IN p_nombre VARCHAR(255)
)
BEGIN
    INSERT INTO TipoDocumento (idTipo, nombre)
    VALUES (p_idTipo, p_nombre);
END //
DELIMITER ;

-- Procedimiento para Cliente
DELIMITER //
CREATE PROCEDURE Insertar_Cliente (
    IN p_numdoc INT,
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_telefono VARCHAR(20),
    IN p_correo VARCHAR(100),
    IN p_idTipoDoc INT
)
BEGIN
    INSERT INTO Cliente (numdoc, nombre, apellido, telefono, correo, idTipoDoc)
    VALUES (p_numdoc, p_nombre, p_apellido, p_telefono, p_correo, p_idTipoDoc);
END //
DELIMITER ;

-- Procedimiento para Barbero
DELIMITER //
CREATE PROCEDURE Insertar_Barbero (
    IN p_numdoc INT,
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_idTipoDoc INT
)
BEGIN
    INSERT INTO Barbero (numdoc, nombre, apellido, idTipoDoc)
    VALUES (p_numdoc, p_nombre, p_apellido, p_idTipoDoc);
END //
DELIMITER ;

-- Procedimiento para Estado_Cita
DELIMITER //
CREATE PROCEDURE Insertar_EstadoCita (
    IN p_estado BIT,
    IN p_descripcion VARCHAR(30)
)
BEGIN
    INSERT INTO Estado_Cita (estado, descripcion)
    VALUES (p_estado, p_descripcion);
END //
DELIMITER ;

-- Procedimiento para Cita
DELIMITER //
CREATE PROCEDURE Insertar_Cita (
    IN p_fechaYhora DATETIME,
    IN p_idEstadoCita INT,
    IN p_idCliente INT,
    IN p_idBarbero INT
)
BEGIN
    INSERT INTO Cita (fechaYhora, idEstadoCita, idCliente, idBarbero)
    VALUES (p_fechaYhora, p_idEstadoCita, p_idCliente, p_idBarbero);
END //
DELIMITER ;

-- Procedimiento para Servicio
DELIMITER //
CREATE PROCEDURE Insertar_Servicio (
    IN p_nombre VARCHAR(50),
    IN p_precio DECIMAL(7,2),
    IN p_imagen VARCHAR(255),
    IN p_idCita INT
)
BEGIN
    INSERT INTO Servicio (nombre, precio, imagen, idCita)
    VALUES (p_nombre, p_precio, p_imagen, p_idCita);
END //
DELIMITER ;

-- Procedimiento para Factura
DELIMITER //
CREATE PROCEDURE Insertar_Factura (
    IN p_fechaYhora DATETIME,
    IN p_subtotal DECIMAL(7,2),
    IN p_impuestos DECIMAL(7,2),
    IN p_totalFactura DECIMAL(7,2),
    IN p_idCliente INT
)
BEGIN
    INSERT INTO Factura (fechaYhora, subtotal, impuestos, totalFactura, idCliente)
    VALUES (p_fechaYhora, p_subtotal, p_impuestos, p_totalFactura, p_idCliente);
END //
DELIMITER ;

-- Procedimiento para Categorias
DELIMITER //
CREATE PROCEDURE Insertar_Categoria (
    IN p_idCategoria INT,
    IN p_nombre VARCHAR(30)
)
BEGIN
    INSERT INTO Categorias (idCategoria, nombre)
    VALUES (p_idCategoria, p_nombre);
END //
DELIMITER ;

-- Procedimiento para Producto
DELIMITER //
CREATE PROCEDURE Insertar_Producto (
    IN p_nombre VARCHAR(50),
    IN p_precio DECIMAL(7,2),
    IN p_imagen VARCHAR(255)
)
BEGIN
    INSERT INTO Producto (nombre, precio, imagen)
    VALUES (p_nombre, p_precio, p_imagen);
END //
DELIMITER ;

-- Procedimiento para Categorias_Producto (tabla intermedia)
DELIMITER //
CREATE PROCEDURE Insertar_CategoriasProducto (
    IN p_idCategoria INT,
    IN p_idProducto INT
)
BEGIN
    INSERT INTO Categorias_Producto (idCategoria, idProducto)
    VALUES (p_idCategoria, p_idProducto);
END //
DELIMITER ;