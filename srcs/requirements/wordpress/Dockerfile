FROM debian:buster

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get -y install wget

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

RUN wget https://wordpress.org/wordpress-6.5.2.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.5.2.tar.gz && rm wordpress-6.5.2.tar.gz

RUN	chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script.sh /tmp/script.sh

# change the permission of script.sh
RUN chmod +x /tmp/script.sh

# run the script.sh
ENTRYPOINT [ "/tmp/script.sh" ]

# PHP-FPM to run in the foreground, that is, to not fork into the background as a daemon. This makes it so that the process will run and output any logs to the console where it was started.
CMD [ "php-fpm7.3", "-F" ]

