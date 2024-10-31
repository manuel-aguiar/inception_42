#! /bin/bash

if ! [ -d "test123" ]; 
then
	service mariadb start

	mariadb -u root -e "
	CREATE DATABASE IF NOT EXISTS test123;
	CREATE USER IF NOT EXISTS 'toze'@'%' IDENTIFIED BY 'toze';
	GRANT ALL PRIVILEGES ON test123.* TO 'toze'@'%';
	FLUSH PRIVILEGES;
	SHUTDOWN;"
fi
mysqld_safe --bind-address=0.0.0.0