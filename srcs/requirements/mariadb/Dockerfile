FROM debian:buster

RUN apt update \
	&& apt upgrade -y \
	&& apt-get install -y procps mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/

COPY tools/script.sh /tmp/

# COPY tools/create_db.sql /tmp/

RUN chmod +x /tmp/script.sh

CMD ["/tmp/script.sh"]
