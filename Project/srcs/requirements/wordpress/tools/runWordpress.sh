#! /bin/bash

php_version=$(php -v | head -n 1 | cut -d ' ' -f 2 | cut -d '.' -f -2)
php_fpm=php-fpm$php_version

if [ ! -f wp-config.php ];
then
	wp core download --allow-root

	wp config create --allow-root \
					 --dbname=$MYSQL_DATABASE_FILE \
					 --dbuser=$MYSQL_USER_FILE \
					 --dbpass=$MYSQL_PASSWORD_FILE \
					 --dbhost="${HOSTNAME_DB}:${PORT_LISTEN_DATABASE}"

	wp core install  --allow-root \
					 --skip-email \
					 --title=${WEBSITE_TITLE} \
					 --url=${DOMAIN_NAME} \
					 --admin_user=$WP_ADMIN_USER_FILE \
					 --admin_password=$WP_ADMIN_PASS_FILE \
					 --admin_email=$WP_ADMIN_MAIL_FILE

	wp user create   --allow-root $WP_USER_USER_FILE $WP_USER_MAIL_FILE \
					 --user_pass=$WP_USER_PASS_FILE
fi

/usr/sbin/$php_fpm -F
