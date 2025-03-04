
CREATE DATABASE ProyectoDeportes

--Tablas

CREATE TABLE USUARIO(
USUARIO_ID numeric(8) NOT NULL,
TIPO_USUARIO varchar(15),
CONTRASENNA nvarchar(20)
);
GO

CREATE TABLE PERSONA(
PERSONA_ID numeric(8) NOT NULL,
NOMBRE varchar(50),
APELLIDO1 varchar(50),
APELLIDO2 varchar(50),
DIREC_ID numeric(8,0) NOT NULL,
EMAIL varchar(50)
)

CREATE TABLE DEPORTISTA(
DEPORTISTA_ID  numeric(8) NOT NULL,
PERSONA_ID numeric(8) NOT NULL,
TEL_ID numeric(8,0) NOT NULL,
TIPO_DEPORTE_ID numeric(8,0) NOT NULL,
PESO int,
TALLA int,
ALTURA int,
OBJETIVOS varchar(250),
ESTADO bit,
COD_USUARIO_REGISTRA numeric(1,0),
FECHA_REGISTRA int,
COD_USUARIO_EDITA numeric(1,0),
FECHA_EDITA int
);
GO

CREATE TABLE INSTRUCTOR(
INSTRUCTOR_ID numeric(8) NOT NULL,
PERSONA_ID numeric(8) NOT NULL, 
TIPO_DEPORTE_ID numeric(8,0) NOT NULL,
PLAN_ID numeric(8) NOT NULL,
COD_USUARIO_REGISTRA numeric(1,0),
FECHA_REGISTRA int,
COD_USUARIO_EDITA numeric(1,0),
FECHA_EDITA int
);
GO



CREATE TABLE REGISTRO_ACTIVIDAD(
ACTIVIDAD_ID numeric(8) NOT NULL,
PLAN_ID numeric(8) NOT NULL,
ACTIVIDAD_DSC nvarchar(100),
DIA int,
COD_USUARIO_REGISTRA numeric(1,0),
FECHA_REGISTRA int,
COD_USUARIO_EDITA numeric(1,0),
FECHA_EDITA int
);
GO



--------------------------------

CREATE TABLE PROVINCIA(
PROVI_ID numeric (18,0)NOT NULL,
DSC_PROVIN nvarchar(50),
DSC_CORTA_PROVIN nvarchar(50),
ESTADO_PROVIN numeric (18,0)
);
GO

CREATE TABLE CANTON(
CANTON_ID numeric(18,0) NOT NULL,
PROVI_ID numeric (18,0) NOT NULL,
DSC_CANTON nvarchar(100),
ESTADO_CANTON numeric(18,0)
);
GO 

CREATE TABLE DISTRITO(
DISTRI_ID numeric (18,0) NOT NULL,
PROVI_ID numeric (18,0) NOT NULL,
CANTON_ID numeric(18,0) NOT NULL,
DSC_DISTRI nvarchar(100),
ESTADO_DISTRI numeric(18,0)
);
GO

CREATE TABLE BARRIO(
BARRIO_ID numeric (18,0) NOT NULL,
CANTON_ID  numeric(18,0) NOT NULL,
DISTRI_ID numeric (18,0) NOT NULL,
PROVI_ID numeric (18,0) NOT NULL,
DSC_BARRIO nvarchar(50),
ESTADO_BARRIO int
);
GO

CREATE TABLE DIRECCION(
DIREC_ID numeric(8,0) NOT NULL,
BARRIO_ID numeric (18,0) NOT NULL,
CANTON_ID  numeric(18,0) NOT NULL,
DISTRI_ID numeric (18,0) NOT NULL,
PROVI_ID numeric (18,0) NOT NULL,
OTRAS_SENNAS varchar(200),
ESTADO bit,
COD_USUARIO_REGISTRA numeric(1,0),
FECHA_REGISTRA int,
COD_USUARIO_EDITA numeric(1,0),
FECHA_EDITA int
);
GO

CREATE TABLE TELEFONO(
TEL_ID numeric(8,0) NOT NULL,
TIPOTEL_ID numeric(1,0),
DESCRIPCION varchar(50),
NUMERO int,
ESTADO int,
COD_USUARIO_REGISTRA numeric(1,0),
FECHA_REGISTRA int,
COD_USUARIO_EDITA numeric(1,0),
FECHA_EDITA int
);
GO

CREATE TABLE TIPO_TELEFONO(
TIPOTEL_ID numeric(1,0) NOT NULL,
DESCRIPCION varchar(50),
ESTADO int,
COD_USUARIO_REGISTRA numeric(1,0),
FECHA_REGISTRA date,
COD_USUARIO_EDITA numeric(1,0),
FECHA_EDITA date
);
GO

------------------------------------------
CREATE TABLE PLAN_DEPORTIVO(
PLAN_ID numeric(8) NOT NULL,
DEPORTISTA_ID  numeric(8) NOT NULL,
INSTRUCTOR_ID numeric(8)NOT NULL,
FECHA_INICIO int,
FECHA_FINAL int,
COD_USUARIO_REGISTRA numeric(1,0),
FECHA_REGISTRA int,
COD_USUARIO_EDITA numeric(1,0),
FECHA_EDITA int

);
GO


CREATE TABLE ENCABEZADO_PLAN(
DETALLE_ID numeric(8)NOT NULL,
PLAN_ID numeric(8) NOT NULL,
DEPORTISTA_ID  numeric(8) NOT NULL,
DURACION numeric(8) NOT NULL,
CANTIDAD_REPETICIONES int,
PERIOCIDAD numeric(8),
FECHA_INICIO int,
FECHA_FINAL int,
DESCRIPCION varchar(50),
COD_USUARIO_REGISTRA numeric(1,0),
FECHA_REGISTRA int,
COD_USUARIO_EDITA numeric(1,0),
FECHA_EDITA int
);
GO

CREATE TABLE TIPO_DEPORTE(
TIPO_DEPORTE_ID numeric(8,0) NOT NULL,
DESCRIPCION varchar(50),
ESTADO int
);
GO


--Llaves PK
ALTER table USUARIO add constraint  USUARIO_PK primary key(USUARIO_ID);
ALTER table PERSONA add constraint  PERSONA_PK primary key(PERSONA_ID);
ALTER table DEPORTISTA add constraint  DEPORTISTA_PK primary key(DEPORTISTA_ID);
ALTER table INSTRUCTOR add constraint  INSTRUCTOR_PK primary key(INSTRUCTOR_ID);
ALTER table REGISTRO_ACTIVIDAD add constraint  REGISTRO_PK primary key(ACTIVIDAD_ID);

ALTER table PROVINCIA add constraint  PROVINCIA_PK primary key(PROVI_ID);
ALTER table CANTON add constraint  CANTON_PK primary key(CANTON_ID,PROVI_ID);
ALTER table DISTRITO add constraint  DISTRITO_PK primary key(DISTRI_ID,PROVI_ID,CANTON_ID);
ALTER table BARRIO add constraint  BARRIO_PK primary key(BARRIO_ID,DISTRI_ID,PROVI_ID,CANTON_ID);
ALTER table DIRECCION add constraint  DIRECCION_PK primary key(DIREC_ID);

ALTER table TELEFONO add constraint  TELEFONO_PK primary key(TEL_ID);
ALTER table TIPO_TELEFONO add constraint  TIPTELEFONO_PK primary key(TIPOTEL_ID);
ALTER table PLAN_DEPORTIVO add constraint  PLANDEP_PK primary key(PLAN_ID);
ALTER table ENCABEZADO_PLAN add constraint  ENCABEZADO_PK primary key(DETALLE_ID);
ALTER table TIPO_DEPORTE add constraint  TIPDEP_PK primary key(TIPO_DEPORTE_ID);



--Llaves FK
--LLAVE PERSONA

ALTER TABLE PERSONA ADD constraint PERSONA_DIRECFK  FOREIGN KEY (DIREC_ID) REFERENCES DIRECCION (DIREC_ID);

--LLAVE DEPORTISTA
ALTER TABLE DEPORTISTA ADD constraint DEPOR_PERSONAID_FK  FOREIGN KEY(PERSONA_ID) REFERENCES PERSONA (PERSONA_ID);
ALTER TABLE DEPORTISTA ADD constraint DEPOR_TELID_FK  FOREIGN KEY(TEL_ID) REFERENCES TELEFONO (TEL_ID);
ALTER TABLE DEPORTISTA ADD constraint DEPOR_TIPO_DEPORTE_FK  FOREIGN KEY(TIPO_DEPORTE_ID) REFERENCES TIPO_DEPORTE (TIPO_DEPORTE_ID); 

--LLAVE REGISTRO_ACTIVIDAD
ALTER TABLE REGISTRO_ACTIVIDAD ADD constraint REGIS_DIRECFK  FOREIGN KEY (PLAN_ID) REFERENCES PLAN_DEPORTIVO (PLAN_ID);

--LLAVE CANTON
ALTER TABLE CANTON ADD constraint CANTON_PROVIFK  FOREIGN KEY (PROVI_ID) REFERENCES PROVINCIA (PROVI_ID);
--LLAVE DISTRITO
ALTER TABLE DISTRITO ADD constraint DISTI_CANTONFK  FOREIGN KEY (CANTON_ID,PROVI_ID) REFERENCES CANTON (CANTON_ID,PROVI_ID);

--LLAVE BARRIO FK
ALTER TABLE BARRIO ADD constraint BARRIO_CANTONFK  FOREIGN KEY (DISTRI_ID,PROVI_ID,CANTON_ID) REFERENCES DISTRITO (DISTRI_ID,PROVI_ID,CANTON_ID);
/*ALTER TABLE BARRIO ADD constraint BARRIO_DISFK  FOREIGN KEY (DISTRI_ID) REFERENCES DISTRITO (DISTRI_ID);
ALTER TABLE BARRIO ADD constraint BARRIO_PROVIFK  FOREIGN KEY (PROVI_ID) REFERENCES PROVINCIA (PROVI_ID);*/

--LLAVE DIRECCION FK
/*ALTER TABLE DIRECCION ADD constraint DIREC_PROVIFK  FOREIGN KEY (PROVI_ID) REFERENCES PROVINCIA (PROVI_ID);
ALTER TABLE DIRECCION ADD constraint DIREC_CANTONFK  FOREIGN KEY (CANTON_ID) REFERENCES CANTON (CANTON_ID);
ALTER TABLE DIRECCION ADD constraint DIREC_DISTRIFK  FOREIGN KEY (DISTRI_ID) REFERENCES DISTRITO (DISTRI_ID);*/
ALTER TABLE DIRECCION ADD constraint DIREC_BARRIOFK  FOREIGN KEY (BARRIO_ID,DISTRI_ID,PROVI_ID,CANTON_ID) REFERENCES BARRIO (BARRIO_ID,DISTRI_ID,PROVI_ID,CANTON_ID);

--LLAVE TELEFONO FK 
ALTER TABLE TELEFONO ADD constraint TEL_TIPTELFK  FOREIGN KEY (TIPOTEL_ID) REFERENCES TIPO_TELEFONO (TIPOTEL_ID);

--LLAVE PLAN_DEPORTIVO
ALTER TABLE PLAN_DEPORTIVO ADD constraint PLAN_DEPFK  FOREIGN KEY (DEPORTISTA_ID) REFERENCES DEPORTISTA (DEPORTISTA_ID);
ALTER TABLE PLAN_DEPORTIVO ADD constraint PLAN_INSTRUCTOR_FK  FOREIGN KEY (INSTRUCTOR_ID) REFERENCES INSTRUCTOR (INSTRUCTOR_ID);

--LLAVE ENCABEZADO_PLAN
ALTER TABLE ENCABEZADO_PLAN ADD constraint ENCABEZADO_DEPFK  FOREIGN KEY (DEPORTISTA_ID) REFERENCES DEPORTISTA (DEPORTISTA_ID);
ALTER TABLE ENCABEZADO_PLAN ADD constraint ENCABEZADO_PLANFK  FOREIGN KEY (PLAN_ID) REFERENCES PLAN_DEPORTIVO (PLAN_ID);


 DROP TABLE ENCABEZADO_PLAN
DROP TABLE BARRIO
DROP TABLE CANTON
DROP TABLE PROVINCIA
DROP TABLE DIRECCION
DROP TABLE DISTRITO
DROP TABLE ENCABEZADO_PLAN
DROP TABLE INSTRUCTOR
DROP TABLE PLAN_DEPORTIVO
DROP TABLE REGISTRO_ACTIVIDAD
DROP TABLE TELEFONO
DROP TABLE TIPO_TELEFONO
DROP TABLE DEPORTISTA