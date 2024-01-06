CREATE USER 'swcamp'@'%' IDENTIFIED BY 'swcamp';
SHOW DATABASES;
USE mysql;

SELECT * FROM USER;
CREATE DATABASE menudb;
USE menudb;

GRANT ALL PRIVILEGES ON menudb.* TO 'swcamp'@'%';

SHOW GRANTS FOR 'swcamp'@'%';
