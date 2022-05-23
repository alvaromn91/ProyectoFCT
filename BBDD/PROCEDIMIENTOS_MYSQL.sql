use schoolerzz;
SET GLOBAL log_bin_trust_function_creators = 1;
drop function if exists fn_crear_contrasena;

-- CreateNick: Crea un Nick único para un usuario
--     Parámetros Entrada
--         _tipo_usuario: tipo de usuario varchar(1);
--         _colegio: nombre del _colegio varchar(50);
--         _id_usuario: id del usuario al que quieres poner el Nick;
--     Parámetros de salida
--         _nick: el nick que quieres crear varchar(15);

DELIMITER //
CREATE FUNCTION FN_CREAR_CONTRASENA()

       RETURNS varchar(8)
BEGIN
    declare vv_word varchar(8);
    set vv_word = concat(upper(substr('abcdefghijklmnopqrstuvwxyz', floor(rand()+25), 1)));
    set vv_word = concat(vv_word, substr('abcdefghijklmnopqrstuvwxyz', floor(rand()+25), 1));
    set vv_word = concat(vv_word, substr('1234567890', floor(rand()+9), 1));
    set vv_word = concat(vv_word, substr('1234567890', floor(rand()+9), 1));
    set vv_word = concat(vv_word, substr('%$&#-@/+', floor(rand()+7), 1));
    set vv_word = concat(vv_word, substr('abcdefghijklmnopqrstuvwxyz', floor(rand()+25), 1));
    set vv_word = concat(vv_word, substr('%$&#-@/+', floor(rand()+7), 1));
    set vv_word = concat(vv_word, upper(substr('abcdefghijklmnopqrstuvwxyz', floor(rand()+25), 1)));
    RETURN vv_word;
END
// DELIMITER ;

drop function if exists fn_crear_nick;

-- CreateNick: Crea un Nick único para un usuario

DELIMITER //
create function fn_crear_nick(_tipo_usuario varchar(1),
   						   _colegio varchar(50),
   						   _id_usuario int)
returns varchar(15)
begin
	declare colegio_3_letras varchar(50);
	declare nombre_corto_usuario varchar(6);
	declare aletorio varchar(23);
	declare nuevo_nick char;
	declare _nick varchar(15);
	set nuevo_nick = substr('TRWAGMYFPDXBNJZSQVHLCKE', floor(rand()*23), 1);
	set colegio_3_letras = (select letras_3 from colegios where nombre like _colegio);
	if _tipo_usuario like 'S' then
    	set nombre_corto_usuario = concat(lower(substr((select NOMBRE from ESTUDIANTES where ID = _id_usuario ),1,2)), lower(substr((select APELLIDO_1 from ESTUDIANTES where ID = _id_usuario),1,2)), lower(substr((select APELLIDO_2 from ESTUDIANTES where ID = _id_usuario ),1,2)));
	else
    	if _tipo_usuario like 'T' then
        	set nombre_corto_usuario = concat(lower(substr((select NOMBRE from DOCENTES where ID = _id_usuario),1,2)), lower(substr((select APELLIDO_1 from DOCENTES where ID = _id_usuario),1,2)), lower(substr((select APELLIDO_2 from DOCENTES where ID = _id_usuario),1,2)));
    	else
        	if _tipo_usuario like 'M' then
            	set nombre_corto_usuario = concat(lower(substr((select NOMBRE from MANAGER_COLEGIO where ID = _id_usuario),1,2)), lower(substr((select APELLIDO_1 from MANAGER_COLEGIO where ID = _id_usuario),1,2)), lower(substr((select APELLIDO_2 from MANAGER_COLEGIO where ID = _id_usuario),1,2)));
        	else
            	if _tipo_usuario like 'P' then
                	set nombre_corto_usuario = concat(lower(substr((select NOMBRE from TUTORES where ID = _id_usuario),1,2)), lower(substr((select APELLIDO_1 from TUTORES where ID = _id_usuario),1,2)), lower(substr((select APELLIDO_2 from TUTORES where ID = _id_usuario),1,2)));
            	end if;
        	end if;
    	end if;
	end if;
	set _nick = concat(upper(_tipo_usuario),upper(colegio_3_letras),'-',upper(nombre_corto_usuario),nuevo_nick);
	while NOT((select ID from ESTUDIANTES where NICK like _nick) <=> NULL) DO
    	set nuevo_nick = substr('TRWAGMYFPDXBNJZSQVHLCKE', floor(rand()*23), 1);
    	set _nick = concat(upper(_tipo_usuario),upper(colegio_3_letras),'-',upper(nombre_corto_usuario),nuevo_nick);
	end while;
	return _nick;
end;
// DELIMITER ;

drop function if exists fn_generador_passwords;

-- generador_passwords: Crea una contraseña aleaotaria

DELIMITER //
create function fn_generador_passwords()
returns text
begin
	declare abc varchar(62) default 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890';
	declare _pass text;

	set _pass = concat(substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1),
                   	substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1),
                   	substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1),
                   	substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1),
                   	substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1), substring(abc, rand() * 62, 1));
    return _pass;
end;
// DELIMITER ;

drop procedure if exists pa_crear_grupo;

-- pa_crear_grupo: Crea un nuevo grupo
-- 	Parámetros Entrada
--     	_ciclo: El ciclo del grupo
--     	_curso: El curso del grupo
--     	_clase: El clase del grupo
--     	_id_colegio: El id del colegio del grupo
--     	_id_docente: El id del docente del grupo
-- 	Parámetros de salida
--     	_salida: Número con el código de error

DELIMITER //
create procedure pa_crear_grupo(in _ciclo varchar(12),
   							 in _curso tinyint(4),
                            	in _clase varchar(10),
                            	in _id_colegio int(11),
                            	in _id_docente int(11),
   							 out _salida text)
PA: begin
    declare idExiste int default null;
    
	select ID from COLEGIOS where ID = _id_colegio
	into idExiste;
    
    if idExiste is null
	then
   	 set _salida = -1;
    	leave PA;
    end if;
    
	select ID from DOCENTES where ID = _id_docente
	into idExiste;
    
    if idExiste is null
	then
   	 set _salida = -2;
    	leave PA;
    end if;
    
	insert into GRUPOS
    values(null, _ciclo, _curso, _clase, _id_colegio, _id_docente, 0);
	set _salida = 0;
end;
// DELIMITER ;






/*
* PA_ELIMINAR_ESTUDIANTE
* Descripción: Procedimiento para eliminar estudiantes de la BBDD
* Parámetros de entrada:
*						_NICK_ESTUDIANTE --> Nick del estudiante que vamos a eliminar
*						_NICK_MANAGER --> Nick del Mánager del centro
* Parámetros de salida:
*						_RESULTADO --> Resultado del procedimiento
*						_MENSAJE --> Mensaje Explicativo
*/

DROP PROCEDURE IF EXISTS PA_ELIMINAR_ESTUDIANTE;

DELIMITER //
CREATE PROCEDURE PA_ELIMINAR_ESTUDIANTE(IN _NICK_ESTUDIANTE VARCHAR(12),
										IN _NICK_MANAGER VARCHAR(12),
										OUT _RESULTADO INT,
										OUT _MENSAJE TEXT)
BEGIN
	
   DECLARE ID_ESTU INT;
   
   SET ID_ESTU = (SELECT ID FROM ESTUDIANTES WHERE NICK = _NICK_ESTUDIANTE);
    
    -- Comprueba si existe el estudiante
    IF ID_ESTU <=> NULL THEN
        -- No existe el estudiante
		SET _RESULTADO = -1;
        SET _MENSAJE = 'No existe el estudiante';
	END IF;
    
    -- Eliminamos los emblemas del estudiante
    UPDATE 
		EMBLEMAS_ESTUDIANTES 
	SET 
		DELETED = 1 
	WHERE 
		ID_ESTUDIANTE = ID_ESTU; 
    
    -- Eliminamos las skins del estudiante
    UPDATE 
		SKINS_ESTUDIANTES 
	SET 
		DELETED = 1 
	WHERE 
		ID_ESTUDIANTE = ID_ESTU; 
    
    -- Eliminamos los tutores del estudiante
    UPDATE 
		TUTORES_ESTUDIANTES 
	SET 
		DELETED = 1 
	WHERE 
		ID_ESTUDIANTE = ID_ESTU; 
    
    -- Eliminamos los grupos del estudiante
    UPDATE 
		GRUPOS_ESTUDIANTES 
	SET 
		DELETED = 1 
	WHERE 
		ID_ESTUDIANTE = ID_ESTU; 
    
    -- Eliminamos el estudiante
    UPDATE 
		ESTUDIANTES 
	SET 
		DELETED = 1 
	WHERE 
		ID = ID_ESTU; 
    
    -- El estudiante ha sido eliminado con éxito
    SET _RESULTADO = 0;
    SET _MENSAJE = 'El estudiante ha sido eliminado con éxito';
END
// DELIMITER ;


/*
* PA_ELIMINAR_TUTOR
* Descripción: Procedimiento para eliminar tutores de la BBDD
* Parámetros de entrada:
*						_NICK_TUTOR --> Nick del estudiante que vamos a eliminar
* Parámetros de salida:
*						_RESULTADO --> Resultado del procedimiento
*						_MENSAJE --> Mensaje Explicativo
*/

DROP PROCEDURE IF EXISTS PA_ELIMINAR_TUTOR;

DELIMITER //
CREATE PROCEDURE PA_ELIMINAR_TUTOR(IN _NICK_TUTOR VARCHAR(12),
								   OUT _RESULTADO INT,
								   OUT _MENSAJE TEXT)
BEGIN
	
   DECLARE ID_TUT INT;
   DECLARE CANT_TUTORES INT;
   DECLARE SIN_ESTUDIANTES TINYINT(1);
   
   SET SIN_ESTUDIANTES = 0;
   SET ID_TUT = (SELECT ID FROM TUTORES WHERE NICK = _NICK_TUTOR);
    
    -- Comprueba si existe el tutor
    IF ID_TUT <=> NULL THEN
        -- No existe el estudiante
		SET _RESULTADO = -1;
        SET _MENSAJE = 'No existe el tutor';
	END IF;
    CREATE TEMPORARY TABLE ESTUDIANTES_DEL_TUTOR 
						   SELECT ID_ESTUDIANTE AS ID_ESTU FROM TUTORES_ESTUDIANTES WHERE ID_TUTOR = ID_TUT  AND DELETED = 0;
                           
    -- Comprueba si hay más tutores a cargo del estudiante, si no los hay no deja desasociar el tutor al estudiante y no deja eliminarlo
    WHILE (SELECT ID_ESTU FROM ESTUDIANTES_DEL_TUTOR) DO
		SET CANT_TUTORES = (SELECT COUNT(*) FROM TUTORES_ESTUDIANTES WHERE ID_TUTOR <> ID_TUT AND ID_ESTUDIANTE = ID_ESTU);
		IF (CANT_TUTORES) > 1 THEN
			UPDATE 
				TUTORES_ESTUDIANTES
			SET
				DELETED = 1
			WHERE
				ID_TUTOR = ID_TUT AND ID_ESTUDIANTE = ID_ESTU;
		ELSE
			SET SIN_ESTUDIANTES = 1;
		END IF;
    END WHILE;
	
    IF (SIN_ESTUDIANTES) = 0 THEN
		-- El tutor ha sido eliminado con éxito
		SET _RESULTADO = 0;
		SET _MENSAJE = 'El tutor ha sido eliminado con éxito';
	else
		-- TUTOR NO ELIMINADO: El tutor tiene estudiantes a su cargo
		SET _RESULTADO = -2;
		SET _MENSAJE = 'TUTOR NO ELIMINADO: El tutor tiene estudiantes a su cargo';
    END IF;
END
// DELIMITER ;


/*
* PA_ELIMINAR_DOCENTE
* Descripción: Procedimiento para eliminar docentes de la BBDD
* Parámetros de entrada:
*						_NICK_DOCENTE --> Nick del docente que vamos a eliminar
* Parámetros de salida:
*						_RESULTADO --> Resultado del procedimiento
*						_MENSAJE --> Mensaje Explicativo
*/

DROP PROCEDURE IF EXISTS PA_ELIMINAR_DOCENTE;

DELIMITER //
CREATE PROCEDURE PA_ELIMINAR_DOCENTE(IN _NICK_DOCENTE VARCHAR(12),
									 OUT _RESULTADO INT,
									 OUT _MENSAJE TEXT)
BEGIN
	
   DECLARE ID_PROFE INT;
   DECLARE ID_CHAT_DOC INT;
   DECLARE ID_GRUPO_DOC INT;
   
   SET ID_PROFE = (SELECT ID FROM DOCENTES WHERE NICK = _NICK_DOCENTE);
    
    -- Comprueba si existe el docente
    IF ID_PROFE <=> NULL THEN
        -- No existe el estudiante
		SET _RESULTADO = -1;
        SET _MENSAJE = 'No existe el docente';
	END IF;
    
    -- Eliminamos las skins del docente
    UPDATE 
		SKINS_DOCENTES
	SET 
		DELETED = 1 
	WHERE 
		ID_DOCENTE = ID_PROFE; 
        
	-- Eliminamos los post del docente
    UPDATE 
		POSTS 
	SET 
		DELETED = 1 
	WHERE 
		ID_DOCENTE = ID_PROFE; 
    
    -- Eliminamos los hilos del docente
    UPDATE 
		HILOS
	SET 
		DELETED = 1 
	WHERE 
		ID_DOCENTE = ID_PROFE; 
        
    -- Eliminamos los chats de los grupos del docente
    UPDATE 
		 GRUPOS
	SET 
		DELETED = 1 
	WHERE 
		ID_DOCENTE = ID_PROFE; 
     
     
     
     SET ID_GRUPO_DOC = (SELECT 
								ID
						FROM 
								GRUPOS G
                                JOIN DOCENTES D
								ON G.ID_DOCENTE = D.ID
						WHERE 
								D.ID = ID_PROFE);
    
    SET ID_CHAT_DOC = (SELECT
								ID
						FROM 
								CHATS
						WHERE 
								ID_GRUPO = ID_GRUPO_DOC);
                                
	-- Eliminamos los mensajes del grupo del docente
    UPDATE 
		MENSAJES
	SET
		DELETED = 1
	WHERE 
		ID_CHAT = ID_CHAT_DOC;
        
	-- Eliminamos el chat del grupo del docente
    UPDATE 
		CHATS
	SET
		DELETED = 1
	WHERE 
		ID = ID_CHAT_DOC;
    
    
    -- Eliminamos los estudiantes de todos los grupos del docente
    UPDATE
		GRUPOS_ESTUDIANTES
	SET
		DELETED = 1
	WHERE 
		ID_GRUPO = ID_GRUPO_DOC;
        
    -- Eliminamos las actividades de todos los grupos del docente
    UPDATE
		ACTIVIDADES_GRUPOS
	SET
		DELETED = 1
	WHERE 
		ID_GRUPO = ID_GRUPO_DOC;
	
    -- Eliminamos todos los grupos del docente
	UPDATE
		GRUPOS
	SET
		DELETED = 1
	WHERE 
		ID = ID_GRUPO_DOC;
    
    -- El docente ha sido eliminado con éxito
    SET _RESULTADO = 0;
    SET _MENSAJE = 'El docente ha sido eliminado con éxito';
END
// DELIMITER ;


/*
* PA_ELIMINAR_MANAGER
* Descripción: Procedimiento para eliminar managers de centro de la BBDD
* Parámetros de entrada:
*						_NICK_MANAGER --> Nick del estudiante que vamos a eliminar
* Parámetros de salida:
*						_RESULTADO --> Resultado del procedimiento
*						_MENSAJE --> Mensaje Explicativo
*/

DROP PROCEDURE IF EXISTS PA_ELIMINAR_MANAGER;

DELIMITER //
CREATE PROCEDURE PA_ELIMINAR_MANAGER(IN _NICK_MANAGER VARCHAR(12),
								     OUT _RESULTADO INT,
								     OUT _MENSAJE TEXT)
BEGIN
	DECLARE CANT_MANAGERS INT;
                           
    SET CANT_MANAGERS = (SELECT 
							COUNT(M.ID) 
						 FROM 
							MANAGER_COLEGIO M
                            JOIN COLEGIOS C
                            ON M.ID_COLEGIO = C.ID
						 WHERE
							C.ID = (SELECT C.ID FROM MANAGER_COLEGIO M JOIN COLEGIOS C ON M.ID_COLEGIO = C.ID WHERE M.ID = ID_MAN));
	IF CANT_MANAGERS < 2 THEN
		-- Un colegio debe tener al menos un MANAGER
		SET _RESULTADO = -1;
        SET _MENSAJE = 'Un colegio debe tener al menos un MANAGER';
	ELSE
		UPDATE
			MANAGER_COLEGIO
		SET 
			DELETED = 1
        WHERE 
			ID = (SELECT ID FROM MANAGER_COLEGIO WHERE NICK = _NICK_MANAGER);
		-- Manager eliminado con éxito
		SET _RESULTADO = 0;
        SET _MENSAJE = 'Manager eliminado con éxito';
	END IF;
END
// DELIMITER ;


DELIMITER $$
 
CREATE PROCEDURE pa_login(IN pv_username VARCHAR(100), IN pv_password VARCHAR(50), OUT pv_success BOOLEAN)
BEGIN
    DECLARE _t = LEFT(pv_username, 1);
    IF _table = 'M' THEN
        SET pv_success = (SELECT 1 FROM COLEGIO_MANAGER WHERE NICK = pv_username AND CONTRASENA = MD5(pv_password));
    END IF;
    IF _table = 'S' THEN
        SET pv_success = (SELECT 1 FROM ESTUDIANTES WHERE NICK = pv_username AND CONTRASENA = MD5(pv_password));
    END IF;
    IF _table = 'T' THEN
        SET pv_success = (SELECT 1 FROM DOCENTES WHERE NICK = pv_username AND CONTRASENA = MD5(pv_password));
    END IF;
    IF _table = 'P' THEN
        SET pv_success = (SELECT 1 FROM TUTORES WHERE NICK = pv_username AND CONTRASENA = MD5(pv_password));
    END IF;    
END ;
 
CREATE PROCEDURE pa_delete(INT pv_idgrupo INT , OUT pv_success BOOLEAN)
BEGIN
    UPDATE GRUPOS SET DELETED = 1, FECHA_DELETED = CURRENT_TIMESTAMP() WHERE ID = pv_idgrupo;
END ;
 
CREATE PROCEDURE pa_create_license(OUT key VARCHAR(100))
BEGIN
    SET key = GenerarLicence();
END ;
DELIMITER ;
 
 
drop function if exists GenerateLicence;
DELIMITER //
CREATE FUNCTION GenerateLicence()
returns varchar(29)
begin
    declare vi_r int;
    declare vv_word varchar(29);
    declare vi_cont int;
    declare vi_cont_2 int;
    set vi_cont = 0;
    set vi_cont_2 = 0;
    set vv_word = '';
    WHILE vi_cont < 29 DO
        if vi_cont_2 = 5 then
            set vv_word = concat(vv_word, '-');
            set vi_cont = vi_cont + 1;
            set vi_cont_2 = 0;
        else
            set vv_word = concat(vv_word, upper(substr('abcdefghijklmnopqrstuvwxyz1234567890', floor(rand()*35), 1)));
            set vi_cont = vi_cont + 1;
            set vi_cont_2 = vi_cont_2 + 1;
        end if;
    END WHILE;
    RETURN vv_word;
end //
DELIMITER ;

