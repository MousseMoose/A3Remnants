-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table arma.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '0',
  `unit` varchar(75) NOT NULL DEFAULT '0',
  `worldId` int(10) unsigned NOT NULL DEFAULT 0,
  `pos` varchar(200) NOT NULL DEFAULT '0',
  `inventory` varchar(2500) NOT NULL DEFAULT '0',
  `medical` varchar(250) NOT NULL DEFAULT '0',
  `skills` varchar(250) NOT NULL DEFAULT '0',
  `alive` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `lastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `worldid` (`worldId`),
  CONSTRAINT `worldid` FOREIGN KEY (`worldId`) REFERENCES `worlds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table arma.profilerespawns
CREATE TABLE IF NOT EXISTS `profilerespawns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `respawn` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unitRespawn_respawnId` (`respawn`),
  KEY `unitRespawn_uid` (`uid`),
  CONSTRAINT `unitRespawn_respawnId` FOREIGN KEY (`respawn`) REFERENCES `respawns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unitRespawn_uid` FOREIGN KEY (`uid`) REFERENCES `profiles` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table arma.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `uid` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `rep` double DEFAULT NULL,
  `score` double DEFAULT NULL,
  `orgid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table arma.respawns
CREATE TABLE IF NOT EXISTS `respawns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `worldid` int(10) unsigned NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT '0',
  `pos` varchar(200) NOT NULL,
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `intact` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `capacity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `respawn_wid` (`worldid`),
  CONSTRAINT `respawn_wid` FOREIGN KEY (`worldid`) REFERENCES `worlds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table arma.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(75) NOT NULL DEFAULT 'B_INVALID',
  `worldId` int(10) unsigned NOT NULL DEFAULT 1,
  `pos` varchar(200) NOT NULL DEFAULT '[[0,0,0],0]',
  `fuel` double NOT NULL DEFAULT 1,
  `hitpoints` varchar(150) NOT NULL DEFAULT '[]',
  `turretmags` varchar(1000) NOT NULL DEFAULT '[]',
  `turretweps` varchar(500) NOT NULL DEFAULT '[]',
  `cargo_gmib` varchar(30000) NOT NULL DEFAULT '[]',
  `cargo_misc` varchar(1000) NOT NULL DEFAULT '[]',
  `vehlock` varchar(10) NOT NULL DEFAULT '[]',
  `textures` varchar(250) NOT NULL DEFAULT '[]',
  `components` varchar(250) NOT NULL DEFAULT '[]',
  `garage` int(10) unsigned NOT NULL DEFAULT 0,
  `alive` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `worldIdVehicles` (`worldId`),
  CONSTRAINT `worldIdVehicles` FOREIGN KEY (`worldId`) REFERENCES `worlds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table arma.worlds
CREATE TABLE IF NOT EXISTS `worlds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
