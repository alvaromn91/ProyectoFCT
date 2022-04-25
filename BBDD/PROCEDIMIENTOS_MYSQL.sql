use schoolerzz;
drop PROCEDURE if exists pa_crear_nick;

-- CreateNick: Crea un Nick único para un usuario
--     Parámetros Entrada
--         _tipo_usuario: tipo de usuario varchar(1);
--         _colegio: nombre del _colegio varchar(50);
--         _id_usuario: id del usuario al que quieres poner el Nick;
--     Parámetros de salida
--         _nick: el nick que quieres crear varchar(15);

DELIMITER //
create procedure pa_crear_nick(in _tipo_usuario varchar(1),
							      in _colegio varchar(50),
                                  in _id_usuario int,
                                  out _nick varchar(15))
begin 
	declare colegio_3_letras varchar(50);
    declare nombre_corto_usuario varchar(6);
    declare aletorio varchar(23);    
    declare nuevo_nick char;
    set nuevo_nick = substr('TRWAGMYFPDXBNJZSQVHLCKE', floor(rand()*23), 1);
    set colegio_3_letras = (select letras_3 from colegios where nombre like _colegio);
    if _tipo_usuario like 'S' then
        set nombre_corto_usuario = concat(lower(substr((select nombre from estudiantes where id = _id_usuario ),1,2)), lower(substr((select apellido_1 from estudiantes where id = _id_usuario),1,2)), lower(substr((select apellido_2 from estudiantes where id = _id_usuario ),1,2)));
    else
        if _tipo_usuario like 'T' then
            set nombre_corto_usuario = concat(lower(substr((select nombre from docentes where id = _id_usuario),1,2)), lower(substr((select apellido_1 from docentes where id = _id_usuario),1,2)), lower(substr((select apellido_2 from docentes where id = _id_usuario),1,2)));
        else
            if _tipo_usuario like 'M' then
                set nombre_corto_usuario = concat(lower(substr((select nombre from manager__colegio where id = _id_usuario),1,2)), lower(substr((select apellido_1 from manager__colegio where id = _id_usuario),1,2)), lower(substr((select apellido_2 from manager__colegio where id = _id_usuario),1,2)));
            else
                if _tipo_usuario like 'P' then
                    set nombre_corto_usuario = concat(lower(substr((select nombre from tutores where id = _id_usuario),1,2)), lower(substr((select apellido_1 from tutores where id = _id_usuario),1,2)), lower(substr((select apellido_2 from tutores where id = _id_usuario),1,2)));
                end if;
            end if;
        end if;
    end if;
    set _nick = concat(upper(_tipo_usuario),upper(colegio_3_letras),'-',upper(nombre_corto_usuario),nuevo_nick);
    while NOT((select id from estudiantes where nick like _nick) <=> NULL) DO
		set nuevo_nick = substr('TRWAGMYFPDXBNJZSQVHLCKE', floor(rand()*23), 1);
        set _nick = concat(upper(_tipo_usuario),upper(colegio_3_letras),'-',upper(nombre_corto_usuario),nuevo_nick);
    end while;
end;
// DELIMITER ;