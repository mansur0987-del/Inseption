-- создание БД
CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;
-- создание клиента и указание пароля
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
-- предоставление всех прав для работы с созданной БД
GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%';
-- сохранение изменений
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
