drop view if exists vw_Datos_Alumnos; 

Create view vw_Datos_Alumnos AS 
	SELECT 
		e.NOMBRE as 'Nombre', 
        e.APELLIDO_1 AS 'Apellido_1', 
        e.APELLIDO_2 AS 'Apellido_2', 
        e.FECHA_NACIMIENTO AS 'Fecha_de_Nacimiento', 
        e.DIRECCION AS "Direccion", 
        e.DATOS_MEDICOS AS 'Datos_Medicos', 
        e.OBSERVACIONES AS 'Observaciones',
        t.nick as 'Nick_padre'
	from 
		ESTUDIANTES e
        
        join tutores_estudiantes te
        on e.id = te.ID_ESTUDIANTE
        
        join tutores t
        on t.id = te.ID_TUTOR;
        
drop view if exists vw_Notas_Alumnos; 

Create view vw_Notas_Alumnos AS 
SELECT 
	E.NOMBRE AS NOMBRE,
    E.APELLIDO_1 AS APELLIDO_1,
    E.APELLIDO_2 AS APELLIDO_2,
    GE.NOTAS_TRIMESTRE_1 AS NOTAS_TRIM_1,
    GE.NOTAS_TRIMESTRE_2 AS NOTAS_TRIM_2,
    GE.NOTAS_TRIMESTRE_3 AS NOTAS_TRIM_3,
    GE.NOTAS_FINAL AS NOTAS_FINAL,
    GE.FALTAS_ASISTENCIA_1 AS FALTAS_1,
    GE.FALTAS_ASISTENCIA_2 AS FALTAS_2,
    GE.FALTAS_ASISTENCIA_3 AS FALTAS_3,
    GE.FALTAS_ASISTENCIA_FINAL AS FALTAS_FINAL,
    GE.FALTAS_JUSTIFICADAS_1 AS JUSTIFICADAS_1,
    GE.FALTAS_JUSTIFICADAS_2 AS JUSTIFICADAS_2,
    GE.FALTAS_JUSTIFICADAS_3 AS JUSTIFICADAS_3,
    GE.FALTAS_JUSTIFICADAS_FINAL AS JUSTIFICADAS_FINAL,
    GE.RETRASOS_1 AS RETRASOS_1,
    GE.RETRASOS_2 AS RETRASOS_2,
    GE.RETRASOS_3 AS RETRASOS_3,
    GE.RETRASOS_FINAL AS RETRASOS_FINAL,
    G.CICLO AS CICLO,
    G.CURSO AS CURSO,
    G.CLASE AS CLASE,
    D.NICK AS DOC_NICK    
FROM
	ESTUDIANTES E
    
    JOIN GRUPOS_ESTUDIANTES GE
    ON E.ID = GE.ID_ESTUDIANTE
    
    JOIN GRUPOS G
    ON GE.ID_GRUPO = G.ID
    
    JOIN DOCENTES D
    ON G.ID_DOCENTE = D.ID;
    
Create view vw_nick_pass_alumno as
Select NICK, CONTRASENA from estudiantes