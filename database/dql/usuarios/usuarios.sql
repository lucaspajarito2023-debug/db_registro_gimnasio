-- ============================================================
-- GESTION DE USUARIOS Y PRIVILEGIOS - MYSQL
-- BASE DE DATOS: GIMNASIO
-- ============================================================


-- ============================================================
-- 1. SELECCIONAR LA BASE DE DATOS
-- ============================================================

USE gimnasio;


-- ============================================================
-- 2. CREACION DE USUARIO
-- ============================================================

DROP USER IF EXISTS 'usuario_gimnasio'@'localhost';

CREATE USER 'usuario_gimnasio'@'localhost'
IDENTIFIED BY 'Gym2026*';


-- ============================================================
-- 3. ASIGNAR PERMISOS AL USUARIO
-- ============================================================
-- Este usuario podrá consultar toda la base de datos gimnasio.

GRANT SELECT
ON gimnasio.*
TO 'usuario_gimnasio'@'localhost';


-- ============================================================
-- 4. VER PRIVILEGIOS DEL USUARIO
-- ============================================================

SHOW GRANTS FOR 'usuario_gimnasio'@'localhost';


-- ============================================================
-- 5. CREACION DE USUARIO ADMINISTRADOR
-- ============================================================

DROP USER IF EXISTS 'admin_gimnasio'@'localhost';

CREATE USER 'admin_gimnasio'@'localhost'
IDENTIFIED BY 'AdminGym2026*';


-- ============================================================
-- 6. ASIGNAR TODOS LOS PERMISOS AL ADMINISTRADOR
-- ============================================================

GRANT ALL PRIVILEGES
ON gimnasio.*
TO 'admin_gimnasio'@'localhost';


-- ============================================================
-- 7. VER PRIVILEGIOS DEL ADMINISTRADOR
-- ============================================================

SHOW GRANTS FOR 'admin_gimnasio'@'localhost';


-- ============================================================
-- 8. CREAR USUARIO CON PERMISOS ESPECIFICOS
--    SOBRE UNA TABLA
-- ============================================================

DROP USER IF EXISTS 'usuario_reportes'@'localhost';

CREATE USER 'usuario_reportes'@'localhost'
IDENTIFIED BY 'Reportes2026*';


-- ============================================================
-- 9. ASIGNAR PERMISOS ESPECIFICOS SOBRE
--    REPORTE_SOCIOS_ENTRENADOR
-- ============================================================
-- Este usuario solamente podrá:
-- SELECT
-- INSERT
-- sobre esta tabla.

GRANT SELECT, INSERT
ON gimnasio.REPORTE_SOCIOS_ENTRENADOR
TO 'usuario_reportes'@'localhost';


-- ============================================================
-- 10. VER PRIVILEGIOS DEL USUARIO DE REPORTES
-- ============================================================

SHOW GRANTS FOR 'usuario_reportes'@'localhost';


-- ============================================================
-- 11. PRIVILEGIOS SOBRE COLUMNAS
-- ============================================================
-- Crear un usuario que solamente pueda consultar
-- determinadas columnas de la tabla SOCIOS.

DROP USER IF EXISTS 'usuario_consulta'@'localhost';

CREATE USER 'usuario_consulta'@'localhost'
IDENTIFIED BY 'Consulta2026*';


-- ============================================================
-- 12. ASIGNAR SELECT SOBRE COLUMNAS ESPECIFICAS
-- ============================================================
-- Este usuario podrá consultar:
-- Socio_ID
-- Nombre_Socio
-- Apellidos
--
-- NO tendrá permiso para consultar Telefono.

GRANT SELECT (
    Socio_ID,
    Nombre_Socio,
    Apellidos
)
ON gimnasio.SOCIOS
TO 'usuario_consulta'@'localhost';


-- ============================================================
-- 13. VER PRIVILEGIOS SOBRE COLUMNAS
-- ============================================================

SHOW GRANTS FOR 'usuario_consulta'@'localhost';


-- ============================================================
-- 14. OTORGAR INSERT SOBRE COLUMNAS ESPECIFICAS
-- ============================================================
-- Permitimos insertar únicamente nombre y apellidos.

GRANT INSERT (
    Nombre_Socio,
    Apellidos
)
ON gimnasio.SOCIOS
TO 'usuario_consulta'@'localhost';


-- ============================================================
-- 15. VERIFICAR NUEVAMENTE LOS PRIVILEGIOS
-- ============================================================

SHOW GRANTS FOR 'usuario_consulta'@'localhost';


-- ============================================================
-- 16. APLICAR PRIVILEGIOS
-- ============================================================
-- En versiones actuales de MySQL, GRANT aplica
-- los permisos inmediatamente. Este comando se
-- incluye como parte de la demostración.

FLUSH PRIVILEGES;


-- ============================================================
-- 17. RESUMEN DE USUARIOS CREADOS
-- ============================================================

SELECT
    User,
    Host
FROM mysql.user
WHERE User IN (
    'usuario_gimnasio',
    'admin_gimnasio',
    'usuario_reportes',
    'usuario_consulta'
);



-- ==== comprobar ======0

SHOW GRANTS FOR 'usuario_gimnasio'@'localhost';

SHOW GRANTS FOR 'admin_gimnasio'@'localhost';

SHOW GRANTS FOR 'usuario_reportes'@'localhost';

SHOW GRANTS FOR 'usuario_consulta'@'localhost';


SELECT
    Socio_ID,
    Nombre_Socio,
    Apellidos
FROM SOCIOS;