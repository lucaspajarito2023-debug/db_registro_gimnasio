
DROP PROCEDURE IF EXISTS sp_insertar_socio_controlado;
DELIMITER //

CREATE PROCEDURE sp_insertar_socio_controlado(
    IN p_id INT,
    IN p_nombre VARCHAR(100),
    IN p_apellidos VARCHAR(100),
    IN p_telefono VARCHAR(20)
)
BEGIN

    DECLARE EXIT HANDLER FOR 1062
    BEGIN
        SELECT
            'ERROR' AS Estado,
            1062 AS Codigo_Error,
            'El Socio_ID ya existe en la tabla SOCIOS' AS Mensaje;
    END;

    INSERT INTO SOCIOS (
        Socio_ID,
        Nombre_Socio,
        Apellidos,
        Telefono
    )
    VALUES (
        p_id,
        p_nombre,
        p_apellidos,
        p_telefono
    );

    SELECT
        'OK' AS Estado,
        'Socio registrado correctamente' AS Mensaje;

END // 

DELIMITER ;

CALL sp_insertar_socio_controlado(
    107,
    'Pedro',
    'Lopez',
    '555-3456'
);


-- ejecuta este mismo codigo para verificar que el codigo funcione
CALL sp_insertar_socio_controlado(
    107,
    'Pedro',
    'Lopez',
    '555-3456'
);




DROP PROCEDURE IF EXISTS sp_asignar_plan_controlado;
DELIMITER //

CREATE PROCEDURE sp_asignar_plan_controlado(
    IN p_id INT,
    IN p_socio INT,
    IN p_plan VARCHAR(10),
    IN p_entrenador VARCHAR(10),
    IN p_sede VARCHAR(10)
)
BEGIN

    DECLARE EXIT HANDLER FOR 1452
    BEGIN
        SELECT
            'ERROR' AS Estado,
            1452 AS Codigo_Error,
            'Error de clave foranea: uno de los registros relacionados no existe' AS Mensaje;
    END;

    INSERT INTO SOCIO_PLAN_ENTRENAMIENTO (
        SOCIO_PLAN_ENTRENAMIENTO_ID,
        Socio_ID,
        Plan_Entrenamiento_ID,
        Entrenadores_Asignados_ID,
        SEDE_ID
    )
    VALUES (
        p_id,
        p_socio,
        p_plan,
        p_entrenador,
        p_sede
    );

    SELECT
        'OK' AS Estado,
        'Asignacion creada correctamente' AS Mensaje;

END //

DELIMITER ;

CALL sp_asignar_plan_controlado(
    1011,
    101,
    'PE99',
    'E01',
    'S01'
);