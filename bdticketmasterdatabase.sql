/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.28-MariaDB : Database - bdticketmaster
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bdticketmaster` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `bdticketmaster`;

/*Table structure for table `administradores` */

DROP TABLE IF EXISTS `administradores`;

CREATE TABLE `administradores` (
  `idAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `admin_nick` varchar(20) NOT NULL,
  `admin_password` varchar(20) NOT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `administradores` */

insert  into `administradores`(`idAdmin`,`admin_nick`,`admin_password`) values 
(1,'Samu','usilplease41'),
(2,'Joserex','estacanon31'),
(3,'Lian','programando99'),
(4,'JoseG','usilvamos123'),
(5,'Samu','usilplease41'),
(6,'Joserex','estacanon31'),
(7,'Lian','programando99'),
(8,'JoseG','usilvamos123');

/*Table structure for table `conceptos` */

DROP TABLE IF EXISTS `conceptos`;

CREATE TABLE `conceptos` (
  `idConcepto` int(11) NOT NULL AUTO_INCREMENT,
  `concepto_nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`idConcepto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `conceptos` */

insert  into `conceptos`(`idConcepto`,`concepto_nombre`) values 
(1,'Concierto'),
(2,'Festival'),
(3,'Cine'),
(4,'Teatro'),
(5,'Karaoke'),
(8,'Demostracion'),
(9,'Espejo');

/*Table structure for table `detalle_venta` */

DROP TABLE IF EXISTS `detalle_venta`;

CREATE TABLE `detalle_venta` (
  `idVenta` int(11) NOT NULL,
  `idFuncion` int(11) NOT NULL,
  `nombreFuncion` varchar(50) DEFAULT NULL,
  `idConcepto` int(11) NOT NULL,
  `conceptoNombre` varchar(20) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `idVendedores` int(11) NOT NULL,
  `nombreVendedores` varchar(30) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `totalAPagar` decimal(10,2) DEFAULT NULL,
  `nombreCliente` varchar(50) DEFAULT NULL,
  `dniCliente` varchar(10) DEFAULT NULL,
  `fechaDeVenta` date DEFAULT NULL,
  PRIMARY KEY (`idVenta`,`idFuncion`,`idConcepto`,`idVendedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalle_venta` */

insert  into `detalle_venta`(`idVenta`,`idFuncion`,`nombreFuncion`,`idConcepto`,`conceptoNombre`,`precio`,`idVendedores`,`nombreVendedores`,`cantidad`,`totalAPagar`,`nombreCliente`,`dniCliente`,`fechaDeVenta`) values 
(1,1,'The Beatles',1,'Concierto',80.00,1,'JGUZMAN',1,80.00,'Mariano Agular','12345678','2023-11-22'),
(1,2,'AC/DC',1,'Concierto',85.00,1,'JGUZMAN',2,170.00,'Mariano Agular','12345678','2023-11-22'),
(2,1,'The Beatles',1,'Concierto',80.00,1,'JGUZMAN',2,160.00,'Luchito Perez','23465478','2023-11-22'),
(2,2,'AC/DC',1,'Concierto',85.00,1,'JGUZMAN',1,85.00,'Luchito Perez','23465478','2023-11-22'),
(3,1,'The Beatles',1,'Concierto',80.00,1,'JGUZMAN',1,80.00,'Luis Sanchez','41246791','2023-11-22'),
(3,2,'AC/DC',1,'Concierto',85.00,1,'JGUZMAN',2,170.00,'Luis Sanchez','41246791','2023-11-22');

/*Table structure for table `funciones` */

DROP TABLE IF EXISTS `funciones`;

CREATE TABLE `funciones` (
  `idFuncion` int(11) NOT NULL AUTO_INCREMENT,
  `idConcepto` int(11) DEFAULT NULL,
  `conceptoNombre` varchar(20) DEFAULT NULL,
  `nombreFuncion` varchar(50) DEFAULT NULL,
  `idTipos` int(11) DEFAULT NULL,
  `tipoNombre` varchar(30) DEFAULT NULL,
  `lugarFuncion` varchar(50) DEFAULT NULL,
  `fechaFuncion` date DEFAULT NULL,
  `disponibleFuncion` varchar(20) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idFuncion`),
  KEY `idConcepto` (`idConcepto`),
  KEY `idTipos` (`idTipos`),
  CONSTRAINT `funciones_ibfk_1` FOREIGN KEY (`idConcepto`) REFERENCES `conceptos` (`idConcepto`),
  CONSTRAINT `funciones_ibfk_2` FOREIGN KEY (`idTipos`) REFERENCES `tipos` (`idTipos`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `funciones` */

insert  into `funciones`(`idFuncion`,`idConcepto`,`conceptoNombre`,`nombreFuncion`,`idTipos`,`tipoNombre`,`lugarFuncion`,`fechaFuncion`,`disponibleFuncion`,`precio`) values 
(1,1,'Concierto','The Beatles',1,'Rock','Estadio Nacional de Lima','2023-11-15','Disponible',80.00),
(2,1,'Concierto','AC/DC',1,'Rock','Estadio Nacional de Lima','2024-06-19','Disponible',85.00),
(3,2,'Festival','Pintura Roja',1,'Rock','Centro de Convenciones Maria Angola','2024-03-21','No disponible',65.00),
(4,3,'Cine','Avatar 3',10,'Acción','Cineplanet','2024-09-29','Disponible',20.00);

/*Table structure for table `tipos` */

DROP TABLE IF EXISTS `tipos`;

CREATE TABLE `tipos` (
  `idTipos` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`idTipos`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tipos` */

insert  into `tipos`(`idTipos`,`tipo`) values 
(1,'Rock'),
(2,'Metal'),
(3,'Pop'),
(4,'Balada'),
(5,'Salsa'),
(6,'Cumbia'),
(7,'Terror'),
(8,'Drama'),
(9,'Comedia'),
(10,'Acción'),
(11,'Musical'),
(13,'Romance'),
(15,'asdad');

/*Table structure for table `vendedores` */

DROP TABLE IF EXISTS `vendedores`;

CREATE TABLE `vendedores` (
  `idVendedores` int(11) NOT NULL AUTO_INCREMENT,
  `nombreVendedores` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idVendedores`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `vendedores` */

insert  into `vendedores`(`idVendedores`,`nombreVendedores`) values 
(1,'JGUZMAN'),
(2,'MGARCIA'),
(3,'LREYES'),
(4,'PMARADONA'),
(5,'PCASTILLO');

/*Table structure for table `venta` */

DROP TABLE IF EXISTS `venta`;

CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idVendedores` int(11) DEFAULT NULL,
  `nombreVendedor` varchar(30) DEFAULT NULL,
  `totalAPagar` decimal(10,2) DEFAULT NULL,
  `fechaDeVenta` date DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `idVendedores` (`idVendedores`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idVendedores`) REFERENCES `vendedores` (`idVendedores`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `venta` */

insert  into `venta`(`idVenta`,`idVendedores`,`nombreVendedor`,`totalAPagar`,`fechaDeVenta`) values 
(1,1,'JGUZMAN',250.00,'2023-11-22'),
(2,1,'JGUZMAN',245.00,'2023-11-22'),
(3,1,'JGUZMAN',250.00,'2023-11-22');

/* Procedure structure for procedure `USPDisponibilidadDeFunciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPDisponibilidadDeFunciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPDisponibilidadDeFunciones`(in disponibilidad varchar(20))
select * from funciones where disponibilidad = disponibleFuncion */$$
DELIMITER ;

/* Procedure structure for procedure `USPEliminarAdministradores` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEliminarAdministradores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEliminarAdministradores`(IN idAdminParam INT(11))
DELETE FROM administradores WHERE idAdmin = idAdminParam */$$
DELIMITER ;

/* Procedure structure for procedure `USPEliminarConceptos` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEliminarConceptos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEliminarConceptos`(IN idConceptoParam INT)
BEGIN
    -- Agregar mensajes de depuración
    SELECT 'Valor de idConcepto recibido:', idConceptoParam;
    -- Intentar eliminar el registro
    DELETE FROM conceptos WHERE idConcepto = idConceptoParam;
    -- Agregar mensajes de depuración después de intentar la eliminación
    SELECT 'Registros afectados:', ROW_COUNT();
END */$$
DELIMITER ;

/* Procedure structure for procedure `USPEliminarDetallesVentaPorID` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEliminarDetallesVentaPorID` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEliminarDetallesVentaPorID`(IN codigoP INT(11))
DELETE FROM detalle_venta WHERE idVenta = codigoP */$$
DELIMITER ;

/* Procedure structure for procedure `USPEliminarFuncionesPorID` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEliminarFuncionesPorID` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEliminarFuncionesPorID`(in idFuncions int(11))
delete from funciones where idFuncions = idFuncion */$$
DELIMITER ;

/* Procedure structure for procedure `USPEliminarTipos` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEliminarTipos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEliminarTipos`(IN idTiposParam INT(11))
DELETE FROM tipos WHERE idTipos = idTiposParam */$$
DELIMITER ;

/* Procedure structure for procedure `USPEliminarVendedores` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEliminarVendedores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEliminarVendedores`(IN idVendedoresParam INT(11))
DELETE FROM vendedores WHERE idVendedores = idVendedoresParam */$$
DELIMITER ;

/* Procedure structure for procedure `USPEliminarVentaPorID` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEliminarVentaPorID` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEliminarVentaPorID`(IN codigoP INT(11))
DELETE FROM venta WHERE idVenta = codigoP */$$
DELIMITER ;

/* Procedure structure for procedure `USPInsertarAdministradores` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPInsertarAdministradores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPInsertarAdministradores`(
	IN admin_nick VARCHAR(20),
	IN admin_password VARCHAR(20)
)
INSERT INTO administradores (admin_nick, admin_password) VALUES (admin_nick, admin_password) */$$
DELIMITER ;

/* Procedure structure for procedure `USPInsertarConceptos` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPInsertarConceptos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPInsertarConceptos`(
	IN concepto_nombreParam VARCHAR(20)	
)
INSERT INTO conceptos(concepto_nombre) VALUES (concepto_nombreParam) */$$
DELIMITER ;

/* Procedure structure for procedure `USPInsertarDetalleVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPInsertarDetalleVentas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPInsertarDetalleVentas`(
    IN idVentaParam INT,    
    IN idFuncionParam INT,
    IN nombreFuncionParam VARCHAR(50),    
    IN idConceptoParam INT,
    IN conceptoNombreParam VARCHAR(20),
    IN precioParam DECIMAL(10, 2),
    IN idVendedoresParam INT,
    IN nombreVendedoresParam VARCHAR(30),
    IN cantidadParam INT,
    IN totalApagarParam DECIMAL(10, 2),
    IN nombreClienteParam VARCHAR(50),
    IN dniClienteParam VARCHAR(10),
    IN fechaDeVentaParam DATE
)
INSERT INTO detalle_venta (idVenta,idFuncion,nombreFuncion,idConcepto,conceptoNombre,precio,idVendedores,nombreVendedores,cantidad,totalAPagar,nombreCliente,dniCliente,fechaDeVenta)
    VALUES (idVentaParam,idFuncionParam,nombreFuncionParam,idConceptoParam,conceptoNombreParam,precioParam,idVendedoresParam,nombreVendedoresParam,cantidadParam,totalApagarParam,nombreClienteParam,dniClienteParam,fechaDeVentaParam) */$$
DELIMITER ;

/* Procedure structure for procedure `USPInsertarFunciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPInsertarFunciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPInsertarFunciones`(
    IN idConcepto INT(11),
    IN conceptoNom VARCHAR(20),
    IN nombFuncion VARCHAR(50),
    IN idTiposP INT(11),
    IN tipoNomb VARCHAR(30),
    IN lugarFuncionP VARCHAR(50),
    IN fechaFuncionP DATE,
    IN disponibleFuncionP VARCHAR(20),
    IN precioF DECIMAL(10,2)
)
INSERT INTO funciones (idConcepto, conceptoNombre, nombreFuncion, idTipos, tipoNombre, lugarFuncion, fechaFuncion, disponibleFuncion, precio)
    VALUES (idConcepto, conceptoNom, nombFuncion, idTiposP, tipoNomb, lugarFuncionP, fechaFuncionP, disponibleFuncionP, precioF) */$$
DELIMITER ;

/* Procedure structure for procedure `USPInsertarTipos` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPInsertarTipos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPInsertarTipos`(
	IN tipoParam VARCHAR(30)	
)
INSERT INTO tipos(tipo) VALUES (tipoParam) */$$
DELIMITER ;

/* Procedure structure for procedure `USPInsertarVendedores` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPInsertarVendedores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPInsertarVendedores`(
	IN nombreVendedoresParam VARCHAR(30)	
)
INSERT INTO vendedores(nombreVendedores) VALUES (nombreVendedoresParam) */$$
DELIMITER ;

/* Procedure structure for procedure `USPInsertarVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPInsertarVentas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPInsertarVentas`(
    IN idVendedoresParam INT,
    IN nombreVendedorParam VARCHAR(30),
    IN totalAPagarParam DECIMAL(10, 2),
    IN fechaDeVentaParam DATE
)
INSERT INTO venta (idVendedores, nombreVendedor, totalAPagar, fechaDeVenta)
    VALUES (idVendedoresParam, nombreVendedorParam, totalAPagarParam, fechaDeVentaParam) */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarAdministradores` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarAdministradores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarAdministradores`()
SELECT * FROM administradores */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarConceptos` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarConceptos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarConceptos`()
SELECT * FROM conceptos */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarDetalleVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarDetalleVentas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarDetalleVentas`()
SELECT*FROM detalle_venta */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarDetalleVentasPorID` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarDetalleVentasPorID` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarDetalleVentasPorID`(IN codigoP INT(11))
SELECT * FROM detalle_venta WHERE idVenta = codigoP */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarFunciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarFunciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarFunciones`()
select * from funciones */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarFuncionesPorId` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarFuncionesPorId` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarFuncionesPorId`(in codigo int(11))
SELECT * FROM funciones where codigo = idFuncion */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarTipos` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarTipos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarTipos`()
SELECT*FROM tipos */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarVendedores` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarVendedores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarVendedores`()
SELECT * FROM vendedores */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarVentaPorID` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarVentaPorID` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarVentaPorID`(IN codigo INT(11))
SELECT * FROM venta WHERE codigo = idVenta */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarVentas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarVentas`()
SELECT * FROM venta */$$
DELIMITER ;

/* Procedure structure for procedure `USPModificarAdministradores` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPModificarAdministradores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPModificarAdministradores`(
    IN p_idAdmin INT(11),
    IN p_admin_nick VARCHAR(20),
    IN p_admin_password VARCHAR(20)
)
BEGIN
    UPDATE administradores
    SET admin_nick = p_admin_nick,
        admin_password = p_admin_password
    WHERE idAdmin = p_idAdmin;
END */$$
DELIMITER ;

/* Procedure structure for procedure `USPModificarConceptos` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPModificarConceptos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPModificarConceptos`(
    IN idConceptosParam INT(11),
    in concepto_nombreParam varchar(20)
)
BEGIN
    UPDATE conceptos
    SET concepto_nombre = concepto_nombreParam
    WHERE idConcepto = idConceptoParam;
END */$$
DELIMITER ;

/* Procedure structure for procedure `USPModificarDetalleVenta` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPModificarDetalleVenta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPModificarDetalleVenta`(
    IN idVentaPS INT(11),
    IN idFuncionP INT(11),
    IN nombFuncion VARCHAR(50),
    IN idConceptoP INT(11),
    IN conceptoNom VARCHAR(20),
    IN precioP DECIMAL(10,2),
    IN idVendedorP INT(11),
    IN nombVend VARCHAR(30),
    IN cantP INT(11),
    IN totalApagarP DECIMAL(10,2),
    IN nombClien VARCHAR(50),
    IN dniClien VARCHAR(10),
    IN fechaVent DATE
)
UPDATE detalle_venta
    SET 
        idFuncion = idFuncionP,
        nombreFuncion = nombFuncion,
        idConcepto = idConceptoP,
        conceptoNombre = conceptoNom,
        precio = precioP,
        idVendedores = idVendedorP,
        nombreVendedores = nombVend,
        cantidad = cantP,
        totalAPagar = subtotalP,
        nombreCliente = nombClien,
        dniCliente = dniClien,
        fechaDeVenta = fechaVent
    WHERE idVenta = idVentaPS */$$
DELIMITER ;

/* Procedure structure for procedure `USPModificarFunciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPModificarFunciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPModificarFunciones`(
    IN idFuncionP INT(11),
    IN idConceptoP INT(11),
    IN conceptoNom VARCHAR(20),
    IN nombFuncion VARCHAR(50),
    IN idTiposP INT(11),
    IN tipoNomb VARCHAR(30),
    IN lugarFuncionP VARCHAR(50),
    IN fechaFuncionP DATE,
    IN disponibleFuncionP VARCHAR(20),
    IN precioF DECIMAL(10,2)
)
UPDATE funciones 
    SET 
        idConcepto = idConceptoP,
        conceptoNombre = conceptoNom,
        nombreFuncion = nombFuncion,
        idTipos = idTiposP,
        tipoNombre = tipoNomb,
        lugarFuncion = lugarFuncionP,
        fechaFuncion = fechaFuncionP,
        disponibleFuncion = disponibleFuncionP,
        precio = precioF
    WHERE idFuncion = idFuncionP */$$
DELIMITER ;

/* Procedure structure for procedure `USPModificarTipos` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPModificarTipos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPModificarTipos`(
    IN idTiposParam INT(11),
    IN tipoParam VARCHAR(30)
)
BEGIN
    UPDATE tipos
    SET tipo = tipoParam
    WHERE idTipos = idTiposParam;
END */$$
DELIMITER ;

/* Procedure structure for procedure `USPModificarVendedores` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPModificarVendedores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPModificarVendedores`(
    IN idVendedoresParam INT(11),
    IN nombreVendedoresParam VARCHAR(30)
)
BEGIN
    UPDATE vendedores
    SET nombreVendedores = nombreVendedoresParam
    WHERE idVendedores = idVendedoresParam;
END */$$
DELIMITER ;

/* Procedure structure for procedure `USPModificarVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPModificarVentas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPModificarVentas`(
    IN idVentaParam INT(11),
    IN idVendedoresParam INT(11),
    IN nombreVendedorParam VARCHAR(30),
    IN totalAPagarParam DECIMAL(10, 2),
    IN fechaDeVentaParam DATE
)
BEGIN
    UPDATE venta
    SET idVendedores = idVendedoresParam,
    nombreVendedor = nombreVendedorParam,
    totalAPagar = totalAPagarParam,
    fechaDeVenta = fechaDeVentaParam
    WHERE idVenta = idVentaParam;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
