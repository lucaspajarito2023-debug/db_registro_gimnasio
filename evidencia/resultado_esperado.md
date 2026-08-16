# 🏋️ Ejercicio GYM — Resultados Esperados

## 📌 Descripción

Este documento contiene los **resultados esperados y temas implementados** en el ejercicio de base de datos **GYM**.

El ejercicio tiene como objetivo integrar diferentes funcionalidades de **MySQL**, incluyendo creación y manipulación de datos, consultas, estructuras de control, manejo de errores, transacciones, eventos, triggers, funciones, particionamiento, SQL dinámico y administración de usuarios y privilegios.

---

# 📚 Contenido del ejercicio

## 1. REVIEW — Creación de la base de datos

Se espera contar con una base de datos funcional para gestionar la información de un gimnasio.

La base de datos debe permitir trabajar con información relacionada con:

* Socios.
* Entrenadores.
* Membresías.
* Rutinas.
* Asignaciones.
* Pagos.
* Reportes.

El script correspondiente se encuentra dentro de:

```text
database/ddl/scheme.sql
```

---

# 2. Bucles `WHILE`

Implementación de estructuras repetitivas utilizando `WHILE`.

El objetivo es demostrar cómo ejecutar un bloque de instrucciones mientras una condición sea verdadera.

**Resultado esperado:**

* La condición se evalúa antes de cada iteración.
* El ciclo finaliza cuando la condición deja de cumplirse.
* Se utilizan variables para controlar las iteraciones.

Archivo:

```text
database/dql/bucles/while.sql
```

---

# 3. Bucle `REPEAT`

Implementación de la estructura `REPEAT`.

A diferencia de `WHILE`, el bloque de instrucciones se ejecuta al menos una vez antes de evaluar la condición de salida.

**Resultado esperado:**

* El bloque se ejecuta mínimo una vez.
* La condición se evalúa después de cada iteración.
* El ciclo finaliza cuando la condición se cumple.

Archivo:

```text
database/dql/bucles/repeat.sql
```

---

# 4. Estructura `CASE`

Implementación de condiciones mediante `CASE`.

Se utiliza para evaluar diferentes situaciones y ejecutar instrucciones dependiendo del resultado.

**Resultado esperado:**

* Evaluación de múltiples condiciones.
* Retorno de diferentes resultados.
* Uso de `CASE` dentro de procedimientos o consultas.

Archivo:

```text
database/dql/bucles/case.sql
```

---

# 5. Manejo de errores — Código específico

Se implementa el manejo de errores mediante estructuras específicas de MySQL.

El objetivo es controlar errores que puedan producirse durante la ejecución de instrucciones SQL.

**Resultado esperado:**

* Capturar errores.
* Evitar que una operación falle sin control.
* Mostrar o registrar información relacionada con el error.
* Ejecutar acciones alternativas cuando ocurra una excepción.

Archivo:

```text
database/dql/manejo_errores/manejo_errores.sql
```

---

# 6. Manejo de errores — Transacciones

Se implementa el manejo de errores utilizando **transacciones**.

Se utilizan conceptos como:

* `START TRANSACTION`
* `COMMIT`
* `ROLLBACK`

**Resultado esperado:**

Si todas las operaciones son correctas:

```sql
COMMIT;
```

Si ocurre un error:

```sql
ROLLBACK;
```

De esta manera se mantiene la integridad de los datos.

Archivo:

```text
database/dql/manejo_errores/transacciones.sql
```

---

# 7. Consultas avanzadas

Se implementan consultas SQL avanzadas para obtener información relacionada con el funcionamiento del gimnasio.

Se incluyen:

* Filtros.
* Agrupaciones.
* Ordenamientos.
* Funciones agregadas.
* Subconsultas.
* Relaciones entre tablas.
* Consultas utilizando diferentes tipos de `JOIN`.

Archivo:

```text
database/dql/consultas/consultas_avanzadas.sql
```

---

# 8. `INNER JOIN`

Se utiliza `INNER JOIN` para obtener únicamente los registros que tienen coincidencia entre las tablas relacionadas.

**Resultado esperado:**

Obtener información combinada de entidades relacionadas, por ejemplo:

```text
Socio + Entrenador
Socio + Membresía
Entrenador + Asignación
```

---

# 9. `OUTER JOIN`

Se implementan consultas utilizando operaciones de unión externa como:

* `LEFT JOIN`
* `RIGHT JOIN`

**Resultado esperado:**

Mostrar registros aunque no exista una coincidencia en la otra tabla.

---

# 10. `IN`

Se utiliza `IN` para comprobar si un valor pertenece a un conjunto determinado de valores.

Ejemplo conceptual:

```sql
WHERE estado IN ('Activo', 'Pendiente');
```

---

# 11. `OUT`

Se utiliza el parámetro `OUT` en procedimientos almacenados para devolver información generada durante la ejecución.

**Resultado esperado:**

Un procedimiento puede procesar información y devolver un resultado mediante una variable de salida.

---

# 12. `INOUT`

Se implementa el parámetro `INOUT`.

Este permite:

* Recibir un valor.
* Modificarlo durante la ejecución.
* Devolver el valor modificado.

---

# 13. Inserción de datos

Se incorporan registros de prueba para comprobar el funcionamiento de la base de datos.

Archivo:

```text
database/dml/inserts.sql
```

Los datos deben permitir probar:

* Consultas.
* Funciones.
* Triggers.
* Eventos.
* Procedimientos.
* Transacciones.
* Reportes.

---

# 14. `IF THEN ELSE`

Se utilizan estructuras condicionales:

```sql
IF
THEN
ELSE
END IF;
```

**Resultado esperado:**

Ejecutar diferentes instrucciones dependiendo de una condición.

---

# 15. `LOOP`

Se implementa la estructura `LOOP` para realizar procesos iterativos.

**Resultado esperado:**

* Ejecutar instrucciones repetidamente.
* Controlar la salida mediante condiciones.
* Utilizar `LEAVE` cuando sea necesario finalizar el ciclo.

---

# 16. Consultas innecesarias

Se incluyen ejemplos de consultas que pueden considerarse innecesarias o poco eficientes.

El objetivo es identificar consultas que:

* No aportan información relevante.
* Repiten información.
* Utilizan operaciones que pueden simplificarse.
* Pueden generar procesamiento innecesario.

Archivo:

```text
database/dql/consultas/consultas_innecesarias.sql
```

Estas consultas forman parte del análisis del ejercicio GYM para identificar oportunidades de mejora.

---

# 17. Eventos

Se implementan eventos programados de MySQL.

Archivo:

```text
database/dql/eventos/eventos.sql
```

## Evento: reporte diario — cantidad de socios por entrenador

Se crea un evento encargado de generar o actualizar información relacionada con la cantidad de socios asignados a cada entrenador.

**Resultado esperado:**

El sistema debe permitir obtener un reporte diario con información similar a:

```text
Entrenador        Cantidad de socios
------------------------------------
Entrenador 1      10
Entrenador 2       8
Entrenador 3      15
```

El evento debe ejecutarse automáticamente según la programación definida.

---

# 18. Trigger

Se implementa un trigger para controlar la disponibilidad de los entrenadores antes de realizar una asignación.

Archivo:

```text
database/dql/trigger/trigger.sql
```

## Trigger: verificar disponibilidad de entrenador antes de asignación

Antes de registrar una asignación:

1. Se identifica el entrenador.
2. Se verifica su disponibilidad.
3. Si está disponible, se permite la asignación.
4. Si no está disponible, se genera un error.
5. La asignación no debe registrarse cuando no se cumple la condición.

**Resultado esperado:**

Evitar asignaciones inválidas y mantener la integridad de los datos.

---

# 19. Funciones creadas por usuarios

Se implementan funciones definidas por el usuario utilizando `CREATE FUNCTION`.

Archivo:

```text
database/dql/funciones/funciones.sql
```

---

## 19.1 Función simple — Calcular comisión del entrenador

Se crea una función para calcular la comisión correspondiente a un entrenador.

Conceptualmente:

```text
comisión = monto × porcentaje
```

**Resultado esperado:**

La función recibe los valores necesarios y devuelve automáticamente la comisión calculada.

---

## 19.2 Funciones que utilizan condiciones

Se crean funciones que utilizan estructuras condicionales como:

```sql
IF
CASE
```

**Resultado esperado:**

La función devuelve diferentes resultados dependiendo de los valores recibidos.

---

## 19.3 Funciones con bucles y estructuras iterativas

Se implementan funciones que utilizan estructuras como:

* `LOOP`
* `WHILE`
* `REPEAT`

**Resultado esperado:**

Procesar información repetitivamente hasta cumplir una condición determinada.

---

## 19.4 Funciones que acceden a datos de la base

Se implementan funciones que realizan consultas sobre las tablas existentes.

**Resultado esperado:**

La función puede consultar información almacenada y utilizarla para generar un resultado.

---

## 19.5 Funciones no determinísticas

Se implementan funciones cuyos resultados pueden variar aunque reciban los mismos parámetros.

Por ejemplo, funciones relacionadas con:

```sql
NOW()
RAND()
```

**Resultado esperado:**

Demostrar la diferencia entre funciones determinísticas y no determinísticas.

---

## 19.6 Funciones para manejo de errores

Se incorporan funciones y estructuras relacionadas con el control de errores.

**Resultado esperado:**

* Detectar situaciones inválidas.
* Controlar errores.
* Evitar resultados incorrectos.
* Mantener la integridad de las operaciones.

---

# 20. Particionamiento de tablas

Se implementa el **particionamiento de tablas en MySQL**.

Archivo:

```text
database/ddl/particion_tabla_ej.sql
```

El objetivo es dividir lógicamente los registros de una tabla en diferentes particiones.

Se puede utilizar, por ejemplo, una división basada en:

* Fechas.
* Rangos.
* Valores específicos.

**Resultado esperado:**

La información queda distribuida en particiones para facilitar la administración y determinadas operaciones sobre grandes cantidades de datos.

---

# 21. `PREPARE`, `EXECUTE` y `DEALLOCATE`

Se implementa SQL dinámico utilizando:

```sql
PREPARE
EXECUTE
DEALLOCATE PREPARE
```

Archivo:

```text
database/dql/prepare_execute_deallocate/prepare.sql
```

## `PREPARE`

Prepara una sentencia SQL dinámica.

## `EXECUTE`

Ejecuta la sentencia preparada.

## `DEALLOCATE`

Libera la sentencia preparada de la memoria.

**Resultado esperado:**

Demostrar la ejecución de consultas SQL construidas dinámicamente.

---

# 22. Creación de usuarios

Se implementa la administración de usuarios de MySQL.

Archivo:

```text
database/dql/usuarios/usuarios.sql
```

Se crea uno o varios usuarios destinados a trabajar con la base de datos GYM.

Ejemplo conceptual:

```sql
CREATE USER 'usuario'@'localhost'
IDENTIFIED BY 'contraseña';
```

---

# 23. Asignación de permisos

Se asignan privilegios específicos a los usuarios.

Se utiliza:

```sql
GRANT
```

**Resultado esperado:**

El usuario solamente podrá realizar las operaciones autorizadas.

---

# 24. Ver privilegios de un usuario

Se consulta la información de privilegios mediante:

```sql
SHOW GRANTS FOR 'usuario'@'localhost';
```

**Resultado esperado:**

Visualizar los permisos actualmente asignados al usuario.

---

# 25. Creación de un usuario administrador

Se crea un usuario con permisos administrativos sobre la base de datos o las operaciones requeridas.

**Resultado esperado:**

El usuario administrador tendrá los privilegios necesarios para gestionar la base de datos GYM.

---

# 26. Asignar permisos específicos sobre una tabla

Se asignan permisos únicamente sobre una tabla determinada.

Por ejemplo:

```sql
GRANT SELECT, INSERT, UPDATE
ON db_registro_gimnasio.socios
TO 'usuario'@'localhost';
```

Esto permite controlar el acceso de manera más específica.

---

# 27. Privilegios sobre columnas

Se implementan permisos directamente sobre determinadas columnas de una tabla.

Por ejemplo:

```sql
GRANT SELECT(nombre, apellido)
ON db_registro_gimnasio.socios
TO 'usuario'@'localhost';
```

**Resultado esperado:**

El usuario puede consultar únicamente las columnas autorizadas.

---

# 📂 Estructura relacionada

Los resultados esperados se encuentran relacionados con la siguiente estructura del proyecto:

```text
db_registro_gimnasio/
│
├── database/
│   │
│   ├── ddl/
│   │   ├── particion_tabla_ej.sql
│   │   ├── scheme.sql
│   │   └── tabla_reportes.sql
│   │
│   ├── dml/
│   │   └── inserts.sql
│   │
│   └── dql/
│       ├── bucles/
│       │   ├── case.sql
│       │   ├── repeat.sql
│       │   └── while.sql
│       │
│       ├── consultas/
│       │   ├── consultas_avanzadas.sql
│       │   └── consultas_innecesarias.sql
│       │
│       ├── eventos/
│       │   └── eventos.sql
│       │
│       ├── funciones/
│       │   └── funciones.sql
│       │
│       ├── manejo_errores/
│       │   ├── manejo_errores.sql
│       │   └── transacciones.sql
│       │
│       ├── prepare_execute_deallocate/
│       │   └── prepare.sql
│       │
│       ├── trigger/
│       │   └── trigger.sql
│       │
│       └── usuarios/
│           └── usuarios.sql
│
├── Requerimientos.md
├── evidencia/
│   ├── img/
│   └── resultado_esperado.md
│
└── README.md
```

---

# ✅ Resultado final esperado

Al finalizar el ejercicio **GYM**, se debe contar con una base de datos funcional que demuestre el uso de:

* Creación de bases de datos y tablas.
* Inserción de datos.
* Consultas avanzadas.
* `INNER JOIN` y `OUTER JOIN`.
* `IN`, `OUT` e `INOUT`.
* `IF THEN ELSE`.
* `CASE`.
* `LOOP`.
* `WHILE`.
* `REPEAT`.
* Manejo de errores.
* Transacciones.
* Eventos programados.
* Triggers.
* Funciones definidas por usuarios.
* Funciones simples.
* Funciones con condiciones.
* Funciones iterativas.
* Funciones que acceden a datos.
* Funciones no determinísticas.
* Particionamiento de tablas.
* `PREPARE`.
* `EXECUTE`.
* `DEALLOCATE`.
* Creación de usuarios.
* Asignación de permisos.
* Consulta de privilegios.
* Usuarios administradores.
* Privilegios específicos sobre tablas.
* Privilegios específicos sobre columnas.

El ejercicio debe permitir demostrar que los diferentes componentes funcionan de manera integrada dentro de la base de datos **GYM**, manteniendo la integridad, seguridad y correcta administración de la información.
