


chmod -R 775 /var/www/html/wordpress;

chown -R www-data /var/www/html/wordpress;
chgrp -R www-data /var/www/html/wordpress;

mkdir -p /run/php/;
touch /run/php/php7.4-fpm.pid;

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html/wordpress;
wp core download --allow-root;
mv /var/www/wp-config.php /var/www/html/wordpress;

sed -i "s/\$WORDPRESS_DB_NAME/$WORDPRESS_DB_NAME/g" /var/www/html/wordpress/wp-config.php
sed -i "s/\$WORDPRESS_DB_USER/$WORDPRESS_DB_USER/g" /var/www/html/wordpress/wp-config.php
sed -i "s/\$WORDPRESS_DB_PASSWORD/$WORDPRESS_DB_PASSWORD/g" /var/www/html/wordpress/wp-config.php
sed -i "s/\$WORDPRESS_DB_HOST/$WORDPRESS_DB_HOST/g" /var/www/html/wordpress/wp-config.php

wp core install --allow-root --url=$WORDPRESS_DB_USER.42.fr --title=wordpress --admin_user=root --admin_password=$MYSQL_ROOT_PASSWORD --admin_email=root@42.fr;
wp user create $WORDPRESS_DB_USER $WORDPRESS_DB_USER@42.fr --user_pass=${WORDPRESS_DB_PASSWORD} --role=author --allow-root;
fi

/usr/sbin/php-fpm7.4 -F
