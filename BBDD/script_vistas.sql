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