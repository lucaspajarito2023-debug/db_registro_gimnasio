SET @nombre = 'Ana';

SET @sql = '
    SELECT
        Socio_ID,
        Nombre_Socio,
        Apellidos,
        Telefono
    FROM SOCIOS
    WHERE Nombre_Socio = ?
';

PREPARE buscar_nombre
FROM @sql;

EXECUTE buscar_nombre
USING @nombre;

DEALLOCATE PREPARE buscar_nombre;
