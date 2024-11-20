SET GLOBAL log_bin_trust_function_creators = 1;

DROP SCHEMA IF EXISTS SimpleCo;
CREATE SCHEMA SimpleCo;
USE SimpleCo;

DROP USER IF EXISTS 'dbtester';
CREATE USER 'dbtester' IDENTIFIED BY 'CPSC4620'; 
GRANT ALL ON SimpleCo.* TO 'dbtester';
