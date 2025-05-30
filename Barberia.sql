DROP DATABASE IF EXISTS barberia;
CREATE DATABASE Barberia;

USE Barberia;

CREATE TABLE TipoDocumento (
    idTipo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    PRIMARY KEY (idTipo)
);

CREATE TABLE Cliente (
    idCliente INT NOT NULL AUTO_INCREMENT,
    numdoc INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    idTipoDoc INT NOT NULL,
    PRIMARY KEY (idCliente)
);

CREATE TABLE Barbero (
    idBarbero INT NOT NULL AUTO_INCREMENT,
    numdoc INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    idTipoDoc INT NOT NULL,
    PRIMARY KEY (idBarbero)
);

CREATE TABLE Cita (
    idCita INT NOT NULL AUTO_INCREMENT,
    fechaYhora DATETIME NOT NULL,
    idEstadoCita INT NOT NULL,
    idCliente INT NOT NULL,
    idBarbero INT NOT NULL,
    PRIMARY KEY (idCita)
);

CREATE TABLE Estado_Cita (
    idEstadoCita INT NOT NULL AUTO_INCREMENT,
    estado BIT NOT NULL,
    descripcion VARCHAR(30) NOT NULL,
    PRIMARY KEY (idEstadoCita)
);

CREATE TABLE Servicio (
    idServicio INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(7,2) NOT NULL,
    imagen VARCHAR(255) NOT NULL,
    idCita INT NOT NULL,
    PRIMARY KEY (idServicio)
);

CREATE TABLE Factura (
    idFactura INT NOT NULL AUTO_INCREMENT,
    fechaYhora DATETIME NOT NULL,
    subtotal DECIMAL(7,2) NOT NULL,
    impuestos DECIMAL(7,2) NOT NULL,
    totalFactura DECIMAL(7,2) NOT NULL,
    idCliente INT NOT NULL,
    PRIMARY KEY (idFactura)
);

CREATE TABLE Categorias (
    idCategoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    PRIMARY KEY (idCategoria)
);

CREATE TABLE Producto (
    idProducto INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(7,2) NOT NULL,
    imagen VARCHAR(255) NOT NULL,
    PRIMARY KEY (idProducto)
);

CREATE TABLE Servicio_Factura (
    idServicio INT NOT NULL,
    idFactura INT NOT NULL,
    PRIMARY KEY (idServicio, idFactura)
);

CREATE TABLE Producto_Factura (
    idProducto INT NOT NULL,
    idFactura INT NOT NULL,
    PRIMARY KEY (idProducto, idFactura)
);

CREATE TABLE Categorias_Producto (
    idCategoria INT NOT NULL,
    idProducto INT NOT NULL,
    PRIMARY KEY (idCategoria, idProducto)
);

ALTER TABLE Cliente
ADD CONSTRAINT FK_TipoDocumento_Cliente
FOREIGN KEY (idTipoDoc) REFERENCES TipoDocumento (idTipo);

ALTER TABLE Barbero
ADD CONSTRAINT FK_TipoDocumento_Barbero
FOREIGN KEY (idTipoDoc) REFERENCES TipoDocumento (idTipo);

ALTER TABLE Cita
ADD CONSTRAINT FK_EstadoCita_Cita
FOREIGN KEY (idEstadoCita) REFERENCES Estado_Cita (idEstadoCita);

ALTER TABLE Cita
ADD CONSTRAINT FK_Cliente_Cita
FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente);

ALTER TABLE Cita
ADD CONSTRAINT FK_Barbero_Cita
FOREIGN KEY (idBarbero) REFERENCES Barbero (idBarbero);

ALTER TABLE Servicio
ADD CONSTRAINT FK_Cita_Servicio
FOREIGN KEY (idCita) REFERENCES Cita (idCita);

ALTER TABLE Factura
ADD CONSTRAINT FK_Cliente_Factura
FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente);

ALTER TABLE Producto_Factura
ADD CONSTRAINT FK_ProductoFactura_Producto
FOREIGN KEY (idProducto) REFERENCES Producto (idProducto),
ADD CONSTRAINT FK_ProductoFactura_Factura
FOREIGN KEY (idFactura) REFERENCES Factura (idFactura);

ALTER TABLE Servicio_Factura
ADD CONSTRAINT FK_ServicioFactura_Servicio
FOREIGN KEY (idServicio) REFERENCES Servicio (idServicio),
ADD CONSTRAINT FK_ServicioFactura_Factura
FOREIGN KEY (idFactura) REFERENCES Factura (idFactura);

ALTER TABLE Categorias_Producto
ADD CONSTRAINT FK_CategoriasProducto_Categoria
FOREIGN KEY (idCategoria) REFERENCES Categorias (idCategoria),
ADD CONSTRAINT FK_CategoriasProducto_Producto
FOREIGN KEY (idProducto) REFERENCES Producto (idProducto);

#DROP TABLE IF EXISTS Historial_Citas;
CREATE TABLE Historial_Citas (
    idHistorico INT AUTO_INCREMENT PRIMARY KEY,
    idCita INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    detalles TEXT,
    FOREIGN KEY (idCita) REFERENCES Cita(idCita)
    ON DELETE CASCADE
);