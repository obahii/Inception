#!/bin/bash

service mariadb start

while ! mysqladmin ping -hlocalhost --silent; do
    sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DB}\`; \
            CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWD}'; \
            GRANT ALL PRIVILEGES ON ${SQL_DB}.* TO \`${SQL_USER}\`@'%';
            ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWD}';"

mysql -u root  -e "FLUSH PRIVILEGES;"
mkdir /var/log/mysql/

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld_safe