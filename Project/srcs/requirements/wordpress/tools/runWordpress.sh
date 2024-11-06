#! /bin/bash

php_version=$(php -v | head -n 1 | cut -d ' ' -f 2 | cut -d '.' -f -2)
php_fpm=php-fpm$php_version

if [ ! -f wp-config.php ];
then

	MYSQL_DB_NAME=$(cat "$MYSQL_DB_NAME_FILE")
	MYSQL_USER=$(cat "$MYSQL_USER_FILE")
	MYSQL_PASSWORD=$(cat "$MYSQL_PASSWORD_FILE")
	WP_ADMIN_USER=$(cat "$WP_ADMIN_USER_FILE")
	WP_ADMIN_PASS=$(cat "$WP_ADMIN_PASS_FILE")
	WP_ADMIN_MAIL=$(cat "$WP_ADMIN_MAIL_FILE")
	WP_USER_USER=$(cat "$WP_USER_USER_FILE")
	WP_USER_PASS=$(cat "$WP_USER_PASS_FILE")
	WP_USER_MAIL=$(cat "$WP_USER_MAIL_FILE")


	wp core download --allow-root

	wp config create --allow-root \
					 --dbname=$MYSQL_DB_NAME \
					 --dbuser=$MYSQL_USER \
					 --dbpass=$MYSQL_PASSWORD \
					 --dbhost="${HOSTNAME_DB}:${PORT_LISTEN_DATABASE}"

	wp plugin install redis-cache --activate --allow-root
	wp config set WP_REDIS_HOST "${HOSTNAME_REDIS}" --allow-root
	wp config set WP_REDIS_PORT ${PORT_LISTEN_REDIS} --allow-root
	wp config set WP_CACHE true --allow-root
	wp redis enable --allow-root

	wp core install  --allow-root \
					 --skip-email \
					 --title=${WEBSITE_TITLE} \
					 --url=${DOMAIN_NAME} \
					 --admin_user=$WP_ADMIN_USER \
					 --admin_password=$WP_ADMIN_PASS \
					 --admin_email=$WP_ADMIN_MAIL

	wp user create   --allow-root $WP_USER_USER $WP_USER_MAIL \
					 --user_pass=$WP_USER_PASS

	echo "CONFIG IS DONE"
fi

exec /usr/sbin/php-fpm7.4 -F
