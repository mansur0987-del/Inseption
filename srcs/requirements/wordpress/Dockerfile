FROM debian

RUN apt update && apt install -y php7.4 php-mysqli php-fpm curl sendmail

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools /var/www/

EXPOSE 9000

CMD bash /var/www/start.sh
