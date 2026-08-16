====== función simple =======
DROP FUNCTION IF EXISTS fn_nombre_completo;
DELIMITER $$
CREATE FUNCTION fn_nombre_completo(
    p_nombre VARCHAR(100),
    p_apellidos VARCHAR(100)
)
RETURNS VARCHAR(201)
DETERMINISTIC
BEGIN
    RETURN CONCAT(p_nombre, ' ', p_apellidos);
END $$
DELIMITER ;

-- ===== PRUEBA ===== 
SELECT fn_nombre_completo('Ana', 'Perez') AS Nombre_Completo;


-- ====== Calcular comision entrenador ========
DROP FUNCTION IF EXISTS fn_calcular_comision;
DELIMITER $$
CREATE FUNCTION fn_calcular_comision(
    p_precio DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_comision DECIMAL(10,2);
    SET v_comision = p_precio * 0.10;
    RETURN v_comision;
END $$
DELIMITER ;

-- ====== Prueba ======

DROP FUNCTION IF EXISTS fn_calcular_comision;
DELIMITER $$
CREATE FUNCTION fn_calcular_comision(
    p_precio DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_comision DECIMAL(10,2);
    SET v_comision = p_precio * 0.10;
    RETURN v_comision;
END $$
DELIMITER ;

-- ====== prueba =====
SELECT fn_calcular_comision(500.00) AS Comision;



-- ==== Funciones con condiciones ====
DROP FUNCTION IF EXISTS fn_nivel_entrenador;
DELIMITER $$
CREATE FUNCTION fn_nivel_entrenador(
    p_cantidad_socios INT
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE v_nivel VARCHAR(20);
    IF p_cantidad_socios <= 1 THEN
        SET v_nivel = 'BAJA';
    ELSEIF p_cantidad_socios <= 3 THEN
        SET v_nivel = 'MEDIA';
    ELSE
        SET v_nivel = 'ALTA';
    END IF;
    RETURN v_nivel;
END $$
DELIMITER ;

-- ===== prueba ========
SELECT fn_nivel_entrenador(1) AS Nivel;

-- ========== FUNCIÓN CON BUCLE / ESTRUCTURA ITERATIVA =========
DROP FUNCTION IF EXISTS fn_suma_iterativa;
DELIMITER $$
CREATE FUNCTION fn_suma_iterativa(
    p_numero INT
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_contador INT DEFAULT 1;
    DECLARE v_total INT DEFAULT 0;
    IF p_numero <= 0 THEN
        RETURN 0;
    END IF;
    suma_loop: LOOP
        SET v_total = v_total + v_contador;
        SET v_contador = v_contador + 1;
        IF v_contador > p_numero THEN
            LEAVE suma_loop;
        END IF;
    END LOOP suma_loop;
    RETURN v_total;
END $$
DELIMITER ;

-- ===== Prueba ====
SELECT fn_suma_iterativa(5) AS Resultado;

-- ===== FUNCIÓN QUE ACCEDE A DATOS DE LA BASE =======
DROP FUNCTION IF EXISTS fn_cantidad_planes_socio;
DELIMITER $$
CREATE FUNCTION fn_cantidad_planes_socio(
    p_socio_id INT
)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*)
    INTO v_total
    FROM SOCIO_PLAN_ENTRENAMIENTO
    WHERE Socio_ID = p_socio_id;
    RETURN v_total;
END $$
DELIMITER ;

-- ========== Prueba ==========
SELECT fn_cantidad_planes_socio(101) AS Total_Planes;


-- =========== FUNCIÓN NO DETERMINÍSTICA
DROP FUNCTION IF EXISTS fn_calcular_comision;

DELIMITER $$
CREATE FUNCTION fn_calcular_comision(
    p_precio DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
NO SQL
BEGIN
    DECLARE v_comision DECIMAL(10,2);
    SET v_comision = p_precio * 0.10;
    RETURN v_comision;
END $$
DELIMITER ;
SELECT fn_calcular_comision(500.00) AS Comision;

-- ==== 7. FUNCIÓN CON MANEJO DE ERRORES
DROP FUNCTION IF EXISTS fn_comision_segura;

DELIMITER $$
CREATE FUNCTION fn_comision_segura(
    p_precio DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_comision DECIMAL(10,2);
    IF p_precio IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'ERROR: El precio no puede ser NULL';
    END IF;
    IF p_precio < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'ERROR: El precio no puede ser negativo';
    END IF;
    SET v_comision = p_precio * 0.10;
    RETURN v_comision;
END $$
DELIMITER ;


SELECT fn_comision_segura(500.00) AS Comision;