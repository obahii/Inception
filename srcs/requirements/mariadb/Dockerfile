FROM debian:buster

RUN apt update

RUN apt upgrade -y

RUN apt-get install mariadb-server -y

EXPOSE 3306

ENV SQL_DB=wordpress_db
ENV SQL_USER=obahi
ENV SQL_PASSWD=031120
ENV SQL_ROOT_PASSWD=roottoor

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh /tmp/

RUN chmod +x /tmp/script.sh

CMD bash /tmp/script.sh
