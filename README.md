-- Tabla AUTOR (CORRECTA)
CREATE TABLE AUTOR 
    ( 
     ID_Autor       INTEGER  NOT NULL , 
     Nombre_Autor   NVARCHAR2 (50)  NOT NULL , 
     Apellido_Autor NVARCHAR2 (50)  NOT NULL , 
     Fecha_Nacimi   DATE  NOT NULL , 
     Lugar_Natal    NVARCHAR2 (100)  NOT NULL 
    ) 
;

ALTER TABLE AUTOR 
    ADD CONSTRAINT AUTOR_PK PRIMARY KEY ( ID_Autor ) ;

-- Tabla CLIENTE (CON CORRECCIÓN)
CREATE TABLE CLIENTE 
    ( 
     ID_Cliente       INTEGER  NOT NULL , 
     Nombre_Cliente   NVARCHAR2 (70)  NOT NULL , 
     Apellido_Cliente NVARCHAR2 (70)  NOT NULL , 
     Email            NVARCHAR2 (100) , 
     Telefono         NVARCHAR2 (15)  NOT NULL  -- CORREGIDO: NVARCHAR2
    ) 
;

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( ID_Cliente ) ;

-- Tabla FORMA_PAGO (REDISEÑADA CORRECTAMENTE)
CREATE TABLE FORMA_PAGO 
    ( 
     ID_Forma_pago INTEGER  NOT NULL , 
     Nombre_Forma  NVARCHAR2(50) NOT NULL,  -- AÑADIDO: Ej: 'Tarjeta', 'Yape', 'Plin'
     Descripcion   NVARCHAR2(100)
    ) 
;

ALTER TABLE FORMA_PAGO 
    ADD CONSTRAINT FORMA_PAGO_PK PRIMARY KEY ( ID_Forma_pago ) ;

-- Tabla LIBRO (CON PRECIO CORREGIDO)
CREATE TABLE LIBRO 
    ( 
     ID_Libro       INTEGER  NOT NULL , 
     Titulo         NVARCHAR2 (100)  NOT NULL , 
     Precio         NUMBER (10,2)  NOT NULL ,  -- CORREGIDO: NUMBER(10,2)
     Fecha_Publi    DATE  NOT NULL , 
     AUTOR_ID_Autor INTEGER  NOT NULL 
    ) 
;

ALTER TABLE LIBRO 
    ADD CONSTRAINT LIBRO_PK PRIMARY KEY ( ID_Libro ) ;

-- Tabla TRANSACCION (CON FORMA_PAGO AÑADIDA)
CREATE TABLE TRANSACCION 
    ( 
     ID_transac         INTEGER  NOT NULL , 
     Fecha_Transa       DATE  NOT NULL , 
     Total              NUMBER(10,2)  NOT NULL ,  -- CORREGIDO: NUMBER
     CLIENTE_ID_Cliente INTEGER  NOT NULL ,
     FORMA_PAGO_ID_Forma_pago INTEGER NOT NULL  -- AÑADIDO
    ) 
;

ALTER TABLE TRANSACCION 
    ADD CONSTRAINT TRANSACCION_PK PRIMARY KEY ( ID_transac ) ;

-- Tabla DETAL_TRANSA (SIMPLIFICADA Y CORREGIDA)
CREATE TABLE DETAL_TRANSA 
    ( 
     ID_Delt_Transac        INTEGER  NOT NULL , 
     -- ELIMINADOS: ID_Transa, ID_Forma_pago, ID_Libro (redundantes)
     Cantidad               INTEGER  NOT NULL , 
     Precio_Unitario        NUMBER(10,2)  NOT NULL ,  -- CAMBIADO: Precio por unidad
     Subtotal               NUMBER(10,2)  NOT NULL ,  -- AÑADIDO: Cantidad * Precio_Unitario
     LIBRO_ID_Libro         INTEGER  NOT NULL , 
     TRANSACCION_ID_transac INTEGER  NOT NULL 
     -- ELIMINADO: FORMA_PAGO_ID_Forma_pago (ya está en TRANSACCION)
    ) 
;

ALTER TABLE DETAL_TRANSA 
    ADD CONSTRAINT DETAL_TRANSA_PK PRIMARY KEY ( ID_Delt_Transac ) ;

-- CONSTRAINTS CORREGIDOS
ALTER TABLE DETAL_TRANSA 
    ADD CONSTRAINT DETAL_TRANSA_LIBRO_FK FOREIGN KEY 
    ( 
     LIBRO_ID_Libro
    ) 
    REFERENCES LIBRO 
    ( 
     ID_Libro
    ) 
;

ALTER TABLE DETAL_TRANSA 
    ADD CONSTRAINT DETAL_TRANSA_TRANSACCION_FK FOREIGN KEY 
    ( 
     TRANSACCION_ID_transac
    ) 
    REFERENCES TRANSACCION 
    ( 
     ID_transac
    ) 
;

ALTER TABLE LIBRO 
    ADD CONSTRAINT LIBRO_AUTOR_FK FOREIGN KEY 
    ( 
     AUTOR_ID_Autor
    ) 
    REFERENCES AUTOR 
    ( 
     ID_Autor
    ) 
;

ALTER TABLE TRANSACCION 
    ADD CONSTRAINT TRANSACCION_CLIENTE_FK FOREIGN KEY 
    ( 
     CLIENTE_ID_Cliente
    ) 
    REFERENCES CLIENTE 
    ( 
     ID_Cliente
    ) 
;

-- NUEVO CONSTRAINT AÑADIDO
ALTER TABLE TRANSACCION 
    ADD CONSTRAINT TRANSACCION_FORMA_PAGO_FK FOREIGN KEY 
    ( 
     FORMA_PAGO_ID_Forma_pago
    ) 
    REFERENCES FORMA_PAGO 
    ( 
     ID_Forma_pago
    ) 
;
