FROM debian:buster

RUN apt -y update && apt install -y nginx && apt install openssl -y

RUN apt install vim -y

RUN apt install curl -y

EXPOSE	443

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=MA/CN=obahi.42.fr";

COPY conf/nginx.conf /etc/nginx/conf.d/

CMD [ "nginx", "-g", "daemon off;" ]
