SELECT s.Nombre_Socio, s.Apellidos, p.Plan_Entrenamiento
FROM SOCIOS s
INNER JOIN SOCIO_PLAN_ENTRENAMIENTO spe
    ON s.Socio_ID = spe.Socio_ID
INNER JOIN PLAN_ENTRENAMIENTO p
    ON spe.Plan_Entrenamiento_ID = p.Plan_Entrenamiento_ID
WHERE s.Socio_ID IN (
    SELECT Socio_ID
    FROM SOCIOS
);