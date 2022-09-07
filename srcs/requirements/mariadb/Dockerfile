# создаем родительский образ
FROM debian

# устанавливаем пакеты в родительский образ
RUN apt update && apt install -y mariadb-server

# копируем конфигурации БД в контейнер
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

# открываем порт для прослушивания
EXPOSE 3306

CMD bash /var/www/start.sh
