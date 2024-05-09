FROM debian:bookworm-backports

RUN apt update

RUN apt upgrade -y

RUN apt-get install mariadb-server -y

EXPOSE 3306

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh /tmp/

RUN chmod +x /tmp/script.sh

ENTRYPOINT /tmp/script.sh
