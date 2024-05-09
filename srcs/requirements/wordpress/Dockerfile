FROM debian:bookworm-backports

RUN apt update

RUN apt upgrade -y

RUN apt -y install wget

RUN apt install php8.2-fpm php-mysql mariadb-client -y

# ENV SQL_DB=wordpress_db
# ENV SQL_USER=obahi
# ENV SQL_PASSWD=031120
# ENV SQL_ROOT_PASSWD=roottoor
# ENV DOMAIN_NAME=obahi.42.fr

# ENV TITLE=obahi-home
# ENV ADMIN=obahi
# ENV ADMIN_PASSWD=031120
# ENV ADMIN_EMAIL=obahi@gmail.com

# ENV NEW_USER = bmeek
# ENV NEW_EMAIL = bmeek@gmail.com
# ENV NEW_PASSWD=031120
# ENV NEW_ROLE=author

EXPOSE 9000

COPY ./tools/script.sh /tmp/script.sh

RUN chmod +x /tmp/script.sh

ENTRYPOINT [ "/tmp/script.sh" ]

EXPOSE 9000

CMD [ "php-fpm8.2" , "-F"]

