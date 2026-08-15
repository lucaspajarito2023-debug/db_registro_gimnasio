-- === REPEAT

DELIMITER //
CREATE PROCEDURE sp_recorrer_asignaciones_repeat()
BEGIN
    DECLARE contador INT DEFAULT 1001;
    DECLARE ultima_asignacion INT;

    SELECT MAX(SOCIO_PLAN_ENTRENAMIENTO_ID)
    INTO ultima_asignacion
    FROM SOCIO_PLAN_ENTRENAMIENTO;

    REPEAT
        SELECT
            SOCIO_PLAN_ENTRENAMIENTO_ID,
            Socio_ID,
            Plan_Entrenamiento_ID,
            Entrenadores_Asignados_ID,
            SEDE_ID
        FROM SOCIO_PLAN_ENTRENAMIENTO
        WHERE SOCIO_PLAN_ENTRENAMIENTO_ID = contador;

        SET contador = contador + 1;

    UNTIL contador > ultima_asignacion
    END REPEAT;
END //
DELIMITER ;

-- ========= PRUEBA ========
CALL sp_recorrer_asignaciones_repeat();