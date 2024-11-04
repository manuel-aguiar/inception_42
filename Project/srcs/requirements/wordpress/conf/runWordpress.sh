#! /bin/bash


php_version=$(php -v | head -n 1 | cut -d ' ' -f 2 | cut -d '.' -f -2)
php_fpm=php-fpm$php_version



if [ ! -f wp-config.php ];
then
	wp core download --allow-root

	wp config create --allow-root \
					 --dbname=$SQL_DB \
					 --dbuser=$SQL_USER \
					 --dbpass=$SQL_PASS \
					 --dbhost=mariadb

	wp core install  --allow-root \
					 --skip-email \
					 --title="inception" \
					 --url=$WP_ADM_URL \
					 --admin_user=$WP_ADM_USER \
					 --admin_password=$WP_ADM_PASS \
					 --admin_email=$WP_ADM_MAIL

	wp user create   --allow-root $WP_USER $WP_MAIL \
					 --user_pass=$WP_PASS
fi

/usr/sbin/$php_fpm -F
