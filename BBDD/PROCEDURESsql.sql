drop PROCEDURE if exists pa_Crear_Nick;

-- CreateNick: Crea un Nick único para un usuario
--     Parámetros Entrada
--         pv_user_type: tipo de usuario varchar(1);
--         pv_school: nombre del colegio varchar(50);
--         pi_Id: id del usuario al que quieres poner el Nick;
--     Parámetros de salida
--         pv_nick: el nick que quieres crear varchar(15);

DELIMITER //
create procedure pa_Crear_Nick(in pv_user_type varchar(1),
                            in pv_school varchar(50),
                            in pi_Id INT,
                            out pv_nick varchar(15))
begin
    declare vv_shortName varchar(50);
    declare vv_short_user varchar(6);
    declare vv_cad varchar(23);
    declare vc_word char;
    set vc_word = substr('TRWAGMYFPDXBNJZSQVHLCKE', floor(rand()*23), 1);
    set vv_shortName = (select LETRAS_3 from COLEGIOS where NOMBRE like pv_school);
    if pv_user_type like 'S' then
        set vv_short_user = concat(lower(substr((select NOMBRE from ESTUDIANTES where ID = pi_Id),1,2)), lower(substr((select APELLIDO_1 from ESTUDIANTES where ID = pi_Id),1,2)), lower(substr((select APELLIDO_2 from ESTUDIANTES where ID = pi_Id),1,2)));
    else
        if pv_user_type like 'T' then
            set vv_short_user = concat(lower(substr((select NOMBRE from DOCENTES where ID = pi_Id),1,2)), lower(substr((select APELLIDO_1 from _teachers where ID = pi_Id),1,2)), lower(substr((select APELLIDO_2 from _teachers where ID = pi_Id),1,2)));
        else
            if pv_user_type like 'M' then
                set vv_short_user = concat(lower(substr((select NOMBRE from MANAGER_COLEGIO where ID = pi_Id),1,2)), lower(substr((select APELLIDO_1 from MANAGER_COLEGIO where ID = pi_Id),1,2)), lower(substr((select APELLIDO_2 from MANAGER_COLEGIO where ID = pi_Id),1,2)));
            else
                if pv_user_type like 'P' then
                    set vv_short_user = concat(lower(substr((select NOMBRE from TUTORES where ID = pi_Id),1,2)), lower(substr((select APELLIDO_1 from TUTORES where ID = pi_Id),1,2)), lower(substr((select APELLIDO_2 from TUTORES where ID = pi_Id),1,2)));
                end if;
            end if;
        end if;
    end if;
    set pv_nick = concat(upper(pv_user_type),upper(vv_shortName),'-',upper(vv_short_user),vc_word);
    while NOT((select ID from ESTUDIANTES where NICK like pv_nick) <=> NULL) DO
        set vc_word = substr('TRWAGMYFPDXBNJZSQVHLCKE', floor(rand()*23), 1);
        set pv_nick = concat(upper(pv_user_type),upper(vv_shortName),'-',upper(vv_short_user),vc_word);
    end while;
end;
// DELIMITER ;

drop procedure if exists pa_Generar_Contrasena;

DELIMITER //
CREATE PROCEDURE pa_Generar_Contrasena(out pv_word varchar(8))
Begin
    Declare vi_cont int;
    set pv_word = '';
    set vi_cont = 0;
    while vi_cont < 8 Do
        set pv_word = concat(pv_word,(substr('abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJLMNOPQRSTUVWXYZ%$&#-@/+',floor(rand()*66),1)));
        set vi_cont = vi_cont +1;
    End While;
end

// DELIMITER ;

drop PROCEDURE if EXISTS pa_anadir_estudiante;

DELIMITER //
CREATE PROCEDURE pa_anadir_estudiante(in pv_nombre Varchar(50),					
                                    in pv_apellido1 varchar(100),
                                    in pv_apellido2 varchar(100),
                                    in pdt_nacimiento date,
                                    in pv_nacionalidad varchar(50),
                                    in pv_pais varchar(50),
                                    in pv_ciudad varchar(50),
                                    in pi_cp varchar(10),
                                    in pv_direccion varchar(200),
                                    in pv_email varchar(100),
                                    in pt_datMedico text,
                                    in pv_contrasena text,
                                    in pt_observaciones text,
                                    in pt_ruta_foto text,
                                    in pt_colegio text,
                                    out pi_r INT)
BEGIN

DECLARE vb_id INT;
DECLARE vv_nick VARCHAR(12);
DECLARE vv_contrasena TEXT;

INSERT INTO ESTUDIANTES (NOMBRE,
                        APELLIDO_1,
                        APELLIDO_2,
                        FECHA_NACIMIENTO,
                        NACIONALIDAD,
                        PAIS,
                        CIUDAD,
                        CP,
                        DIRECCION,
                        EMAIL,
                        CONTRASENA,
                        DELETED, 
                        F_BORRADO
                        )
                        VALUES(pv_nombre, pv_apellido1, pv_apellido2, pdt_nacimiento, pv_nacionalidad, pv_pais, pv_ciudad, pi_cp, pv_direccion, pv_email,pv_contrasena, 0, NULL);
SET pi_r = 1;
set vb_id = (SELECT ID FROM ESTUDIANTES WHERE NOMBRE like pv_nombre and APELLIDO_1 LIKE pv_apellido1 and APELLIDO_2 LIKE pv_apellido2);
CALL PA_CREAR_NICK('S', pt_colegio, vb_id, @TEMP);
SET pi_r = 2;
SET vv_nick = (SELECT @TEMP);
SET @TEMP = '';
CALL PA_GENERAR_CONTRASENA(@TEMP);
set vv_contrasena = (SELECT @TEMP);
SET pi_r = 3;
UPDATE ESTUDIANTES SET NICK = vv_nick WHERE ID = vb_id;
SET pi_r = 4;
UPDATE ESTUDIANTES SET CONTRASENA = vv_contrasena WHERE ID = vb_id;
SET pi_r = 5;
if pt_datMedico not like '' or pt_datMedico is not null then
    update ESTUDIANTES set DATOS_MEDICOS = pt_datMedico where ID = vb_id;
    SET pi_r = 6;
end if;
if pt_observaciones not like '' or pt_observaciones is not null then
	Update ESTUDIANTES set OBSERVACIONES = pt_observaciones where ID = vb_id;
    SET pi_r = 7;
end if;
if pt_ruta_foto not like '' or pt_ruta_foto is not null then
	update ESTUDIANTES set RUTA_FOTO = pt_ruta_foto where id = vb_id;
    SET pi_r = 8;
end if;
END // 
DELIMITER ;

drop PROCEDURE if EXISTS PA_ANADIR_TUTOR;
DELIMITER //
CREATE PROCEDURE PA_ANADIR_TUTOR(in pv_nombre Varchar(50),
								in pv_apellido1 varchar(100),
								in pv_apellido2 varchar(100),
								in pdt_nacimiento date,
								in pv_nacionalidad varchar(50),
								in pv_pais varchar(50),
								in pv_ciudad varchar(50),
								in pi_cp int,
								in pv_direccion varchar(200),
								in pv_email varchar(100),
								in pv_telefono1 varchar(15),
								in pv_telefono2 varchar(15),
								in pt_colegio text,
								out pi_r INT)


BEGIN
DECLARE vb_id INT;
DECLARE vv_nick VARCHAR(12);
DECLARE vv_contrasena TEXT;
INSERT INTO TUTORES (NOMBRE,
                    APELLIDO_1,
                    APELLIDO_2,
                    FECHA_NACIMIENTO,
                    NACIONALIDAD,
                    PAIS,
                    CIUDAD,
                    CP,
                    DIRECCION,
                    EMAIL,
                    DELETED,
                    F_BORRADO)
                    VALUES(pv_nombre, pv_apellido1, pv_apellido2, pdt_nacimiento, pv_nacionalidad, pv_pais, pv_ciudad, pi_cp, pv_direccion, pv_email,0, NULL);
SET pi_r = 1;
set vb_id = (SELECT ID FROM TUTORES WHERE NOMBRE like pv_nombre and APELLIDO_1 LIKE pv_apellido1 and APELLIDO_2 LIKE pv_apellido2);
SET pi_r = 2;
CALL PA_CREAR_NICK('P', pt_colegio, vb_id, @TEMP);
SET vv_nick = (SELECT @TEMP);
SET pi_r = 3;
SET @TEMP = '';
CALL PA_GENERAR_CONTRASENA(@TEMP);
set vv_contrasena = (SELECT @TEMP);
SET pi_r = 4;
UPDATE TUTORES SET NICK = vv_nick WHERE ID = vb_id;
SET pi_r = 5;
UPDATE TUTORES SET CONTRASENA = vv_contrasena WHERE ID = vb_id;
SET pi_r = 6;
if TELEFONO_1 not like '' OR TELEFONO_1 IS NOT NULL then
	update TUTORES set TELEFONO_1 = pv_telefono1 where ID = vb_id;
    SET pi_r = 7;
end if;

if TELEFONO_2 not like '' OR TELEFONO_2 IS NOT NULL then
	update TUTORES set TELEFONO_2 = pv_telefono2 where ID = vb_id;
    SET pi_r = 8;
end if;
END // 
DELIMITER ;

DROP PROCEDURE IF EXISTS pa_anadir_manager;

DELIMITER //
CREATE PROCEDURE pa_anadir_manager(in pv_nombre Varchar(50),
                                    in pv_apellido1 varchar(100),
                                    in pv_apellido2 varchar(100),
                                    in pdt_nacimiento date,
                                    in pv_nacionalidad varchar(50),
                                    in pv_pais varchar(50),
                                    in pv_ciudad varchar(50),
                                    in pi_cp int,
                                    in pv_direccion varchar(200),
                                    in pv_email varchar(100),
                                    in pv_telefono1 varchar(15),
                                    in pv_telefono2 varchar(15),
                                    in pi_idColegio int,
                                    in pt_colegio text,
                                    out pi_r INT)

BEGIN
DECLARE vb_id INT;
DECLARE vv_nick VARCHAR(12);
DECLARE vv_contrasena TEXT;
INSERT INTO MANAGER_COLEGIO (NOMBRE,
                            APELLIDO_1,
                            APELLIDO_2,
                            FECHA_NACIMIENTO,
                            NACIONALIDAD,
                            PAIS,
                            CIUDAD,
                            CP,
                            DIRECCION,
                            EMAIL,
                            ID_COLEGIO)
                            VALUES(pv_nombre, pv_apellido1, pv_apellido2, pdt_nacimiento, pv_nacionalidad, pv_pais, pv_ciudad, pi_cp, pv_direccion, pv_email, pi_idColegio);
SET pi_r = 1;
set vb_id = (SELECT ID FROM MANAGER_COLEGIO WHERE NOMBRE like pv_nombre and APELLIDO_1 LIKE pv_apellido1 and APELLIDO_2 LIKE pv_apellido2);
SET pi_r = 2;
CALL PA_CREAR_NICK('M', pt_colegio, vb_id, @TEMP);
SET vv_nick = (SELECT @TEMP);
SET pi_r = 3;
SET @TEMP = '';
CALL PA_GENERAR_CONTRASENA(@TEMP);
set vv_contrasena = (SELECT @TEMP);
SET pi_r = 4;

UPDATE MANAGER_COLEGIO SET NICK = vv_nick WHERE ID = vb_id;
SET pi_r = 5;
UPDATE MANAGER_COLEGIO SET CONTRSENA = vv_contrasena WHERE ID = vb_id;
SET pi_r = 6;
if TELEFONO_1 not like '' OR TELEFONO_1 IS NOT NULL then
	update MANAGER_COLEGIO set TELEFONO_1 = pv_telefono1 where ID = vb_id;
    SET pi_r = 7;
end if;

if TELEFONO_2 not like '' OR TELEFONO_2 IS NOT NULL then
	update MANAGER_COLEGUI set TELEFONO_2 = pv_telefono2 where ID = vb_id;
    SET pi_r = 8;
end if;
END 
//DELIMITER ;

DROP PROCEDURE IF EXISTS pa_anadir_docente;

DELIMITER //
CREATE PROCEDURE pa_anadir_docente(in pv_nombre Varchar(50),
                                    in pv_apellido1 varchar(100),
                                    in pv_apellido2 varchar(100),
                                    in pdt_nacimiento date,
                                    in pv_nacionalidad varchar(50),
                                    in pv_pais varchar(50),
                                    in pv_ciudad varchar(50),
                                    in pi_cp int,
                                    in pv_direccion varchar(200),
                                    in pv_email varchar(100),
                                    in pv_telefono1 varchar(15),
                                    in pv_telefono2 varchar(15),
                                    out pi_r INT)

BEGIN
DECLARE vb_id INT;
DECLARE vv_nick VARCHAR(12);
DECLARE vv_contrasena TEXT;
INSERT INTO DOCENTES (NOMBRE,
                    APELLIDO_1,
                    APELLIDO_2,
                    FECHA_NACIMIENTO,
                    NACIONALIDAD,
                    PAIS,
                    CIUDAD,
                    CP,
                    DIRECCION,
                    EMAIL)
                    VALUES(pv_nombre, pv_apellido1, pv_apellido2, pdt_nacimiento, pv_nacionalidad, pv_pais, pv_ciudad, pi_cp, pv_direccion, pv_email);
SET pi_r = 1;
set vb_id = (SELECT ID FROM DOCENTES WHERE NOMBRE like pv_nombre and APELLIDO_1 LIKE pv_apellido1 and APELLIDO_2 LIKE pv_apellido2);
SET pi_r = 2;
CALL PA_CREAR_NICK('T', pt_colegio, vb_id, @TEMP);
SET vv_nick = (SELECT @TEMP);
SET pi_r = 3;
SET @TEMP = '';
CALL PA_GENERAR_CONTRASENA(@TEMP);
set vv_contrasena = (SELECT @TEMP);
SET pi_r = 4;

UPDATE DOCENTES SET NICK = vv_nick WHERE ID = vb_id;
SET pi_r = 5;
UPDATE DOCENTES SET CONTRSENA = vv_contrasena WHERE ID = vb_id;
SET pi_r = 6;
if TELEFONO_1 not like '' OR TELEFONO_1 IS NOT NULL then
	update DOCENTES set TELEFONO_1 = pv_telefono1 where ID = vb_id;
    SET pi_r = 7;
end if;

if TELEFONO_2 not like '' OR TELEFONO_2 IS NOT NULL then
	update DOCENTES set TELEFONO_2 = pv_telefono2 where ID = vb_id;
    SET pi_r = 8;
end if;
END
// DELIMITER ;

DELIMITER //
drop procedure if exists pa_GetManager;
create procedure pa_GetManager(in pv_Nick varchar(12),
							   out pv_name varchar(50),
							   out pv_sn1 varchar(100),
							   out pv_sn2 varchar(100))
PA: begin
    declare Existe varchar(12);
    set Existe = NULL;
	
	select NICK from manager_colegio where NICK = Lower(pv_Nick)
    into Existe;
    
	if Existe is null
    then
        leave PA;
	end if;
    
    select NOMBRE from manager_colegio where NICK = Lower(pv_Nick)
    into pv_name;
    
    select APELLIDO_1 from manager_colegio where NICK = Lower(pv_Nick)
    into pv_sn1;
    
    select APELLIDO_2 from manager_colegio where NICK = Lower(pv_Nick)
    into pv_sn2;
end//
DELIMITER ;

DELIMITER //
drop procedure if exists pa_GetParent;
create procedure pa_GetParent(in pv_Nick varchar(12),
							   out pv_name varchar(50),
							   out pv_sn1 varchar(100),
							   out pv_sn2 varchar(100))
PA: begin
    declare Existe varchar(12);
    set Existe = NULL;
	
	select NICK from tutores where NICK = Lower(pv_Nick)
    into Existe;
    
	if Existe is null
    then
        leave PA;
	end if;
    
    select NOMBRE from tutores where NICK = Lower(pv_Nick)
    into pv_name;
    
    select APELLIDO_1 from tutores where NICK = Lower(pv_Nick)
    into pv_sn1;
    
    select APELLIDO_2 from tutores where NICK = Lower(pv_Nick)
    into pv_sn2;
end//
DELIMITER ;

DELIMITER //
drop procedure if exists pa_GetTeacher;
create procedure pa_GetTeacher(in pv_Nick varchar(12),
							   out pv_name varchar(50),
							   out pv_sn1 varchar(100),
							   out pv_sn2 varchar(100))
PA: begin
    declare Existe varchar(12);
    set Existe = NULL;
	
	select NICK from docentes where NICK = Lower(pv_Nick)
    into Existe;
    
	if Existe is null
    then
        leave PA;
	end if;
    
    select NOMBRE from docentes where NICK = Lower(pv_Nick)
    into pv_name;
    
    select APELLIDO_1 from docentes where NICK = Lower(pv_Nick)
    into pv_sn1;
    
    select APELLIDO_2 from docentes where NICK = Lower(pv_Nick)
    into pv_sn2;
end//
DELIMITER ;

DELIMITER //
drop procedure if exists pa_GetStudent2;
create procedure pa_GetStudent2(in pv_Nick varchar(12),
							   out pv_name varchar(50),
							   out pv_sn1 varchar(100),
							   out pv_sn2 varchar(100))
PA: begin
    declare Existe varchar(12);
    set Existe = NULL;
	
	select NICK from estudiantes where NICK = Lower(pv_Nick)
    into Existe;
    
	if Existe is null
    then
        leave PA;
	end if;
    
    select NOMBRE from estudiantes where NICK = Lower(pv_Nick)
    into pv_name;
    
    select APELLIDO_1 from estudiantes where NICK = Lower(pv_Nick)
    into pv_sn1;
    
    select APELLIDO_2 from estudiantes where NICK = Lower(pv_Nick)
    into pv_sn2;
end//
DELIMITER ;

DROP PROCEDURE IF EXISTS PA_ACTUALIZAR_NOTAS;
DELIMITER //


CREATE PROCEDURE PA_ACTUALIZAR_NOTAS(IN _NOMBRE VARCHAR(50),
									 IN _APELLIDO1 VARCHAR(100),
                                     IN _APELLIDO2 VARCHAR(100),
                                     IN NT1 INT,
                                     IN NT2 INT,
                                     IN NT3 INT,
                                     IN NF INT,
                                     IN FT1 INT,
                                     IN FT2 INT,
                                     IN FT3 INT,
                                     IN FF INT,
                                     IN JT1 INT,
                                     IN JT2 INT,
                                     IN JT3 INT,
                                     IN JF INT,
                                     IN RT1 INT,
                                     IN RT2 INT,
                                     IN RT3 INT,
                                     IN RF INT,
                                     IN _CICLO VARCHAR(12),
                                     IN _CURSO TINYINT,
                                     IN _CLASE VARCHAR(10),
                                     IN _DOC_NICK VARCHAR(12),
                                     OUT RES INT)
BEGIN
	DECLARE V_ID INT;
    SET V_ID = (SELECT 
						GE.ID 
				FROM 
						ESTUDIANTES E 
                        JOIN GRUPOS_ESTUDIANTES GE 
                        ON E.ID = GE.ID_ESTUDIANTE 
                        JOIN GRUPOS G 
                        ON G.ID = GE.ID_GRUPO 
                        JOIN DOCENTES D 
                        ON D.ID = G.ID_DOCENTE 
				WHERE 
                        E.NOMBRE LIKE _NOMBRE 
                        AND E.APELLIDO_1 LIKE _APELLIDO1 
                        AND E.APELLIDO_2 LIKE _APELLIDO2 
                        AND D.NICK LIKE _DOC_NICK  
				LIMIT 1);
   UPDATE 
		GRUPOS_ESTUDIANTES 
	SET 
		NOTAS_TRIMESTRE_1 = NT1,
        NOTAS_TRIMESTRE_2 = NT2,
        NOTAS_TRIMESTRE_3 = NT3,
        NOTAS_FINAL= NF,
        FALTAS_ASISTENCIA_1 = FT1,
        FALTAS_ASISTENCIA_2 = FT2,
        FALTAS_ASISTENCIA_3 = FT3,
        FALTAS_ASISTENCIA_FINAL = FF,
        FALTAS_JUSTIFICADAS_1 = JT1,
        FALTAS_JUSTIFICADAS_2 = JT2,
        FALTAS_JUSTIFICADAS_3 = JT3,
        FALTAS_JUSTIFICADAS_FINAL = JF,
        RETRASOS_1 = RT1,
        RETRASOS_2 = RT2,
        RETRASOS_3 = RT3,
        RETRASOS_FINAL = RF
	WHERE
		ID = V_ID;
	SET RES = 1;
	
END // DELIMITER ;