use schoolerzz;

-- COLEGIOS
insert into COLEGIOS(ID, NOMBRE, CODIGO_COLEGIO, LETRAS_3, PAIS, CIUDAD, CP, DIRECCION, DELETED, F_BORRADO)
                    VALUES(1, 'JOYFE', 28026183, 'JOY', 'ESPAÑA', 'MADRID', 28017, 'CALLE VITAL AZA, 65', 0, NULL);
insert into COLEGIOS(ID, NOMBRE, CODIGO_COLEGIO, LETRAS_3, PAIS, CIUDAD, CP, DIRECCION, DELETED, F_BORRADO)
                    VALUES(2, 'MATER IMMACULATA', 28007991, 'MAT', 'ESPAÑA', 'MADRID', 28027, 'CALLE MADRE ANTONIA PARIS, 1', 0, NULL);

-- MANAGERS
insert into MANAGER_COLEGIO(ID, NOMBRE, APELLIDO_1, APELLIDO_2, FECHA_NACIMIENTO, NACIONALIDAD, PAIS, CIUDAD, CP, DIRECCION, EMAIL, NICK, CONTRASENA, TELEFONO_1, TELEFONO_2, ID_COLEGIO, DELETED, F_BORRADO)
                            VALUES(1, 'MARIA TERESA', 'MARTINEZ', 'PUCHE', '1970-01-01', 'ESPAÑOLA', 'ESPAÑA', 'RIVAS VACIAMADRID', 28521, 'CALLE ROBLEDO, 2', 'M.TERESA.MARTINEZ@IEPGROUP.ES', FN_CREAR_NICK('M', 'JOYFE', 1), md5('1234'), '+34678901234', '+34910234567',1,0,NULL);
insert into MANAGER_COLEGIO(ID, NOMBRE, APELLIDO_1, APELLIDO_2, FECHA_NACIMIENTO, NACIONALIDAD, PAIS, CIUDAD, CP, DIRECCION, EMAIL, NICK, CONTRASENA, TELEFONO_1, TELEFONO_2, ID_COLEGIO, DELETED, F_BORRADO)
                            VALUES(2, 'PILAR', 'SANTOS', 'MENENDEZ', '1902-01-01', 'ESPAÑOLA', 'ESPAÑA', 'MADRID', 28027, 'CALLE MADRE ANTONIA PARÍS, 1', 'SOR.PRESA@DIOS.GOD', FN_CREAR_NICK('M', 'MATER IMMACULATA', 2), md5('1234'), '+34666666666', '+34915555555',2,0,NULL);

-- EMBLEMAS
INSERT INTO EMBLEMAS(ID, NOMBRE, DESCRIPCION, DELETED, F_BORRADO)
                    VALUES(1, 'PITAGORIN','AS DEL CALCULO', 0, NULL);
INSERT INTO EMBLEMAS(ID, NOMBRE, DESCRIPCION, DELETED, F_BORRADO)
                    VALUES(2, 'CERVANTES', 'CRACK DE LENGUA', 0, NULL);

-- SKINS
INSERT INTO SKINS(ID, NOMBRE, DESCRIPCION, RUTA, TIPO, DELETED, F_BORRADO)
                    VALUES(1, 'BOLI BUC ROJO','CASCO TAPA BOLI ROJO','C:\\IMAGES', 2, 0, NULL);
INSERT INTO SKINS(ID, NOMBRE, DESCRIPCION, RUTA, TIPO, DELETED, F_BORRADO)
                    VALUES(2, 'BOLI PAILOT AZUL','CASCO PAILOT AZUL', 'C:\\IMAGES', 1, 0, NULL);
INSERT INTO SKINS(ID, NOMBRE, DESCRIPCION, RUTA, TIPO, DELETED, F_BORRADO)
                    VALUES(3, 'PLUMAS PICOS DE EUROPA','SKIN DE PLUMA ESTILOGRÁFICA', 'C:\\IMAGES', 0, 0, NULL);

-- DOCENTES
insert into DOCENTES(ID, NOMBRE, APELLIDO_1, APELLIDO_2, FECHA_NACIMIENTO, NACIONALIDAD, PAIS, CIUDAD, CP, DIRECCION, EMAIL, NICK, CONTRASENA, TELEFONO_1, TELEFONO_2, DELETED, F_BORRADO)
                            VALUES(1, 'JUAN JOSE', 'RODRIGUEZ', 'CALLEJA', '1982-01-01', 'ESPAÑOLA', 'ESPAÑA', 'SAN FERNANDO DE HENARES', 28824, 'PLAZA DEL ANGEL, 2', 'JON.RODRIGUEZ@IEPGROUP.ES', FN_CREAR_NICK('D', 'JOYFE', 1 ), md5('1234'), '+346543321098', '+34916723265',0,NULL);
insert into DOCENTES(ID, NOMBRE, APELLIDO_1, APELLIDO_2, FECHA_NACIMIENTO, NACIONALIDAD, PAIS, CIUDAD, CP, DIRECCION, EMAIL, NICK, CONTRASENA, TELEFONO_1, TELEFONO_2, DELETED, F_BORRADO)
                            VALUES(2, 'REMEDIOS', 'FUERTES', 'CRISTIANDAD', '1921-01-01', 'ESPAÑOLA', 'ESPAÑA', 'MADRID', 28011, 'CALLE VIRGEN DE LA HIGUERA, 2', 'REME.FUERTES@DIOS.GOD', FN_CREAR_NICK('D', 'MATER IMMACULATA', 2 ), md5('1234'), '+34642097531', '+34912032031',0,NULL);

-- SKINS DOCENTES
INSERT INTO SKINS_DOCENTES(ID, ID_DOCENTE, ID_SKIN, DELETED, F_BORRADO)
                            VALUES(1, 1, 1, 0 ,NULL);
INSERT INTO SKINS_DOCENTES(ID, ID_DOCENTE, ID_SKIN, DELETED, F_BORRADO)
                            VALUES(2, 2, 3, 0 ,NULL);

-- HILOS
INSERT INTO HILOS(ID, TITULO, FECHA_CREACION, ID_DOCENTE, DELETED, F_BORRADO)
                            VALUES(1, 'PRIMER HILO', CURRENT_TIMESTAMP(),1, 0 ,NULL);
INSERT INTO HILOS(ID, TITULO, FECHA_CREACION, ID_DOCENTE, DELETED, F_BORRADO)
                            VALUES(2, 'SEGUNDO HILO', CURRENT_TIMESTAMP(), 1, 0 ,NULL);

-- POSTS
INSERT INTO POSTS(ID, TITULO, FECHA_CREACION, BODY, EDITADO, FECHA_EDICION, ID_DOCENTE, ID_HILO, DELETED, F_BORRADO)
                            VALUES(1, 'PRIMER POST', CURRENT_TIMESTAMP(), 'BUENA DOCENTES', NULL, NULL, 1, 1, 0 , NULL);

INSERT INTO POSTS(ID, TITULO, FECHA_CREACION, BODY, EDITADO, FECHA_EDICION, ID_DOCENTE, ID_HILO, DELETED, F_BORRADO)
                            VALUES(2, 'SEGUNDO POST', CURRENT_TIMESTAMP(), 'HOLA BUENAS', NULL, NULL, 2, 1, 0 , NULL);

-- TUTORES
insert into TUTORES(ID, NOMBRE, APELLIDO_1, APELLIDO_2, FECHA_NACIMIENTO, NACIONALIDAD, PAIS, CIUDAD, CP, DIRECCION, EMAIL, NICK, CONTRASENA, TELEFONO_1, TELEFONO_2, DELETED, F_BORRADO)
                            VALUES(1, 'FRANCISCO', 'GIMENEZ', 'PEREZ', '1982-01-01', 'ESPAÑOLA', 'ESPAÑA', 'MADRID', 28022, 'CALLE SUECIA, 2', 'FRAN.GIPE@PADRE.ES', FN_CREAR_NICK('T', 'JOYFE', 1 ), md5('1234'), '+34915357852', '+34919874563',0,NULL);
insert into TUTORES(ID, NOMBRE, APELLIDO_1, APELLIDO_2, FECHA_NACIMIENTO, NACIONALIDAD, PAIS, CIUDAD, CP, DIRECCION, EMAIL, NICK, CONTRASENA, TELEFONO_1, TELEFONO_2, DELETED, F_BORRADO)
                            VALUES(2, 'MERCEDES', 'MILANO', 'MILANO', '1974-01-01', 'ESPAÑOLA', 'ESPAÑA', 'MADRID', 28001, 'CALLE CENTRO, 2', 'MERCEDES.MILANO@MADRE.ES', FN_CREAR_NICK('T', 'MATER IMMACULATA', 2 ), md5('1234'), '+34678891248', '+34917526436',0,NULL);

-- ESTUDIANTES
insert into ESTUDIANTES(ID, NOMBRE, APELLIDO_1, APELLIDO_2, FECHA_NACIMIENTO, NACIONALIDAD, PAIS, CIUDAD, CP, DIRECCION, EMAIL, NICK, CONTRASENA, DATOS_MEDICOS, OBSERVACIONES, RUTA_FOTO, DELETED, F_BORRADO)
                            VALUES(1, 'CARMEN', 'GIMENEZ', 'GURRERO', '2010-01-01', 'ESPAÑOLA', 'ESPAÑA', 'MADRID', 28022, 'CALLE SUECIA, 2', 'CARMEN.MONTAÑA.GUERRERO@ALUMNOJOYFE.IEPGROUP.ES', FN_CREAR_NICK('E', 'JOYFE', 1 ), md5('1234'), 'SANA', 'MUY INTELIGENTE', 'C:\\IMAGES\FOTO.PNG',0,NULL);
insert into ESTUDIANTES(ID , NOMBRE, APELLIDO_1, APELLIDO_2, FECHA_NACIMIENTO, NACIONALIDAD, PAIS, CIUDAD, CP, DIRECCION, EMAIL, NICK, CONTRASENA, DATOS_MEDICOS, OBSERVACIONES, RUTA_FOTO, DELETED, F_BORRADO)
                            VALUES(2, 'CARLOS', 'MILANO', 'MELGAREJO', '2009-01-01', 'ESPAÑOLA', 'ESPAÑA', 'MADRID', 28001, 'CALLE CENTRO, 2', 'CARLOS.MILANO.MELGAREJO@ALUMNOJOYFE.IEPGROUP.ES', FN_CREAR_NICK('E', 'MATER IMMACULATA', 2), md5('1234'), 'SANO', 'TDAH', 'C:\\IMAGES\FOTICO.PNG',0,NULL);

-- SKINS ESTUDIANTES
INSERT INTO EMBLEMAS_ESTUDIANTES(ID, ID_ESTUDIANTE, ID_EMBLEMA, DELETED, F_BORRADO)
                                VALUES(1, 1, 1, 0, NULL);
INSERT INTO EMBLEMAS_ESTUDIANTES(ID, ID_ESTUDIANTE, ID_EMBLEMA, DELETED, F_BORRADO)
                                VALUES(2, 2, 2, 0, NULL);

-- TUTORES_ESTUDIANTES
INSERT INTO TUTORES_ESTUDIANTES(ID, ID_ESTUDIANTE, ID_TUTOR, DELETED, F_BORRADO)
                                VALUES(1, 1, 1, 0, NULL);
INSERT INTO TUTORES_ESTUDIANTES(ID, ID_ESTUDIANTE, ID_TUTOR, DELETED, F_BORRADO)
                                VALUES(2, 2, 2, 0, NULL);

-- SKINS ESTUDIANTES
INSERT INTO SKINS_ESTUDIANTES(ID, ID_ESTUDIANTE, ID_SKIN, DELETED, F_BORRADO)
                                VALUES(1, 1, 2, 0, NULL);
INSERT INTO SKINS_ESTUDIANTES(ID, ID_ESTUDIANTE, ID_SKIN, DELETED, F_BORRADO)
                                VALUES(2, 2, 3, 0, NULL);

-- GRUPOS
INSERT INTO GRUPOS(ID, CICLO, CURSO, CLASE, ID_COLEGIO, ID_DOCENTE, DELETED, F_BORRADO)
                    VALUES(1, 'PRIMARIA', 6, 1, 1, 1, 0, NULL);
INSERT INTO GRUPOS(ID, CICLO, CURSO, CLASE, ID_COLEGIO, ID_DOCENTE, DELETED, F_BORRADO)
                    VALUES(2, 'PRIMARIA', 4, 2, 2, 2, 0, NULL);

-- CHATS
INSERT INTO CHATS(ID, NOMBRE, RUTA_IMAGEN, ID_GRUPO, DELETED, F_BORRADO)
                    VALUES(1, 'COLEGUITAS', 'C:\\IMAGES\CHAT1.PNG', 1, 0, NULL);
INSERT INTO CHATS(ID, NOMBRE, RUTA_IMAGEN, ID_GRUPO, DELETED, F_BORRADO)
                    VALUES(2, 'AMIGUIS', 'C:\\IMAGES\CHAT2.PNG', 2, 0, NULL);

-- MENSAJES
INSERT INTO MENSAJES(ID, BODY, FECHA_ENVIO, ID_CHAT, DELETED, F_BORRADO)
                    VALUES(1, 'HOLIIIIIIIIIII', CURRENT_TIMESTAMP(), 1, 0, NULL);
INSERT INTO MENSAJES(ID, BODY, FECHA_ENVIO, ID_CHAT, DELETED, F_BORRADO)
                    VALUES(2, 'SOY EL NUEVOOOOO', CURRENT_TIMESTAMP(), 2, 0, NULL);

-- ASIGNATURAS
INSERT INTO ASIGNATURAS(ID, NOMBRE, DELETED, F_BORRADO)
                        VALUES(1, 'MATES', 0, NULL);
INSERT INTO ASIGNATURAS(ID, NOMBRE, DELETED, F_BORRADO)
                        VALUES(2, 'LENGUA', 0, NULL);

-- GRUPOS_ESTUDIANTES
INSERT INTO GRUPOS_ESTUDIANTES(`ID`,`NOMBRE`,`NOTAS_TRIMESTRE_1`,`NOTAS_TRIMESTRE_2`,`NOTAS_TRIMESTRE_3`,`NOTAS_FINAL`,`FALTAS_ASISTENCIA_1`,`FALTAS_ASISTENCIA_2`,`FALTAS_ASISTENCIA_3`,`FALTAS_ASISTENCIA_FINAL`,`FALTAS_JUSTIFICADAS_1`,`FALTAS_JUSTIFICADAS_2`,`FALTAS_JUSTIFICADAS_3`,`FALTAS_JUSTIFICADAS_FINAL`,`RETRASOS_1`,`RETRASOS_2`,`RETRASOS_3`,`RETRASOS_FINAL`,`ID_GRUPO`,`ID_ESTUDIANTE`,`ID_ASIGNATURA`,`DELETED`, F_BORRADO)
                            VALUES(1, 'MATES 6A', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, NULL);
INSERT INTO GRUPOS_ESTUDIANTES(`ID`,`NOMBRE`,`NOTAS_TRIMESTRE_1`,`NOTAS_TRIMESTRE_2`,`NOTAS_TRIMESTRE_3`,`NOTAS_FINAL`,`FALTAS_ASISTENCIA_1`,`FALTAS_ASISTENCIA_2`,`FALTAS_ASISTENCIA_3`,`FALTAS_ASISTENCIA_FINAL`,`FALTAS_JUSTIFICADAS_1`,`FALTAS_JUSTIFICADAS_2`,`FALTAS_JUSTIFICADAS_3`,`FALTAS_JUSTIFICADAS_FINAL`,`RETRASOS_1`,`RETRASOS_2`,`RETRASOS_3`,`RETRASOS_FINAL`,`ID_GRUPO`,`ID_ESTUDIANTE`,`ID_ASIGNATURA`,`DELETED`, F_BORRADO)
                            VALUES(2, 'LENGUA 4E', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, NULL);

-- ACTIVIDADES
INSERT INTO ACTIVIDADES(ID, TITULO, FECHA_FIN, FECHA_CREACION, FECHA_ACTUALIZACION, RUTA, CONTENIDO, DELETED, F_BORRADO)
                        VALUES(1, 'EJ1', '2022-09-02', CURRENT_TIMESTAMP(), NULL, 'C:\\IMAGES', 'Matematicas',0, null);
INSERT INTO ACTIVIDADES(ID, TITULO, FECHA_FIN, FECHA_CREACION, FECHA_ACTUALIZACION, RUTA, CONTENIDO, DELETED, F_BORRADO)
                        VALUES(2, 'EJ2', '2022-09-15', CURRENT_TIMESTAMP(), NULL, 'C:\\IMAGES', 'Lengua',0, null);
-- ACTIVIDADES_GRUPOS(
INSERT INTO ACTIVIDADES_GRUPOS(ID, ID_ACTIVIDAD, ID_GRUPO, DELETED, F_BORRADO)
                        VALUES(1, 1, 1, 0, NULL);
INSERT INTO ACTIVIDADES_GRUPOS(ID, ID_ACTIVIDAD, ID_GRUPO, DELETED, F_BORRADO)
                        VALUES(2, 2, 2, 0, NULL);
