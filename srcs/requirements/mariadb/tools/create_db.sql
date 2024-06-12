CREATE DATABASE wordpress;
CREATE USER 'obahi'@'%' IDENTIFIED BY '031120';
GRANT ALL PRIVILEGES ON wordpress.* TO 'obahi'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'roottoor';


