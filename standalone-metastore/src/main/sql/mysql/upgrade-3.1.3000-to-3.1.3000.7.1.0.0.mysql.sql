CREATE TABLE IF NOT EXISTS `CDH_VERSION` (
  `VER_ID` BIGINT NOT NULL,
  `SCHEMA_VERSION` VARCHAR(127) NOT NULL,
  `VERSION_COMMENT` VARCHAR(255),
  PRIMARY KEY (`VER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO CDH_VERSION (VER_ID, SCHEMA_VERSION, VERSION_COMMENT) VALUES (1, '3.1.3000.7.1.0.0', 'Hive release version 3.1.3000 for CDH 7.1.0.0');

SELECT 'Finished upgrading MetaStore schema from 3.1.3000 to 3.1.3000.7.1.0.0';