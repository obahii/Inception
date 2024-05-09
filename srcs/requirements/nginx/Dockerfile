FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y nginx && apt install openssl -y

RUN apt install vim -y

# EXPOSE	443
EXPOSE	80

COPY conf/index.html /var/www/html/
COPY conf/nginx.conf /etc/nginx/conf.d/

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=MA/CN=obahi.42.fr";

CMD nginx -g 'daemon off;'
