DELIMITER $$
CREATE TRIGGER verificar_disponibilidad_entrenador
BEFORE INSERT ON SOCIO_PLAN_ENTRENAMIENTO
FOR EACH ROW
BEGIN
    DECLARE v_socios_actuales INT;
    DECLARE v_capacidad_maxima INT DEFAULT 3;
    DECLARE v_entrenador VARCHAR(100);
    SELECT
        Entrenadores_Asignados
    INTO v_entrenador
    FROM ENTRENADORES
    WHERE Entrenadores_Asignados_ID =
          NEW.Entrenadores_Asignados_ID;
    SELECT COUNT(*)
    INTO v_socios_actuales
    FROM SOCIO_PLAN_ENTRENAMIENTO
    WHERE Entrenadores_Asignados_ID =
          NEW.Entrenadores_Asignados_ID;
    IF v_socios_actuales >= v_capacidad_maxima THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'ERROR: El entrenador ya alcanzo su capacidad maxima de socios';
    END IF;
END $$
DELIMITER ;


-- =========== PRUEBA =========0
INSERT INTO SOCIO_PLAN_ENTRENAMIENTO
(
    SOCIO_PLAN_ENTRENAMIENTO_ID,
    Socio_ID,
    Plan_Entrenamiento_ID,
    Entrenadores_Asignados_ID,
    SEDE_ID
)
VALUES
(
    1010,
    102,
    'PE01',
    'E01',
    'S01'
);