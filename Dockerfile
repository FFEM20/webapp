FROM ubuntu:latest

LABEL maintainer="ffem@hcuge.ch"

RUN apt-get update

RUN apt-get install -y \
    nginx

RUN DEBIAN_FRONTEND=noninteractive  apt-get install git -y

RUN  sed -i '23 {s/^/#/}' /etc/nginx/sites-available/default

RUN rm -Rf /var/www/html/*
RUN git clone https://github.com/diranetafen/static-website-example /var/www/html/


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


