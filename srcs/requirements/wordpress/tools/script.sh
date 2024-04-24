#!/bin/bash

wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='/var/www/wordpress'

wp core install 	--url=$DOMAIN_NAME \
					--title="My Wordpress Site" \
					--admin_user=$ADMIN_USER \
					--admin_password=$ADMIN_PASSWORD \
					--admin_email=$ADMIN_EMAIL \
					--allow-root

wp user create $USER $USER_EMAIL --user_pass=$USER_PASSWORD --role='author' --allow-root