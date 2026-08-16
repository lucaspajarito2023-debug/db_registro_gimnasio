SET GLOBAL event_scheduler = ON;


DELIMITER $$
CREATE EVENT IF NOT EXISTS evento_reporte_diario_entrenadores
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_DATE + INTERVAL 1 DAY - INTERVAL 1 MINUTE DO
BEGIN
    INSERT INTO REPORTE_SOCIOS_ENTRENADOR (
        FECHA_REPORTE,
        ENTRENADOR_ID,
        ENTRENADOR,
        CANTIDAD_SOCIOS
    )
    SELECT
        CURRENT_DATE,
        e.Entrenadores_Asignados_ID,
        e.Entrenadores_Asignados,
        COUNT(spe.Socio_ID)
    FROM ENTRENADORES e
    LEFT JOIN SOCIO_PLAN_ENTRENAMIENTO spe
        ON e.Entrenadores_Asignados_ID =
           spe.Entrenadores_Asignados_ID
    GROUP BY
        e.Entrenadores_Asignados_ID,
        e.Entrenadores_Asignados;
END $$
DELIMITER ;

SELECT *
FROM REPORTE_SOCIOS_ENTRENADOR
ORDER BY FECHA_REPORTE DESC;