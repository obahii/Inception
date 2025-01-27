FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y nginx && apt install openssl -y

COPY conf/default /etc/nginx/sites-enabled/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=MA/CN=login.1337.ma";

CMD nginx -g 'daemon off;'
