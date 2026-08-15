
-- ====== CASE
DELIMITER //
CREATE PROCEDURE sp_clasificar_plan(
    IN p_plan_id VARCHAR(10)
)
BEGIN
    SELECT
        Plan_Entrenamiento_ID,
        Plan_Entrenamiento,

        CASE Plan_Entrenamiento_ID
            WHEN 'PE01' THEN 'Plan de flexibilidad y relajacion'
            WHEN 'PE02' THEN 'Plan de fuerza'
            WHEN 'PE03' THEN 'Plan de alta intensidad'
            WHEN 'PE04' THEN 'Plan de combate'
            ELSE 'Plan no identificado'
        END AS Clasificacion

    FROM PLAN_ENTRENAMIENTO
    WHERE Plan_Entrenamiento_ID = p_plan_id;

END //
DELIMITER ;


-- =========== PRUEBA ===============
CALL sp_clasificar_plan('PE01');