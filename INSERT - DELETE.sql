
USE `Barberia`;
DROP procedure IF EXISTS `Insertcliente`;

DELIMITER $$
USE `Barberia`$$
CREATE PROCEDURE Insertcliente(
In p_numDoc int,
IN p_nombre varchar (50),
IN p_apellido varchar (50),
IN p_telefono varchar (20),
IN p_correo varchar (100),
IN p_idTipoDoc int
)
BEGIN

INSERT INTO Cliente (numdoc, nombre, apellido, telefono, correo, idTipoDoc) 
VALUES  (p_numDoc, p_nombre, p_apellido, p_telefono, p_correo, p_idTipoDoc);
END

DELIMITER ;

USE `Barberia`;
DROP procedure IF EXISTS `Eliminarcliente`;

DELIMITER $$
USE `Barberia`$$

CREATE PROCEDURE `Eliminarcliente`(
IN p_numdocumento int
)
BEGIN
DELETE FROM Cliente WHERE numdoc = p_numdocumento;
END

DELIMITER ;