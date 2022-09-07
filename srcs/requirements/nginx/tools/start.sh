

if [ ! -f /etc/ssl/certs/nginx.crt ]; then

openssl req -x509 -nodes -newkey rsa:2048 -sha256 -days 365 \
			-keyout /etc/ssl/private/nginx.key \
			-out /etc/ssl/certs/nginx.crt \
			-subj '/C=RU/ST=Moscow/L=Moscow/O=wordpress/CN=armaxima.42.fr';

fi

nginx -g 'daemon off;';

