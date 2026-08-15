-- ===========================
-- While 
-- ===========================

DELIMITER //
CREATE PROCEDURE sp_recorrer_socios_while()
BEGIN
    DECLARE contador INT DEFAULT 101;
    DECLARE total_socios INT;

    SELECT MAX(Socio_ID)
    INTO total_socios
    FROM SOCIOS;

    WHILE contador <= total_socios DO
        SELECT
            Socio_ID,
            Nombre_Socio,
            Apellidos,
            Telefono
        FROM SOCIOS
        WHERE Socio_ID = contador;
        SET contador = contador + 1;
    END WHILE;
END //
DELIMITER ;

-- ================ PRUEBA ==============

CALL sp_recorrer_socios_while();
