
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
-- Creacion de secuencias para los IDs
CREATE  SEQUENCE seq_clientes START WITH 1 INCREMENT BY 1;
CREATE  SEQUENCE seq_categorias START WITH 1 INCREMENT BY 1;
CREATE  SEQUENCE seq_productos START WITH 1 INCREMENT BY 1;
CREATE  SEQUENCE seq_pedidos START WITH 1 INCREMENT BY 1;
CREATE  SEQUENCE seq_det_ped START WITH 1 INCREMENT BY 1;
CREATE  SEQUENCE seq_det_prod_cat START WITH 1 INCREMENT BY 1;

-- Insertar datos de las tablas 
-- Tablas categorias 
insert into categorias VALUES (seq_categorias.NEXTVAL, 'Electronica', 'ElectronicaDescripcion',1);
insert into categorias VALUES (seq_categorias.NEXTVAL, 'Libros', 'Libros de Electronica Descripcion',1);
insert into categorias VALUES (seq_categorias.NEXTVAL, 'IA', 'software con IA Descripcion',1);

select * from categorias;
SELECT ID_CATEGORIA, NOMBRE_CATEGORIA from categorias;

-- Tabla clientes 
INSERT INTO clientes VALUES (seq_clientes.nextval,'Julio','Olivares','julioOlivares@gmail.com','941258963');
INSERT INTO clientes VALUES (seq_clientes.nextval,'Jose','Meza','JoseMeza@gmail.com','945632189');
INSERT INTO clientes VALUES (seq_clientes.nextval,'Jerson','More','JersonMore@gmail.com','948754648');
select * from clientes;