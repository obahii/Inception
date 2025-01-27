#!/bin/bash

service mysql start

# while ! mysqladmin ping -hlocalhost --silent; do
#     sleep 1
# done

# mysql -u root < /tmp/create_db.sql
echo "CREATE DATABASE $DB_NAME;" | mysql -u root
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" | mysql -u root
echo "FLUSH ALL PRIVILEGES;" | mysql -u root
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWD';" | mysql -u root

mysqladmin -u root -p"$DB_ROOT_PASSWD" shutdown

#kill $(cat /var/run/mysqld/mysqld.pid)

#service mysql stop

mysqld_safe
