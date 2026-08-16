INSERT INTO CIUDAD (CIUDAD_ID, Ciudad_Sede) VALUES
('C01', 'Madrid');

INSERT INTO SEDE (SEDE_ID, Gimnasio_Sede, Ciudad_Sede) VALUES
('S01', 'Sede Norte', 'C01'),
('S02', 'Sede Sur', 'C01');

INSERT INTO SOCIOS (Socio_ID, Nombre_Socio, Apellidos, Telefono) VALUES
(101, 'Ana', 'Perez', '555-1234'),
(102, 'Luis', 'Gomez', '555-5678'),
(103, 'Carla', 'Ruiz', '555-9012');

INSERT INTO PLAN_ENTRENAMIENTO
(Plan_Entrenamiento_ID, Plan_Entrenamiento) VALUES
('PE01', 'Yoga'),
('PE02', 'Pesas'),
('PE03', 'CrossFit'),
('PE04', 'Boxeo');

INSERT INTO ESPECIALIDAD
(ESPECIALIDAD_ID, Especialidad_Entrenador) VALUES
('EE01', 'Yoga'),
('EE02', 'Musculacion'),
('EE03', 'Funcional'),
('EE05', 'Boxeo');

INSERT INTO ENTRENADORES
(Entrenadores_Asignados_ID, Entrenadores_Asignados, ESPECIALIDAD_ID) VALUES
('E01', 'Carlos', 'EE01'),
('E02', 'Marta', 'EE02'),
('E03', 'Ivan', 'EE03'),
('E04', 'Diego', 'EE05');

INSERT INTO SOCIO_PLAN_ENTRENAMIENTO
(SOCIO_PLAN_ENTRENAMIENTO_ID, Socio_ID, Plan_Entrenamiento_ID, Entrenadores_Asignados_ID, SEDE_ID) VALUES
(1001, 101, 'PE01', 'E01', 'S01'),
(1002, 101, 'PE02', 'E01', 'S01'),
(1003, 102, 'PE03', 'E03', 'S02'),
(1004, 103, 'PE02', 'E02', 'S01'),
(1005, 103, 'PE04', 'E04', 'S01');

