-- ========= Consultas avanzadas ==========

-- ====== IN =======
DROP PROCEDURE IF EXISTS sp_consultar_socio_in;
DELIMITER //
CREATE PROCEDURE sp_consultar_socio_in(
    IN p_socio_id INT
)
BEGIN
    SELECT s.Socio_ID, s.Nombre_Socio, s.Apellidos, s.Telefono
    FROM SOCIOS s
    WHERE s.Socio_ID = p_socio_id;
END //
DELIMITER ;

-- ======== PRUEBA =====
CALL sp_consultar_socio_in(101);



-- =============== INNER JOIN ============0
SELECT s.Socio_ID, s.Nombre_Socio,s.Apellidos,
    p.Plan_Entrenamiento, e.Entrenadores_Asignados,
    se.Gimnasio_Sede, c.Ciudad_Sede
FROM SOCIOS s
INNER JOIN SOCIO_PLAN_ENTRENAMIENTO spe
    ON s.Socio_ID = spe.Socio_ID
INNER JOIN PLAN_ENTRENAMIENTO p
    ON spe.Plan_Entrenamiento_ID = p.Plan_Entrenamiento_ID
INNER JOIN ENTRENADORES e
    ON spe.Entrenadores_Asignados_ID = e.Entrenadores_Asignados_ID
INNER JOIN SEDE se
    ON spe.SEDE_ID = se.SEDE_ID
INNER JOIN CIUDAD c
    ON se.Ciudad_Sede = c.CIUDAD_ID;
    
    
-- =========== OUT ================= 
DROP PROCEDURE IF EXISTS sp_contar_planes_out;
DELIMITER //
CREATE PROCEDURE sp_contar_planes_out(
    IN p_socio_id INT,
    OUT p_total_planes INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_total_planes
    FROM SOCIO_PLAN_ENTRENAMIENTO
    WHERE Socio_ID = p_socio_id;

END //
DELIMITER ;

-- ====== PRUEBA =========
SET @contador = 10;
CALL sp_contar_planes_out(101, @total);
SELECT @total AS Total_Planes;


-- ======== INOUT =========
DROP PROCEDURE IF EXISTS sp_sumar_planes_inout;

DELIMITER $$

CREATE PROCEDURE sp_sumar_planes_inout(
    IN p_socio_id INT,
    INOUT p_contador INT
)
BEGIN
    DECLARE v_planes INT;
    SELECT COUNT(*)
    INTO v_planes
    FROM SOCIO_PLAN_ENTRENAMIENTO
    WHERE Socio_ID = p_socio_id;
    SET p_contador = p_contador + v_planes;
END $$
DELIMITER ;

-- ======== PRUEBA ===========
SET @contador = 10;
CALL sp_sumar_planes_inout(101, @contador);
SELECT @contador AS Contador_Final;



-- ======== INSERCION ============
DROP PROCEDURE IF EXISTS sp_insertar_socio;
DELIMITER $$
CREATE PROCEDURE sp_insertar_socio(
    IN p_socio_id INT,
    IN p_nombre VARCHAR(100),
    IN p_apellidos VARCHAR(100),
    IN p_telefono VARCHAR(20)
)
BEGIN
    INSERT INTO SOCIOS (
        Socio_ID,
        Nombre_Socio,
        Apellidos,
        Telefono
    ) VALUES (
        p_socio_id,
        p_nombre,
        p_apellidos,
        p_telefono
    );
    SELECT
        'INSERTADO' AS Estado,
        'Socio registrado correctamente' AS Mensaje;
END $$
DELIMITER ;


-- ====== PRUEBA ========
CALL sp_insertar_socio(
    108,
    'Mario',
    'Hernandez',
    '555-2222'
);
	-- VERIFICAR
SELECT *
FROM SOCIOS
WHERE Socio_ID = 108;

-- ====== 
DROP PROCEDURE IF EXISTS sp_clasificar_socio;
DELIMITER $$

CREATE PROCEDURE sp_clasificar_socio(
    IN p_socio_id INT
)
BEGIN
    DECLARE v_total_planes INT;
    SELECT COUNT(*)
    INTO v_total_planes
    FROM SOCIO_PLAN_ENTRENAMIENTO
    WHERE Socio_ID = p_socio_id;

    IF v_total_planes = 0 THEN
        SELECT
            p_socio_id AS Socio_ID,
            v_total_planes AS Total_Planes,
            'Sin plan de entrenamiento' AS Clasificacion;

    ELSEIF v_total_planes = 1 THEN
        SELECT
            p_socio_id AS Socio_ID,
            v_total_planes AS Total_Planes,
            'Plan basico' AS Clasificacion;
    ELSE
        SELECT
            p_socio_id AS Socio_ID,
            v_total_planes AS Total_Planes,
            'Plan multiple' AS Clasificacion;
    END IF;
END $$
DELIMITER ;

-- ====== PRUEBA ========
CALL sp_clasificar_socio(102);

-- ====== LOOP ========
DROP PROCEDURE IF EXISTS sp_recorrer_asignaciones_loop;
DELIMITER $$
CREATE PROCEDURE sp_recorrer_asignaciones_loop()
BEGIN
    DECLARE v_id INT DEFAULT 1001;
    DECLARE v_max_id INT;
    SELECT MAX(SOCIO_PLAN_ENTRENAMIENTO_ID)
    INTO v_max_id
    FROM SOCIO_PLAN_ENTRENAMIENTO;
    recorrer: LOOP
        IF v_id > v_max_id THEN
            LEAVE recorrer;
        END IF;
        SELECT
            spe.SOCIO_PLAN_ENTRENAMIENTO_ID,
            s.Nombre_Socio,
            s.Apellidos,
            p.Plan_Entrenamiento,
            e.Entrenadores_Asignados,
            se.Gimnasio_Sede
        FROM SOCIO_PLAN_ENTRENAMIENTO spe
        INNER JOIN SOCIOS s
            ON spe.Socio_ID = s.Socio_ID
        INNER JOIN PLAN_ENTRENAMIENTO p
            ON spe.Plan_Entrenamiento_ID = p.Plan_Entrenamiento_ID
        INNER JOIN ENTRENADORES e
            ON spe.Entrenadores_Asignados_ID = e.Entrenadores_Asignados_ID
        INNER JOIN SEDE se
            ON spe.SEDE_ID = se.SEDE_ID
        WHERE spe.SOCIO_PLAN_ENTRENAMIENTO_ID = v_id;
        SET v_id = v_id + 1;
    END LOOP recorrer;
END $$
DELIMITER ;


CALL sp_recorrer_asignaciones_loop();