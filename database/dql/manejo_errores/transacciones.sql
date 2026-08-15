-- 6. MANEJO DE ERRORES — TRANSACCIÓN

DELIMITER //

CREATE PROCEDURE sp_registrar_socio_con_plan(
    IN p_socio_id INT,
    IN p_nombre VARCHAR(100),
    IN p_apellidos VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_asignacion_id INT,
    IN p_plan_id VARCHAR(10),
    IN p_entrenador_id VARCHAR(10),
    IN p_sede_id VARCHAR(10)
)
BEGIN

    DECLARE error_ocurrido BOOLEAN DEFAULT FALSE;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SET error_ocurrido = TRUE;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Insertar socio
    INSERT INTO SOCIOS (
        Socio_ID,
        Nombre_Socio,
        Apellidos,
        Telefono
    )
    VALUES (
        p_socio_id,
        p_nombre,
        p_apellidos,
        p_telefono
    );

    -- Crear asignación del plan
    INSERT INTO SOCIO_PLAN_ENTRENAMIENTO (
        SOCIO_PLAN_ENTRENAMIENTO_ID,
        Socio_ID,
        Plan_Entrenamiento_ID,
        Entrenadores_Asignados_ID,
        SEDE_ID
    )
    VALUES (
        p_asignacion_id,
        p_socio_id,
        p_plan_id,
        p_entrenador_id,
        p_sede_id
    );

    IF error_ocurrido = FALSE THEN

        COMMIT;

        SELECT
            'TRANSACCION EXITOSA' AS Estado,
            'Socio y plan registrados correctamente' AS Mensaje;

    ELSE

        SELECT
            'TRANSACCION CANCELADA' AS Estado,
            'Se detecto un error. Todos los cambios fueron revertidos.' AS Mensaje;

    END IF;

END //

DELIMITER ;

CALL sp_registrar_socio_con_plan(
    105,
    'Laura',
    'Martinez',
    '555-7890',
    1007,
    'PE03',
    'E03',
    'S02'
);

COMMIT;

CALL sp_registrar_socio_con_plan(
    106,
    'Roberto',
    'Garcia',
    '555-1111',
    1008,
    'PE02',
    'E99',
    'S01'
);

