FROM debian

RUN apt update && apt install -y nginx openssl

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/start.sh /var/www

EXPOSE 443

CMD bash /var/www/start.sh
