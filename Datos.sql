 INSERT INTO TipoDocumento VALUES (1, "CC"), (2, "TI"), (3, "PAS"), (4, "CE");

INSERT INTO Cliente (numdoc, nombre, apellido, telefono, correo, idTipoDoc) 
VALUES 
(123456789, "Ana", "Pérez", 3101234567, "ana.perez@email.com", 3),
(987654321, "Carlos", "López", 3159876543, "carlos.lopez@email.com", 2),
(112233445, "Sofía", "Gómez", 3201122334, "sofia.gomez@example.org", 1),
(556677889, "Mateo", "Rodríguez", 3005566778, "mateo.r@miempresa.net", 3),
(678901234,	"Daniel", "Castro", 3167890123, "daniel.castro@mail.net", 1),
(234567890,	"Emilia", "Suárez",	3212345678,	"e.suarez@servidor.com", 2),
(789012345,	"Martín", "Díaz", 3017890123, "martin.d@unemail.edu.com", 3),
(456789012,	"Isabella",	"Ruiz",	3174567890,	"isabella.r@miorganizacion.com", 1),
(901234567,	"Samuel", "Torres",	3129012345,	"s.torres@provider.info", 2),
(334455667, "Valentina", "Vargas", 3183344556, "v.vargas@otrodominio.com", 2);

INSERT INTO Barbero (numdoc, nombre, apellido, idTipoDoc) 
VALUES 
(101010101, "Luisa", "Fernández", 1),
(202020202, "Javier", "Ramírez", 2),
(303030303, "Camila", "Sánchez", 1),
(404040404, "Andrés", "Martínez", 3),
(505050505, "Mariana", "Herrera", 2),
(606060606, "Sebastián", "Guzmán", 1),
(707070707, "Isabella", "Rojas", 2),
(808080808, "Nicolás", "Vargas", 3);


INSERT INTO Estado_Cita (estado, descripcion)
VALUES
(1, "Confirmado"),
(0, "Cancelado");

INSERT INTO Cita (fechaYhora, idEstadoCita, idCliente, idBarbero)
VALUES
("2025-05-08 14:00:00", 1, 1, 6),
("2025-05-09 08:30:00", 2, 5, 4),
("2025-05-09 16:45:00", 1, 3, 2),
("2025-05-10 10:15:00", 2, 8, 5),
("2025-05-10 15:00:00", 1, 4, 7),
("2025-05-11 09:00:00", 2, 2, 8),
("2025-05-11 17:30:00", 1, 7, 1);

INSERT INTO Servicio (nombre, precio, imagen, idCita)
VALUES
("Corte Clásico", 25.00, "/imagenes/corte_clasico.jpg", 1),
("Arreglo de Barba", 18.00, "/imagenes/arreglo_barba.png", 4),
("Afeitado con Toalla Caliente", 30.00, "/imagenes/afeitado_toalla_caliente.jpeg", 3),
("Tinte Básico", 35.50,"/imagenes/tinte_basico.gif", 2),
("Lavado y Peinado", 20.00, "/imagenes/lavado_peinado.bmp", 5),
("Corte para Niños", 22.00, "/imagenes/corte_ninos.png", 7),
("Tratamiento Capilar",45.00, "/imagenes/tratamiento_capilar.jpg", 1),
("Corte Moderno", 28.00, "/imagenes/corte_moderno.png",6),
("Diseño de Barba", 22.00, "/imagenes/diseno_barba.jpg", 2),
("Afeitado a Navaja",35.00, "/imagenes/afeitado_navaja.jpeg", 1),
("Retoque de Color", 25.00, "/imagenes/retoque_color.gif", 4),
("Mascarilla Capilar", 38.00, "/imagenes/mascarilla_capilar.bmp", 6);

INSERT INTO Categorias (idCategoria, nombre)
VALUES
(1, "Cortes"),
(2, "Barbería"),
(3, "Coloración"),
(4, "Tratamientos"),
(5, "Peinados");
