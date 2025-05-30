-- Inserción en TipoDocumento
CALL Insertar_TipoDocumento(1, "CC");
CALL Insertar_TipoDocumento(2, "TI");
CALL Insertar_TipoDocumento(3, "PAS");
CALL Insertar_TipoDocumento(4, "CE");

-- Inserción en Cliente
CALL Insertar_Cliente(123456789, "Ana", "Pérez", "3101234567", "ana.perez@email.com", 3);
CALL Insertar_Cliente(987654321, "Carlos", "López", "3159876543", "carlos.lopez@email.com", 2);
CALL Insertar_Cliente(112233445, "Sofía", "Gómez", "3201122334", "sofia.gomez@example.org", 1);
CALL Insertar_Cliente(556677889, "Mateo", "Rodríguez", "3005566778", "mateo.r@miempresa.net", 3);
CALL Insertar_Cliente(678901234, "Daniel", "Castro", "3167890123", "daniel.castro@mail.net", 1);
CALL Insertar_Cliente(234567890, "Emilia", "Suárez", "3212345678", "e.suarez@servidor.com", 2);
CALL Insertar_Cliente(789012345, "Martín", "Díaz", "3017890123", "martin.d@unemail.edu.com", 3);
CALL Insertar_Cliente(456789012, "Isabella", "Ruiz", "3174567890", "isabella.r@miorganizacion.com", 1);
CALL Insertar_Cliente(901234567, "Samuel", "Torres", "3129012345", "s.torres@provider.info", 2);
CALL Insertar_Cliente(334455667, "Valentina", "Vargas", "3183344556", "v.vargas@otrodominio.com", 2);

-- Inserción en Barbero
CALL Insertar_Barbero(101010101, "Luisa", "Fernández", 1);
CALL Insertar_Barbero(202020202, "Javier", "Ramírez", 2);
CALL Insertar_Barbero(303030303, "Camila", "Sánchez", 1);
CALL Insertar_Barbero(404040404, "Andrés", "Martínez", 3);
CALL Insertar_Barbero(505050505, "Mariana", "Herrera", 2);
CALL Insertar_Barbero(606060606, "Sebastián", "Guzmán", 1);
CALL Insertar_Barbero(707070707, "Isabella", "Rojas", 2);
CALL Insertar_Barbero(808080808, "Nicolás", "Vargas", 3);

-- Inserción en Estado_Cita
CALL Insertar_EstadoCita(1, "Confirmado");
CALL Insertar_EstadoCita(0, "Cancelado");

-- Inserción en Cita
CALL Insertar_Cita('2025-05-08 14:00:00', 1, 1, 6); -- Confirmado
CALL Insertar_Cita('2025-05-09 08:30:00', 2, 5, 4); -- Cancelado
CALL Insertar_Cita('2025-05-09 16:45:00', 1, 3, 2); -- Confirmado
CALL Insertar_Cita('2025-05-10 10:15:00', 2, 8, 5); -- Cancelado
CALL Insertar_Cita('2025-05-10 15:00:00', 1, 4, 7); -- Confirmado
CALL Insertar_Cita('2025-05-11 09:00:00', 2, 2, 8); -- Cancelado
CALL Insertar_Cita('2025-05-11 17:30:00', 1, 7, 1); -- Confirmado

-- Inserción en Producto
CALL Insertar_Producto('Cera Moldeadora', 15.00, '/imagenes/cera.jpg');
CALL Insertar_Producto('Aceite para Barba', 20.00, '/imagenes/aceite_barba.png');
CALL Insertar_Producto('Champú Anticaída', 28.50, '/imagenes/shampoo.jpg');
CALL Insertar_Producto('Loción Post-Afeitado', 12.75, '/imagenes/locion.gif');
CALL Insertar_Producto('Peine de Madera', 8.00, '/imagenes/peine.bmp');

-- Inserción en Servicio
CALL Insertar_Servicio('Corte Clásico', 25.00, '/imagenes/corte_clasico.jpg', 1);
CALL Insertar_Servicio('Arreglo de Barba', 18.00, '/imagenes/arreglo_barba.png', 4);
CALL Insertar_Servicio('Afeitado con Toalla Caliente', 30.00, '/imagenes/afeitado_toalla_caliente.jpeg', 3);
CALL Insertar_Servicio('Tinte Básico', 35.50,'/imagenes/tinte_basico.gif', 2);
CALL Insertar_Servicio('Lavado y Peinado', 20.00, '/imagenes/lavado_peinado.bmp', 5);
CALL Insertar_Servicio('Corte para Niños', 22.00, '/imagenes/corte_ninos.png', 7);
CALL Insertar_Servicio('Tratamiento Capilar',45.00, '/imagenes/tratamiento_capilar.jpg', 1);
CALL Insertar_Servicio('Corte Moderno', 28.00, '/imagenes/corte_moderno.png',6);
CALL Insertar_Servicio('Diseño de Barba', 22.00, '/imagenes/diseno_barba.jpg', 2);
CALL Insertar_Servicio('Afeitado a Navaja',35.00, '/imagenes/afeitado_navaja.jpeg', 1);
CALL Insertar_Servicio('Retoque de Color', 25.00, '/imagenes/retoque_color.gif', 4);
CALL Insertar_Servicio('Mascarilla Capilar', 38.00, '/imagenes/mascarilla_capilar.bmp', 6);

-- Inserción en Categorias
CALL Insertar_Categoria(1, "Cortes");
CALL Insertar_Categoria(2, "Barbería");
CALL Insertar_Categoria(3, "Coloración");
CALL Insertar_Categoria(4, "Tratamientos");
CALL Insertar_Categoria(5, "Peinados");
