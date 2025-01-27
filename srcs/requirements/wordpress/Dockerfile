FROM debian:buster

RUN apt update \
	&& apt upgrade -y \
	&& apt -y install wget php7.3-fpm php-mysql mariadb-client -y

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY ./tools/script.sh /tmp/script.sh

RUN chmod +x /tmp/script.sh

ENTRYPOINT [ "/tmp/script.sh" ]

CMD [ "php-fpm7.3" , "-F"]
