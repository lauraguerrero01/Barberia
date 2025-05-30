CALL AgendarCita(6,2,'2025-05-30 15:00:00','Crear');
CALL AgendarCita(6,2,'2025-05-30 15:00:00','Cancelar');
CALL CambiarCita(6,2,'2025-05-30 15:00:00','2025-05-30 14:00:00');
SELECT * FROM cita;
SELECT * 
FROM historial_citas;