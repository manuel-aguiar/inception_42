#! /bin/bash


php_version=$(php -v | head -n 1 | cut -d ' ' -f 2 | cut -d '.' -f -2)
php_fpm=php$php_version-fpm