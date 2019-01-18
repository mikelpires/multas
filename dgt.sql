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
  `nombre` varchar(45) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `placa` int(11) NOT NULL,
  `password` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_departamento` (`id_departamento`),
  CONSTRAINT `FK_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dgt.agente: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `agente` DISABLE KEYS */;
INSERT INTO `agente` (`id`, `nombre`, `id_departamento`, `placa`, `password`) VALUES
	(1, 'majonei', 37, 1111, '1111'),
	(2, 'jonywalker', 36, 2222, '2222'),
	(3, 'Monk', 39, 3333, '3333'),
	(4, 'Takelberry', 38, 4444, '4444'),
	(5, 'tontini', 38, 5555, '5555');
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

-- Volcando estructura para tabla dgt.multa
CREATE TABLE IF NOT EXISTS `multa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `importe` float NOT NULL DEFAULT '50',
  `concepto` varchar(255) NOT NULL,
  `id_agente` int(11) NOT NULL,
  `id_coche` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_baja` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_multas_coches1_idx` (`id_coche`),
  KEY `fk_multas_agentes1_idx` (`id_agente`),
  CONSTRAINT `FK_multa_agente1` FOREIGN KEY (`id_agente`) REFERENCES `agente` (`id`),
  CONSTRAINT `fk_multas_coches1` FOREIGN KEY (`id_coche`) REFERENCES `coche` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dgt.multa: ~42 rows (aproximadamente)
/*!40000 ALTER TABLE `multa` DISABLE KEYS */;
INSERT INTO `multa` (`id`, `importe`, `concepto`, `id_agente`, `id_coche`, `fecha_alta`, `fecha_modificacion`, `fecha_baja`) VALUES
	(1, 200, 'por feo', 3, 2, '2019-01-07 10:37:38', '2019-01-16 13:58:23', NULL),
	(2, 500, 'exceso velocidad 240km/h', 1, 4, '2019-01-07 10:39:29', '2019-01-07 10:39:29', '2019-01-15 12:10:09'),
	(3, 700, 'por empinar codo 8.0', 2, 1, '2018-12-31 22:40:52', '2018-12-31 22:40:52', NULL),
	(4, 700, 'por empinar codo 8.0', 2, 1, '2019-01-07 10:42:38', '2019-01-07 10:42:38', NULL),
	(5, 50, 'otra multa', 1, 1, '2019-01-07 12:41:19', '2019-01-17 13:31:12', '2019-01-17 13:31:12'),
	(6, 300, 'correr mucho', 1, 4, '2019-01-07 12:41:39', '2019-01-16 12:57:24', NULL),
	(7, 100, 'prueba multa', 2, 3, '2019-01-11 13:45:24', '2019-01-11 13:45:24', NULL),
	(15, 100, 'me cago en sus muertos - oscar', 2, 1, '2019-01-11 14:04:20', '2019-01-16 12:00:35', '2019-01-16 12:00:35'),
	(16, 100, 'me cago en sus muertos - oscar', 2, 1, '2019-01-11 14:06:39', '2019-01-11 14:06:39', NULL),
	(17, 4000, 'Para que te compres otro coche', 2, 2, '2019-01-11 14:13:28', '2019-01-11 14:13:28', NULL),
	(18, 1000, 'por gitano alma tu raza', 2, 4, '2019-01-11 14:18:19', '2019-01-11 14:18:19', '2019-01-15 14:23:41'),
	(19, 300, 'ewqedfrewqqsdw', 2, 4, '2019-01-14 10:33:48', '2019-01-14 10:33:48', '2019-01-16 10:18:14'),
	(20, 450, 'porque oscar es tonto', 2, 4, '2019-01-14 12:50:11', '2019-01-14 12:50:11', NULL),
	(21, 500, 'oscaaaar', 2, 4, '2019-01-14 12:51:08', '2019-01-14 12:51:08', NULL),
	(22, 45, 'A', 2, 4, '2019-01-14 13:05:26', '2019-01-16 12:00:11', '2019-01-16 12:00:11'),
	(23, 200, 'porque si', 2, 4, '2019-01-16 08:30:06', '2019-01-16 08:30:06', NULL),
	(24, 10, 'por que si otra vez', 2, 4, '2019-01-16 08:32:24', '2019-01-16 08:32:24', NULL),
	(25, 666.66, 'Mikel Fitipaldi', 2, 1, '2019-01-16 10:05:13', '2019-01-16 10:05:13', NULL),
	(26, 5, 'Te multo con 5 euros por estar en mi p*** barrio', 2, 1, '2019-01-16 10:10:02', '2019-01-16 11:51:16', '2019-01-16 11:51:16'),
	(27, 999, 'CAGOENDIOOOOOOOS ANDE VAS', 2, 1, '2019-01-16 10:13:04', '2019-01-16 10:13:04', NULL),
	(28, 2, 'Marica', 2, 1, '2019-01-16 10:39:53', '2019-01-16 11:51:03', NULL),
	(29, 50, 'rthyjuwrghjgfdsadf', 2, 4, '2019-01-16 10:44:18', '2019-01-16 10:44:18', NULL),
	(30, 45, 'por el culo te la hinco', 2, 1, '2019-01-16 12:05:01', '2019-01-16 12:24:12', NULL),
	(31, 12, 'kas de naranja', 2, 1, '2019-01-16 12:25:38', '2019-01-16 12:25:38', NULL),
	(32, 1, 'ahora deja?', 2, 1, '2019-01-16 12:30:11', '2019-01-16 12:45:18', NULL),
	(33, 12.12, 'ahora si?', 2, 1, '2019-01-16 12:45:31', '2019-01-16 13:18:45', NULL),
	(34, 300, 'prueba majonei', 1, 4, '2019-01-16 12:58:43', '2019-01-16 12:58:43', NULL),
	(35, 300, 'prueba majonei', 1, 4, '2019-01-16 12:59:03', '2019-01-17 08:41:00', NULL),
	(36, 300, 'porque me da la real gana', 3, 2, '2019-01-16 13:00:25', '2019-01-16 13:56:04', NULL),
	(47, 100, 'prueba desde movil', 1, 4, '2019-01-17 14:05:02', '2019-01-17 14:05:02', NULL),
	(48, 100, 'prueba desde movil', 1, 4, '2019-01-17 14:05:36', '2019-01-17 14:05:36', NULL),
	(49, 100, 'prueba desde movil', 1, 4, '2019-01-17 14:06:12', '2019-01-17 14:06:12', NULL),
	(50, 111, 'hedduuwuxuss', 1, 4, '2019-01-17 14:06:37', '2019-01-17 14:06:37', NULL),
	(51, 100, 'ssduwdwidd', 1, 4, '2019-01-17 14:08:05', '2019-01-17 14:08:05', NULL),
	(52, 100, 'ssduwdwidd', 1, 4, '2019-01-17 14:08:33', '2019-01-17 14:08:33', NULL),
	(53, 100, 'ddjwiwisisisisi', 1, 4, '2019-01-17 14:08:54', '2019-01-17 14:08:54', NULL),
	(54, 1111, 'wwdsjsjjsjsjaja', 1, 4, '2019-01-17 14:09:07', '2019-01-17 14:09:07', NULL),
	(55, 15, 'Pork Óscar nabaja bien ', 4, 4, '2019-01-17 14:18:11', '2019-01-17 14:18:27', '2019-01-17 14:18:27'),
	(56, 222, '22222222', 4, 4, '2019-01-17 14:23:31', '2019-01-17 14:23:31', NULL),
	(57, 222, 'oscar feo', 4, 4, '2019-01-17 14:23:50', '2019-01-17 14:23:50', NULL),
	(58, 33, 'shshshhshshshshw', 1, 4, '2019-01-18 08:50:00', '2019-01-18 08:51:46', '2019-01-18 08:51:46'),
	(59, 100, 'prueba', 2, 2, '2019-03-22 09:05:00', '2019-03-22 09:05:00', NULL);
/*!40000 ALTER TABLE `multa` ENABLE KEYS */;

-- Volcando estructura para procedimiento dgt.PA_dgt_anular
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `PA_dgt_anular`(IN p_id INT)
    READS SQL DATA
    DETERMINISTIC
BEGIN
	UPDATE multa SET fecha_modificacion = current_timestamp(), fecha_baja = current_timestamp() WHERE id=p_id;
END//
DELIMITER ;

-- Volcando estructura para procedimiento dgt.PA_dgt_getAll
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `PA_dgt_getAll`(IN p_id INT)
    READS SQL DATA
    DETERMINISTIC
BEGIN
	SELECT m.id as 'id_multa', c.matricula as 'matricula',c.modelo as 'modelo', m.fecha_alta as 'fecha', m.fecha_baja as 'fecha_baja', m.concepto as 'concepto' FROM multa as m, coche as c, agente as a WHERE m.id_coche = c.id AND a.id = m.id_agente AND a.id = p_id order by m.id desc;
END//
DELIMITER ;

-- Volcando estructura para procedimiento dgt.PA_dgt_getAnuladas
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `PA_dgt_getAnuladas`(IN p_id INT)
    READS SQL DATA
    DETERMINISTIC
BEGIN

	SELECT m.id as 'id_multa', c.matricula as 'matricula', c.modelo as 'modelo',  m.fecha_alta as 'fecha_alta', m.fecha_baja as 'fecha_baja', m.concepto as 'concepto' FROM multa as m, coche as c, agente as a WHERE m.id_coche = c.id AND a.id = m.id_agente AND a.id = p_id AND m.fecha_baja IS NOT NULL  order by m.id desc;

END//
DELIMITER ;

-- Volcando estructura para procedimiento dgt.PA_dgt_getByMatricula
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `PA_dgt_getByMatricula`(IN p_matricula VARCHAR(10))
    READS SQL DATA
    DETERMINISTIC
BEGIN
	SELECT id, matricula from coche where matricula = p_matricula;
END//
DELIMITER ;

-- Volcando estructura para procedimiento dgt.PA_dgt_habilitar
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `PA_dgt_habilitar`(IN p_id INT)
BEGIN
	UPDATE multa SET fecha_modificacion = current_timestamp(), fecha_baja = null WHERE id=p_id;
END//
DELIMITER ;

-- Volcando estructura para procedimiento dgt.PA_dgt_insertarMulta
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `PA_dgt_insertarMulta`(IN p_importe FLOAT, IN p_concepto VARCHAR(255), IN p_id_coche INT, IN p_id_agente INT)
    READS SQL DATA
    DETERMINISTIC
BEGIN

	INSERT INTO multa(importe, concepto, id_coche, id_agente) VALUES (p_importe, p_concepto, p_id_coche, p_id_agente);
    
END//
DELIMITER ;

-- Volcando estructura para procedimiento dgt.PA_dgt_objetivosAnyo
DELIMITER //
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `PA_dgt_objetivosAnyo`(IN p_id int)
BEGIN
select round(sum(importe),2) as 'total' from multa where id_agente = p_id and year(fecha_alta)=year(now());
END//
DELIMITER ;

-- Volcando estructura para procedimiento dgt.PA_dgt_objetivosMes
DELIMITER //
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `PA_dgt_objetivosMes`(IN p_id int)
BEGIN
select round(sum(importe),2) as 'total' from multa where id_agente = p_id and month(fecha_alta)=month(now());
END//
DELIMITER ;

-- Volcando estructura para vista dgt.v_dgt_objetivos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_dgt_objetivos` (
	`id_agente` INT(11) NOT NULL,
	`total` DOUBLE(19,2) NULL,
	`mes` INT(2) NULL,
	`anyo` INT(4) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista dgt.v_dgt_objetivos
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_dgt_objetivos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `v_dgt_objetivos` AS SELECT 
        `dgt`.`multa`.`id_agente` AS `id_agente`,
        ROUND(SUM(`dgt`.`multa`.`importe`), 2) AS `total`,
        MONTH(`dgt`.`multa`.`fecha_alta`) AS `mes`,
        YEAR(`dgt`.`multa`.`fecha_alta`) AS `anyo`
    FROM
        `dgt`.`multa`
    GROUP BY MONTH(`dgt`.`multa`.`fecha_alta`), id_agente
    ORDER BY `dgt`.`multa`.`fecha_alta` DESC ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
