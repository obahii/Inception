#!/bin/bash

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp-cli
mkdir -p /var/www/wordpress
cd /var/www/wordpress
chmod -R 777 /var/www/wordpress
wp-cli core download --allow-root --path=/var/www/wordpress
mv /var/www/wordpress/wp-config-sample.php  /var/www/wordpress/wp-config.php
sed -i '36 s/\/run\/php\/php7.4-fpm.sock/9000/' /etc/php/7.4/fpm/pool.d/www.confc

# wp config create	--allow-root \
# 					--dbname=$SQL_DB \
# 					--dbuser=$SQL_USER \
# 					--dbpass=$SQL_PASSWD \
# 					--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp-cli config set --allow-root DB_NAME ${SQL_DB} 
wp-cli config set --allow-root DB_USER ${SQL_USER}
wp-cli config set --allow-root DB_PASSWORD ${SQL_PASSWD}
wp-cli config set --allow-root DB_HOST "mariadb:3306"

wp-cli core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$ADMIN --admin_password=$ADMIN_PASSWD--admin_email=$ADMIN_EMAIL --allow-root 

wp-cli user create ${NEW_USER} ${NEW_EMAIL} --user_pass=$NEW_PASSWD --role=$NEW_ROLE --allow-root

mkdir -p /run/php

exec $@