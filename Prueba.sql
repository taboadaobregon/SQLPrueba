create database zapateria
use zapateria
-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE Categoria(
  idCategoria INT identity primary key,
  descripcion VARCHAR(45) NULL,
)

go
-- -----------------------------------------------------
-- Table `mydb`.`Productos`
-- -----------------------------------------------------
CREATE TABLE Productos(
  idProductos INT identity primary key,
  idCategoria INT NOT NULL,
  codigo VARCHAR(45) NULL,
  nombre VARCHAR(45) NULL,
  stock INT NULL,
  stock_ingreso INT NULL,
  stock_salida INT NULL,
  estado bit not null,
  CONSTRAINT fk_categoria FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
	)


	go

-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE cliente (
  idcliente INT identity primary key,
  nombre VARCHAR(20) NULL,
  tipo_documento VARCHAR(20) NULL,
  num_documento VARCHAR(20) NULL,
  direccion VARCHAR(70) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  email VARCHAR(70) NOT NULL,
  razon_social VARCHAR(250) NOT NULL,
  estado TINYINT NULL,
  )
  go
-- -----------------------------------------------------
-- Table `mydb`.`rol`
-- -----------------------------------------------------
CREATE TABLE rol(
  idrol INT identity primary key,
  descripcion VARCHAR(20) NULL,)

  go
-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE usuario (
  idusuario INT identity primary key,
  idrol INT NOT NULL,
  nombre VARCHAR(100) NULL,
  tipo_documento VARCHAR(20) NULL,
  numero_documento VARCHAR(20) NULL,
  direccion VARCHAR(45) NOT NULL,
  telefono VARCHAR(45) NOT NULL,
  email VARCHAR(50) NOT NULL,
  cargo VARCHAR(30) NOT NULL,
  logeo VARCHAR(20) NULL,
  clave VARCHAR(64) NULL,
  estado bit not null,
  CONSTRAINT fk_tipo_usuario
    FOREIGN KEY (idrol)
    REFERENCES rol(idrol)
	)

	go
-- -----------------------------------------------------
-- Table `mydb`.`factura`
-- -----------------------------------------------------
CREATE TABLE factura (
  idfactura INT identity primary key,
  idcliente INT NULL,
  idusuario INT NULL,
  fecha_hora DATETIME NULL,
  impuesto float NULL,
  total_igv float NULL,
  total_venta decimal NULL,
  CONSTRAINT fk_cliente
    FOREIGN KEY (idcliente)
    REFERENCES cliente(idcliente),
    CONSTRAINT fk_usuario
    FOREIGN KEY (idusuario)
    REFERENCES usuario (idusuario))




	go
-- -----------------------------------------------------
-- Table `mydb`.`detalle_venta`
-- -----------------------------------------------------
CREATE TABLE detalle_venta(
  iddetalle_venta INT identity primary key,
  id_factura INT NULL,
  id_producto INT NULL,
  cantidad INT NULL,
  precio_venta float NULL,
  descuento float NULL,
  fecha_mas_vendida Date NULL,
  CONSTRAINT fk_venta
    FOREIGN KEY (id_factura)
    REFERENCES factura(idfactura),
  CONSTRAINT fk_productos
    FOREIGN KEY (id_producto)
    REFERENCES Productos(idProductos))



	go
-- -----------------------------------------------------
-- Table `mydb`.`Kardex`
-- -----------------------------------------------------
CREATE TABLE Kardex (
  idKardex INT identity primary key,
  fecha_registro DATE NULL,
  hora_registro TIME NULL,
  id_producto INT NULL,
  motivo VARCHAR(245) NULL,
  entrada INT NULL,
  salida INT NULL,
  usuario_accion INT NULL,
  CONSTRAINT fk_producto
    FOREIGN KEY (id_producto)
    REFERENCES Productos(idProductos))
	go
-- -----------------------------------------------------
-- Table `mydb`.`Pais`
-- -----------------------------------------------------
CREATE TABLE Pais (
  idPais INT identity primary key,
  id_cliente INT NOT NULL,
  id_usuario INT NOT NULL,
  descripcion VARCHAR(30) NULL,
  CONSTRAINT fk_cliente_pais
    FOREIGN KEY (id_cliente)
    REFERENCES cliente(idcliente),
  CONSTRAINT fk_usuario_pais
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(idusuario))

/*Insert del campo categoria*/
insert into Categoria values ('Botas o botines de vestir')
insert into Categoria values('Zapatillas o Tenis Blancos')
insert into Categoria values('Zapatos Brogue')
insert into Categoria values('Mocasines')
insert into Categoria values('Zapatos Monk')
insert into Categoria values('Zapatos casual') 
insert into Categoria values('Derbi y Náuticos')
insert into Categoria values('Sandalias o Alpargatas')
insert into Categoria values('Zapatillas')
go

select * from Categoria
select * from Productos

/*insert into productos*/
insert into Productos values(1,'C0001','Pascualas',20,50,30,1)
insert into Productos values(2,'C0002','Nike Air Max',15,45,30,1)
insert into Productos values(3,'C0003','Calimood',34,60,26,1)
insert into Productos values(4,'C0004','blucher',24,30,6,1)
insert into Productos values(5,'C0005','Dockside',0,20,20,0)
insert into Productos values(6,'C0006','loafers',2,50,48,1)
insert into Productos values(7,'C0007','vikeduo',5,30,25,1)
insert into Productos values(8,'C0008','Adidas',1,40,39,1)
insert into Productos values(9,'C0009','Nike 720',10,30,20,1)
insert into Productos values(8,'C0010','Reebok',10,50,40,1)
insert into Productos values(4,'C0011','wikileaks',10,20,10,1)

select * from cliente 
/*insert into cliente*/
insert into cliente values('Andres','DNI','74608108','av juan velasco','9778868881','andres@gmail.com','Persona Natural',1)
insert into cliente values('Juan','DNI','23233323','av aurelio salaverry ','9778868881','juan@gmail.com','Persona Natural',1)
insert into cliente values('Kali','DNI','54323233','av ausejo salas ','97788632321','kali@gmail.com','Persona Natural',1)
insert into cliente values('Carlos','DNI','65434443','av mariano melgar','97788688312','carlos@gmail.com','Persona Natural',1)
insert into cliente values('Eder','DNI','32421344','av los pinos','9778863231','eder@gmail.com','Persona Natural',1)
insert into cliente values('Antonio','DNI','12342244','av la alameda','97788688213','antonio@gmail.com','Persona Natural',1)
insert into cliente values('Pedro','DNI','56544334','av iquitos','9778868881','pedro@gmail.com','Persona Natural',1)
insert into cliente values('Paul','DNI','97837372','av francisco rosas','977886823','paul@gmail.com','Persona Natural',0)
insert into cliente values('Esteban','DNI','65432123','av san martin','97788688322','esteban@gmail.com','Persona Natural',0)
insert into cliente values('Coraima','DNI','74608108','av juan velasco','9778868881','Coraima@gmail.com','Persona Natural',1)
insert into cliente values('Betty','DNI','74608108','av juan velasco','9778868881','Betty@gmail.com','Persona Natural',1)
insert into cliente values('Mercedes','DNI','74608108','av juan velasco','9778868881','Mercedes@gmail.com','Persona Natural',1)

select * from rol

/*insert into rol*/
insert into rol values('Administrador')
insert into rol values('Contador')
insert into rol values('Cajero')
insert into rol values('secretario/a')

select * from usuario

/*insert into usuario*/
insert into usuario values(1,'Tadeo','DNI','74621108','av juan velasco','9778868881','tadeo@gmail.com','admin','tadeo','1234',1)
insert into usuario values(2,'Augusto','DNI','74608308','av juan bosco','9778868881','Augusto@gmail.com','contabilidad y finazas','augusto','1234',1)
insert into usuario values(3,'Adriano','DNI','74608208','av velaquez alvarado','9778868881','Adriano@gmail.com','cajero de zapatos','adriano','1234',1)

insert into usuario values(1,'Albeiro','DNI','76208208','av velaquez alvarado','9778868881','albeiro@gmail.com','admin','albeiro','1234',1)
insert into usuario values(2,'Jota','DNI','13608208','av velaquez alvarado','9778868881','jota@gmail.com','contabilidad y finanzas','jota','1234',1)
insert into usuario values(4,'Sebastian','DNI','45608208','av velaquez alvarado','9778868881','sebastian@gmail.com','secretario/a','sebastian','1234',1)
insert into usuario values(1,'Santiago','DNI','47608208','av velaquez alvarado','9778868881','santiago@gmail.com','admin','santiago','1234',1)

insert into usuario values(4,'Eloyde','DNI','79608208','av velaquez alvarado','9778868881','eloyde@gmail.com','secretario','eloyde','1234',1)

insert into usuario values(1,'Hans','DNI','73608208','av velaquez alvarado','9778868881','hans@gmail.com','admin','hans','12344',1)
insert into usuario values(2,'Jorge','DNI','78608208','av velaquez alvarado','9778868881','jorge@gmail.com','contabilidad','jorge','12345',1)


/*insert into factura*/
insert into factura values(1,1,GETDATE(),0.02,0.16,145)
insert into factura values(2,2,GETDATE(),0.02,0.16,158)
insert into factura values(3,3,GETDATE(),0.02,0.16,234)
insert into factura values(4,3,GETDATE(),0.02,0.16,245)
insert into factura values(5,2,GETDATE(),0.02,0.16,345)
insert into factura values(6,3,GETDATE(),0.02,0.16,110)
insert into factura values(7,2,GETDATE(),0.02,0.16,200)
insert into factura values(8,1,GETDATE(),0.02,0.16,190)
insert into factura values(1,1,GETDATE(),0.02,0.16,123)
insert into factura values(1,1,'2020-06-04 12:06:40',0.02,0.16,124)
insert into factura values(11,2,'2020-06-04 11:06:40',0.02,0.16,125)
insert into factura values(11,2,'2020-06-04 10:08:40',0.02,0.16,120)
insert into factura values(11,2,'2020-06-04 08:32:40',0.02,0.16,180)
insert into factura values(11,2,'2020-06-04 14:45:40',0.02,0.16,250)


select * from factura

select * from detalle_venta
select * from Productos

/*insert into detalle_venta*/
insert into detalle_venta values(1,1,30,58.5,0.10,GETDATE())
insert into detalle_venta values(2,4,10,58.5,0.40,GETDATE())
insert into detalle_venta values(3,4,8,79.5,0.20,GETDATE())
insert into detalle_venta values(4,3,20,87.8,0.30,GETDATE())
insert into detalle_venta values(5,4,15,89.5,0.3,GETDATE())
insert into detalle_venta values(6,5,43,67.5,0.23,GETDATE())
insert into detalle_venta values(8,3,30,58.5,0.42,GETDATE())
insert into detalle_venta values(9,6,30,58.5,0.42,GETDATE())

insert into detalle_venta values(9,6,30,98.5,0.42,'2020-05-06')
insert into detalle_venta values(10,7,34,98.5,0.42,'2020-05-06')
insert into detalle_venta values(11,11,2,98.5,0.42,'2020-05-06')
select * from Kardex
select  * from productos
select * from usuario
/*insert into kardex*/
insert into kardex values('2020-03-06','10:20:00',1,'se vendio producto por que esta de moda',145,100,2)
insert into kardex values('2020-02-23','12:20',2,'se vendio producto por popular',200,123,1)
insert into kardex values('2020-04-06','13:20',3,'se vendio producto por el modelo comun',102,50,3)
insert into kardex values('2020-08-22','16:20',4,'salio por mayores ventas',121,45,4)
insert into kardex values('2020-10-03','17:20',5,'se vendio producto por que esta de moda',145,100,5)
insert into kardex values('2020-12-06','20:20',6,'se vendio producto por que esta de moda',145,100,6)
insert into kardex values('2020-12-09','08:20',7,'se vendio producto por que esta de moda',145,100,7)
insert into kardex values('2020-08-17','09:20',8,'se vendio producto por que esta de moda',145,100,8)
insert into kardex values('2020-12-15','11:20',9,'se vendio producto por que esta de moda',145,100,10)
insert into kardex values('2020-10-14','15:20',10,'se vendio producto por que esta de moda',145,100,9)
insert into kardex values('2020-07-10','17:50',11,'se vendio producto por que esta de moda',145,100,1)


select * from pais
select * from cliente

select * from usuario
/*insert into pais*/
insert into pais values(1,1,'Peru')
insert into pais values(12,9,'Venezuela')
insert into pais values(10,4,'Colombia')
insert into pais values(9,2,'Argentina')
insert into pais values(8,3,'España')
insert into pais values(6,8,'Ecuador')
insert into pais values(4,6,'Chile')
insert into pais values(5,10,'Mexico')
insert into pais values(3,5,'Brasil')
insert into pais values(11,7,'Paraguay')

select * from cliente
select * from factura

/*1 Consulta la facturación de un cliente en específico.*/
select f.idcliente,f.idusuario,f.fecha_hora,f.impuesto,f.total_venta from cliente c inner join factura f
on c.idcliente=f.idcliente where c.idcliente=1

/*2 Consulta la facturación de un producto en específico*/
select p.codigo,p.nombre,f.idusuario,f.fecha_hora,f.impuesto,f.total_igv,f.total_venta from detalle_venta dv inner join Productos p
on dv.id_producto=p.idProductos inner join factura f  
on dv.id_factura=f.idfactura where p.idProductos=3


/*3ra Consulta la facturación de un rango de fechas.*/
SELECT  GETDATE()+3 UNION ALL SELECT GETDATE()-1 UNION ALL SELECT GETDATE()
SELECT * FROM factura WHERE fecha_hora BETWEEN GETDATE()-3 AND GETDATE()-1

/*De la facturación, consulta los clientes únicos (es decir, se requiere el listado de los clientes que
han comprado por lo menos una vez, pero en el listado no se deben repetir los clientes*/

select distinct c.nombre as CLIENTE from factura f inner join cliente c
on f.idcliente=c.idcliente
select * from cliente where idcliente in (12)
select * from factura where idcliente in (10,11,12)
select * from factura where idcliente = 11 or idcliente = 12 or idcliente = 10



