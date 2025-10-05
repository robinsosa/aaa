-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2025-10-05 10:06:43 PET
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE Categorias 
    ( 
     Id_Categoria     INTEGER  NOT NULL , 
     Nombre_categoria NVARCHAR2 (50)  NOT NULL , 
     Descripcion      NVARCHAR2 (100) , 
     Estado           NUMBER  NOT NULL 
    ) 
;

ALTER TABLE Categorias 
    ADD CONSTRAINT Categorias_PK PRIMARY KEY ( Id_Categoria ) ;

CREATE TABLE Clientes 
    ( 
     Id_Cliente INTEGER  NOT NULL , 
     Nombre     NVARCHAR2 (50)  NOT NULL , 
     Apellido   NVARCHAR2 (50)  NOT NULL , 
     Email      NVARCHAR2 (100) , 
     Telefono   NCHAR (12) 
    ) 
;

ALTER TABLE Clientes 
    ADD CONSTRAINT Clientes_PK PRIMARY KEY ( Id_Cliente ) ;

CREATE TABLE Det_Prod_Cat 
    ( 
     Id_Det_Cat_Prod         INTEGER  NOT NULL , 
     Id_Producto             INTEGER , 
     Id_Categoria            INTEGER , 
     Productos_Id_Producto   INTEGER  NOT NULL , 
     Categorias_Id_Categoria INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Det_Prod_Cat 
    ADD CONSTRAINT Detalle_Producto_Categoria_PK PRIMARY KEY ( Id_Det_Cat_Prod ) ;

CREATE TABLE Detalle_Pedido 
    ( 
     Id_Detalle            INTEGER  NOT NULL , 
     Id_Pedido             INTEGER , 
     Id_Producto           INTEGER , 
     Cantidad              INTEGER  NOT NULL , 
     Precio_unitario       NUMBER (5,10) , 
     Pedidos_Id_Pedido     INTEGER  NOT NULL , 
     Productos_Id_Producto INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Detalle_Pedido 
    ADD CONSTRAINT Detalle_Pedido_PK PRIMARY KEY ( Id_Detalle ) ;

CREATE TABLE Pedidos 
    ( 
     Id_Pedido           INTEGER  NOT NULL , 
     Fecha_pedido        DATE  NOT NULL , 
     Id_Cliente          INTEGER , 
     Estado              CHAR (10 CHAR)  NOT NULL , 
     Clientes_Id_Cliente INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Pedidos 
    ADD CONSTRAINT Pedidos_PK PRIMARY KEY ( Id_Pedido ) ;

CREATE TABLE Productos 
    ( 
     Id_Producto     INTEGER  NOT NULL , 
     Nombre_producto NVARCHAR2 (100)  NOT NULL , 
     Descripcion     NVARCHAR2 (100) , 
     Precio          NUMBER (5,10)  NOT NULL , 
     Stock           INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Productos 
    ADD CONSTRAINT Productos_PK PRIMARY KEY ( Id_Producto ) ;

ALTER TABLE Det_Prod_Cat 
    ADD CONSTRAINT Det_Prod_Cat_Categorias_FK FOREIGN KEY 
    ( 
     Categorias_Id_Categoria
    ) 
    REFERENCES Categorias 
    ( 
     Id_Categoria
    ) 
;

ALTER TABLE Det_Prod_Cat 
    ADD CONSTRAINT Det_Prod_Cat_Productos_FK FOREIGN KEY 
    ( 
     Productos_Id_Producto
    ) 
    REFERENCES Productos 
    ( 
     Id_Producto
    ) 
;

ALTER TABLE Detalle_Pedido 
    ADD CONSTRAINT Detalle_Pedido_Pedidos_FK FOREIGN KEY 
    ( 
     Pedidos_Id_Pedido
    ) 
    REFERENCES Pedidos 
    ( 
     Id_Pedido
    ) 
;

ALTER TABLE Detalle_Pedido 
    ADD CONSTRAINT Detalle_Pedido_Productos_FK FOREIGN KEY 
    ( 
     Productos_Id_Producto
    ) 
    REFERENCES Productos 
    ( 
     Id_Producto
    ) 
;

ALTER TABLE Pedidos 
    ADD CONSTRAINT Pedidos_Clientes_FK FOREIGN KEY 
    ( 
     Clientes_Id_Cliente
    ) 
    REFERENCES Clientes 
    ( 
     Id_Cliente
    ) 
;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
