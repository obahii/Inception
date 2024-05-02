#!/bin/bash

apt update
apt -y upgrade
apt install -y nginx

apt install -y vim
apt install -y curl
apt install -y wget

apt-get install mariadb-server -y
service mariadb start


SQL_DB=wordpress_db
SQL_USER=obahi
SQL_PASSWD=031120
SQL_ROOT_PASSWD=root031120
mariadb >
	CREATE DATABASE IF NOT EXISTS `"$SQL_DB"`
	CREATE USER IF NOT EXISTS `"$SQL_USER"`@'%' IDENTIFIED BY '${SQL_PASSWD}';
	GRANT ALL PRIVILEGES ON `"${SQL_DB}"`.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWD}';
	'ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWD}';'

mariadb -u root -proot031120 -e "FLUSH PRIVILEGES;"
mysqladmin -u root -proot031120 shutdown
mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'


apt install php php-fpm php-mysql mariadb-client -y

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
wp-cli core download --allow-root --path=/var/www/wordpress
cd /var/www/wordpresscd 
mv /var/www/wordpress/wp-config-sample.php  /var/www/wordpress/wp-config.php
sed -i '36 s/\/run\/php\/php7.4-fpm.sock/9000/' /etc/php/7.4/fpm/pool.d/www.confc

wp config create	--allow-root \
					--dbname=$SQL_DB \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWD \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp-cli config set --allow-root DB_NAME ${MYSQLDB} 
wp-cli config set --allow-root DB_USER ${MSQLUSER}
wp-cli config set --allow-root DB_PASSWORD ${MYSQLPASSWORD}
wp-cli config set --allow-root DB_HOST "mariadb:3306"

wp-cli core install --url=$DOMAINNAME --title=$TITLE --admin_user=$ADMINNAME --admin_password=$ADMINPASSWORD --admin_email=$ADMINEMAIL --allow-root 

wp-cli user create ${NEWUSER} ${NEWEMAIL} --user_pass=$NEWPASS --role=$NEWROLE --allow-root

mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F