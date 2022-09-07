sed -i "s/\$WORDPRESS_DB_NAME/$WORDPRESS_DB_NAME/i" /var/www/conf.sql
sed -i "s/\$MYSQL_USER/$MYSQL_USER/i" /var/www/conf.sql
sed -i "s/\$MYSQL_PASSWORD/$MYSQL_PASSWORD/i" /var/www/conf.sql
sed -i "s/\$MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/i" /var/www/conf.sql

service mariadb start;
mariadb -e "source /var/www/conf.sql"
mariadb-admin -uroot -p$MYSQL_ROOT_PASSWORD shutdown

/usr/bin/mysqld_safe

