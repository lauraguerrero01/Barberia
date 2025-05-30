-- Creación de Funciones
-- Funcion VerificarDisponibilidad
DELIMITER //
DROP FUNCTION IF EXISTS VerificarDisponibilidad;
CREATE FUNCTION VerificarDisponibilidad(
    p_idBarbero INT,
    p_fecha DATETIME
) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE disponible BOOLEAN;
    -- Si la función retorna 1 indica que el barbero tiene una cita asignada a esa fecha y hora, si retorna 0 indica que el barbero esta disponible a esa fecha y hora 
    SELECT NOT EXISTS(
        SELECT 1 FROM Cita 
        WHERE idBarbero = p_idBarbero 
        AND fechaYhora = p_fecha
        AND idEstadoCita = 1 
    ) INTO disponible;
    
    RETURN disponible;
END //

-- Función ValidarCita
DELIMITER //
DROP FUNCTION IF EXISTS ValidarCita;
CREATE FUNCTION ValidarCita(
	p_idCliente INT,
	p_idBarbero INT,
    p_fecha DATETIME
) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE disponible BOOLEAN;
    -- Si la función retorna 1 indica que existe una cita asignada a esa fecha y hora con el barbero y para el cliente indicados, si la función retorna 0 es porque no existe una cita con esos parametros
    SELECT EXISTS(
        SELECT 1 FROM Cita 
        WHERE idBarbero = p_idBarbero 
        AND fechaYhora = p_fecha
        AND idCliente = p_idCliente
    ) INTO disponible;
    
    RETURN disponible;
END //

-- Creación de Procedimientos Almacenados
-- SP para realizar el agendamiento de citas, la cual permite Crear nuevas Citas o Cancelar, que para este caso actualiza el estado de la cita de Confirmado a Cancelado
DELIMITER //
DROP PROCEDURE IF EXISTS AgendarCita;
CREATE PROCEDURE AgendarCita
(
	IN p_idCliente INT,
    IN p_idBarbero INT,
    IN p_fecha DATETIME,
    IN tipoAgendamiento VARCHAR(20)
)
BEGIN
	DECLARE ValidaDisponibilidad INT;
	SELECT VerificarDisponibilidad(p_idBarbero, p_fecha) INTO ValidaDisponibilidad;
    
    IF tipoAgendamiento = 'Crear' THEN
		IF ValidaDisponibilidad = 1 THEN
			INSERT INTO Cita (fechaYhora, idEstadoCita, idCliente, idBarbero)
			VALUES (p_fecha, 1, p_idCliente, p_idBarbero);
            SELECT "Cita Creada" as "Resultado";
		END IF;
	ELSEIF tipoAgendamiento = 'Cancelar' THEN
		IF ValidaDisponibilidad = 0 THEN
			UPDATE cita SET idEstadoCita = 2
            WHERE fechaYhora = p_fecha AND idCliente = p_idCliente AND idBarbero = p_idBarbero;
            SELECT "Cita Cancelada" as "Resultado";
		END IF;
	END IF;
END
//

-- SP para cambiar la fecha de la cita, donde se debe enviar el cliente, barbero la fecha que tiene asignada la cita actualmente y la nueva fecha de la cita
DELIMITER //
DROP PROCEDURE IF EXISTS CambiarCita;
CREATE PROCEDURE CambiarCita
(
	IN p_idCliente INT,
    IN p_idBarbero INT,
    IN p_fechaAnt DATETIME,
    IN p_fechaNue DATETIME
)
BEGIN
	DECLARE ValidaDisponibilidad INT;
    DECLARE ValidarCita INT;
	DECLARE Id_Cita INT;
    
    SELECT ValidarCita(p_idCliente, p_idBarbero, p_fechaAnt) INTO ValidarCita;
    IF ValidarCita = 1 THEN
        SELECT VerificarDisponibilidad(p_idBarbero, p_fechaNue) INTO ValidaDisponibilidad;
        IF ValidaDisponibilidad = 1 THEN
            SET Id_Cita = (SELECT idCita FROM cita WHERE fechaYhora = p_fechaAnt AND idCliente = p_idCliente AND idBarbero = p_idBarbero AND idEstadoCita = 1 ORDER BY idCita DESC LIMIT 1);
            UPDATE Cita SET fechaYhora = p_fechaNue
            WHERE idCita = Id_Cita;
        ELSE 
            SELECT "La nueva fecha y hora no esta disponible para ese barbero";
        END IF;
    ELSE 
        SELECT "La cita no existe";
    END IF;
END
//

-- Creación de Trigger
-- Trigger para alimentar la tabla Historial_Citas cada vez que se cree una nueva cita
DELIMITER //
DROP TRIGGER IF EXISTS InsertHistorial;
CREATE TRIGGER InsertHistorial
AFTER INSERT ON Cita
FOR EACH ROW
BEGIN

    INSERT INTO Historial_Citas (idCita, accion, fecha_hora, detalles)
	VALUES (NEW.idCita, "Crear", NOW(), CONCAT("Se agenda una nueva cita para la fecha: ", NEW.fechaYhora, ", con el barbero ", (SELECT CONCAT (nombre, " ", apellido) FROM Barbero WHERE idBarbero = NEW.idBarbero), " y el cliente ", (SELECT CONCAT (nombre, " ", apellido) FROM Cliente WHERE idCliente = NEW.idCliente)));
END
//

-- Trigger para alimentar la tabla Historial_Citas cada vez que se actualice una cita
DELIMITER //
DROP TRIGGER IF EXISTS ActualizarHistorial;
CREATE TRIGGER ActualizarHistorial
AFTER UPDATE ON Cita
FOR EACH ROW
BEGIN
	IF OLD.idEstadoCita = 1 AND NEW.idEstadoCita = 2 THEN
		INSERT INTO Historial_Citas (idCita, accion, fecha_hora, detalles)
		VALUES (NEW.idCita, "Actualizar", NOW(), CONCAT("Se cancela la cita de la fecha ", OLD.fechaYhora, " con el barbero ", (SELECT CONCAT (nombre, " ", apellido) FROM Barbero WHERE idBarbero = OLD.idBarbero), " y el cliente ", (SELECT CONCAT (nombre, " ", apellido) FROM Cliente WHERE idCliente = OLD.idCliente)));
	ELSE     
		INSERT INTO Historial_Citas (idCita, accion, fecha_hora, detalles)
		VALUES (NEW.idCita, "Actualizar", NOW(), CONCAT("Se actualiza la cita de la fecha ", OLD.fechaYhora, " para la fecha: ", NEW.fechaYhora, ", con el barbero ", (SELECT CONCAT (nombre, " ", apellido) FROM Barbero WHERE idBarbero = NEW.idBarbero), " y el cliente ", (SELECT CONCAT (nombre, " ", apellido) FROM Cliente WHERE idCliente = NEW.idCliente)));
	END IF;
END
//
