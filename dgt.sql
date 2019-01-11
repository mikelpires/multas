-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.37-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para dgt
CREATE DATABASE IF NOT EXISTS `dgt` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dgt`;

-- Volcando estructura para tabla dgt.agente
CREATE TABLE IF NOT EXISTS `agente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_departamento` (`id_departamento`),
  CONSTRAINT `FK_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dgt.agente: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `agente` DISABLE KEYS */;
INSERT INTO `agente` (`id`, `nombre`, `id_departamento`) VALUES
	(1, 'majonei', 37),
	(2, 'jonywalker', 36),
	(3, 'Monk', 39),
	(4, 'Takelberry', 38),
	(5, 'tontini', 38);
/*!40000 ALTER TABLE `agente` ENABLE KEYS */;

-- Volcando estructura para tabla dgt.coche
CREATE TABLE IF NOT EXISTS `coche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(10) NOT NULL,
  `modelo` varchar(45) NOT NULL DEFAULT 'cuatro latas',
  `km` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dgt.coche: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `coche` DISABLE KEYS */;
INSERT INTO `coche` (`id`, `matricula`, `modelo`, `km`) VALUES
	(1, '3548MKZ', 'toyota yaris', 500),
	(2, '9605EFH', 'fiat multipla', 800),
	(3, '5674MBD', 'GRT', 1800),
	(4, 'BI0020AZ', 'flagoneta', 47500);
/*!40000 ALTER TABLE `coche` ENABLE KEYS */;

-- Volcando estructura para tabla dgt.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dgt.departamento: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` (`id`, `nombre`) VALUES
	(36, 'Alcoholemia'),
	(39, 'fealdad'),
	(33, 'Ingeniería'),
	(35, 'Mercadeo'),
	(38, 'Oficina'),
	(34, 'Producción'),
	(37, 'Velocidad'),
	(31, 'ventas');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;

-- Volcando estructura para tabla dgt.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `fecha_contrato` date DEFAULT NULL,
  `salario` float DEFAULT '900',
  `comision` float DEFAULT '0',
  `id_jefe` int(11) DEFAULT NULL,
  `id_puesto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dgt.empleado: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` (`id`, `nombre`, `id_departamento`, `fecha_contrato`, `salario`, `comision`, `id_jefe`, `id_puesto`) VALUES
	(1, 'Andrade', 31, NULL, 900, 0, NULL, NULL),
	(2, 'Jordán', 33, NULL, 900, 0, NULL, NULL),
	(3, 'Steinberg', 33, NULL, 900, 0, NULL, NULL),
	(4, 'Róbinson', 34, NULL, 900, 0, NULL, NULL),
	(5, 'Zolano', 34, NULL, 900, 0, NULL, NULL),
	(6, 'Gaspar', 36, NULL, 900, 0, NULL, NULL),
	(7, 'borja', 38, '2003-08-02', 5000, 1500, 16, 2),
	(8, 'hector', 38, '2014-11-25', 3000, 2000, 16, 2),
	(9, 'andoni', 38, '2016-08-27', 2500, 1000, 16, 2),
	(10, 'xabier', 38, '2019-01-09', 900, 0, NULL, 3),
	(11, 'david', 38, '2018-08-13', 900, 0, NULL, 3),
	(12, 'Imanol', 38, '2018-07-07', 1350, 350, 13, 1),
	(13, 'Oscar', 38, '2017-07-07', 5000, 4000, NULL, 1),
	(14, 'Amaia', 38, '2016-10-25', 2500, 700, 16, 2),
	(15, 'Daniel', 38, '2015-07-07', 1900, 300, 16, 2),
	(16, 'Ander', 38, '2019-01-07', 28000, 7, 16, 2);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;

-- Volcando estructura para tabla dgt.multa
CREATE TABLE IF NOT EXISTS `multa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `importe` float DEFAULT '50',
  `concepto` varchar(255) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_coche` int(11) NOT NULL,
  `id_agente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_multas_coches1_idx` (`id_coche`),
  KEY `fk_multas_agentes1_idx` (`id_agente`),
  CONSTRAINT `FK_multa_agente1` FOREIGN KEY (`id_agente`) REFERENCES `agente` (`id`),
  CONSTRAINT `fk_multas_coches1` FOREIGN KEY (`id_coche`) REFERENCES `coche` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dgt.multa: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `multa` DISABLE KEYS */;
INSERT INTO `multa` (`id`, `importe`, `concepto`, `fecha`, `id_coche`, `id_agente`) VALUES
	(1, 200, 'por feo', '2019-01-07 10:37:38', 2, 3),
	(2, 500, 'exceso velocidad 240km/h', '2019-01-07 10:39:29', 4, 1),
	(3, 700, 'por empinar codo 8.0', '2018-12-31 22:40:52', 1, 2),
	(4, 700, 'por empinar codo 8.0', '2019-01-07 10:42:38', 1, 2),
	(5, 50, 'otra multa', '2019-01-07 12:41:19', 1, 1),
	(6, 300, 'correr mucho', '2019-01-07 12:41:39', 4, 1);
/*!40000 ALTER TABLE `multa` ENABLE KEYS */;

-- Volcando estructura para tabla dgt.puesto
CREATE TABLE IF NOT EXISTS `puesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dgt.puesto: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
INSERT INTO `puesto` (`id`, `nombre`, `id_departamento`) VALUES
	(1, 'secretari@', 38),
	(2, 'programd@r', 38),
	(3, 'becari@', 38);
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
