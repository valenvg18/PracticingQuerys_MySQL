create database tienda;
use tienda;

create table CLIENTE(
NUM_DOCUMENTO INT(20) not null,
NOMBRE VARCHAR(25),
APELLIDOS VARCHAR(25),
EMAIL VARCHAR(45),
TELEFONO VARCHAR(45),
PRIMARY KEY (NUM_DOCUMENTO)
);

create table PRODUCTO(
CODIGO INT(13) primary key auto_increment,
NOMBRE VARCHAR(25),
CATEGORIA VARCHAR(20),
STOCK INT(100),
PRECIO INT(100)
)auto_increment = 100;

create table PROVEEDOR(
NIT VARCHAR(20) not null,
NOMBRE VARCHAR(45),
DIRECCION VARCHAR(45),
TELEFONO VARCHAR(45),
PRIMARY KEY (NIT)
);

create table FACTURA(
NUM_FACTURA INT(8) primary key auto_increment,
TIPO_DOCUMENTO VARCHAR(20),
NUM_DOCUMENTO VARCHAR(20) not null,
CODIGO_PRODUCTO INT(13),
FECHA_COMPRA DATE,
CANTIDAD INT(100),
PRECIO INT(100),
TOTAL INT(200)
)auto_increment = 1;

create table PROVEE(
NOMBRE_PRODUCTO VARCHAR(45),
NIT_PROVEEDOR VARCHAR (20),
PRECIO_COSTO INT(100),
CANTIDAD INT(10),
FECHA DATE,
PRIMARY KEY (CODIGO_PRODUCTO,NIT_PROVEEDOR)
);

INSERT INTO CLIENTE
(NUM_DOCUMENTO,NOMBRE,APELLIDOS,EMAIL,TELEFONO)
VALUES
('1039474422','Valentina','Villa Granados','valenvgranados@gmail.com','3137345854'),
('1039469243','Alejandro','Restrepo Muñoz','alejorpo0217@gmail.com','3023221460'),
('42824659','Paula Andrea','Granados Sanchez','paulagra8@gmail.com','3103896047'),
('35349129','Alexander','Villa Jaramillo','alexvillaj@gmail.com','3052258327');

INSERT INTO PRODUCTO
(CODIGO,NOMBRE,CATEGORIA,STOCK,PRECIO)
VALUES
('100','Tomate','Fruta','230','1600'),
(null,'Pan Tajado','Cereal','88','4300'),
(null,'Quesito','Lacteo','56','8600'),
(null,'Jamon','Carne Fria','71','14200'),
(null,'Zanahoria','Verdura','103','1160'),
(null,'Lechuga','Verdura','40','3000'),
(null,'Papa Capira','Tuberculo','380','2700'),
(null,'Pechugas Marinadas','Proteina Carnica','124','30080'),
(null,'Huevos','Huevos','398','16450'),
(null,'Repollo Morado','Verdura','37','3080'),
(null,'Muslos de pollo','Proteina Carnica','61','14900'),
(null,'Huevos AAA','Huevos','210','20000'),
(null,'Leche','Lacteo','74','3100');

INSERT INTO PROVEEDOR
(NIT,NOMBRE,DIRECCION,TELEFONO)
VALUES
('43405256-4','BIMBO','Calle 71 SUR #46A-09','3103456789'),
('33456796-6','ALQUERIA','Carrera 65 #72-150','6044414444'),
('42824678-2','BUCANERO','Carrera 32 Calle 70C-45','3023446788'),
('44567890-9','PIETRAN','Transversal 80 #42B-113','3124567899'),
('35567845-4','COLANTA','Calle 50 #32A-105','3134567234'),
('33343560-3','CAMPO ALEGRE','Carrera 29 CALLE 30-03','3103896543'),
('57897321-1','HUEVOS PIPE','Diagonal 3 #34C SUR 104','3105678932'),
('667778897-7','CAMPESINOS LA PONDEROSA','Carrera 37 este #7-12','3052251467'),
('44676569-9','CAMPOLLO','Calle 10 SUR #50FF-21','3207802669');

ALTER TABLE FACTURA ADD FOREIGN KEY (CODIGO_PRODUCTO)REFERENCES PRODUCTO(CODIGO);

ALTER TABLE PROVEE ADD FOREIGN KEY (NIT_PROVEEDOR)REFERENCES PROVEEDOR(NIT);

INSERT INTO PROVEE
(NOMBRE_PRODUCTO,NIT_PROVEEDOR,PRECIO_COSTO,CANTIDAD,FECHA)
VALUES
('Lechuga','33343560-3','1800','100','2022-08-22'),
('Pan Tajado','43405256-4','2700','250','2022-08-23'),
('Jamon','44567890-9','10200','98','2022-08-20'),
('Quesito','35567845-4','6110','101','2022-08-28'),
('Papa Capira','33343560-3','1300','500','2022-08-26'),
('Pechugas Marinadas','42824678-2','17099','150','2022-08-30'),
('Huevos','57897321-1','10450','420','2022-08-30'),
('Huevos AAA','33343560-3','12350','47','2022-08-29'),
("Leche","35567845-4","1600","120","2022-09-01"),
('Huevos AAA','667778897-7','11900','78','2022-08-29'),
('Lechuga','667778897-7','1100','66','2022-08-30'),
('Lechuga','33343560-3','1800','21','2022-08-30'),
('Muslos de Pollo','42824678-2','18000','21','2022-08-30'),
('Muslos de Pollo','33343560-3','16900','35','2022-08-30'),
('Tomate','667778897-7','800','350','2022-09-01'),
('Zanahoria','667778897-7','490','146','2022-09-01'),
('Papa Capira','667778897-7','990','110','2022-09-01'),
('Papa Capira','33343560-3','1100','98','2022-09-01'),
('Repollo Morado','33343560-3','1250','37','2022-09-01'),
('Repollo Morado','667778897-7','1600','29','2022-09-01');


INSERT INTO FACTURA
(NUM_FACTURA,TIPO_DOCUMENTO,NUM_DOCUMENTO,CODIGO_PRODUCTO,FECHA_COMPRA,CANTIDAD,PRECIO,TOTAL)
VALUES
('001','Cedula','1039469347','102','2022-08-28','1','8600','8600'),
(null,'Cedula','1039474422','101','2022-08-29','2','4300','8600'),
(null,'Cedula','1039474422','107','2022-08-29','1','30080','30080'),
(null,'Pasaporte','ATQ3456','108','2022-09-01','1','16450','16450'),
(null,'Cedula','42824659','106','2022-09-01','6','2700','16200'),
(null,'Cedula','1039474422','108','2022-08-30','2','16450','32900'),
(null,'Cedula','42824659','100','2022-08-30','7','1600','11200'),
(null,'Pasaporte','ATQ3456','102','2022-08-30','1','8600','8600'),
(null,'Cedula','42824659','102','2022-08-31','1','8600','8600'),
(null,'Cedula','1039469243','101','2022-08-31','2','4300','8600'),
(null,'Cedula','1039474422','104','2022-08-31','8','1160','9280'),
(null,'Cedula','1039469243','107','2022-09-01','1','30080','30080');

UPDATE PROVEE SET NOMBRE_PRODUCTO = 'Muslos de pollo' WHERE NIT_PROVEEDOR = '42824678-2';

UPDATE PROVEE SET NIT_PROVEEDOR = '44676569-9' WHERE NOMBRE_PRODUCTO = 'Muslos de pollo';

UPDATE PROVEE SET NOMBRE_PRODUCTO = 'Leche' WHERE NIT_PROVEEDOR = '35567845-4';

UPDATE PROVEE SET NIT_PROVEEDOR = '33456796-6' WHERE NOMBRE_PRODUCTO = 'Leche';

UPDATE PROVEE SET NOMBRE_PRODUCTO = 'Repollo Morado' WHERE NIT_PROVEEDOR = '33343560-3';

UPDATE PROVEE SET NIT_PROVEEDOR = '667778897-7' WHERE NOMBRE_PRODUCTO = 'Repollo Morado';