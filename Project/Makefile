# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/21 08:52:00 by marvin            #+#    #+#              #
#    Updated: 2024/10/21 08:52:00 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS_DIR 			= 	srcs
SECRETS_DIR			= 	secrets
CERTIFICATES_DIR	= 	$(SECRETS_DIR)/certificates

# image build directories
BUILD_DIR			= 	$(SRCS_DIR)/requirements
NGINX_DIR 			= 	$(BUILD_DIR)/nginx
MARIADB_DIR 		= 	$(BUILD_DIR)/mariadb
WORDPRESS_DIR 		= 	$(BUILD_DIR)/wordpress

# volume mount directories
VOLUME_MOUNT		= 	/home/manuel/dockerVolume
WORDPRESS_VOLUME	= 	$(VOLUME_MOUNT)/wordpress
MARIADB_VOLUME		= 	$(VOLUME_MOUNT)/mariadb


# config files
CONFIG_FILE 		= 	config.env
CONFIG_PATH			= 	$(SRCS_DIR)/$(CONFIG_FILE)

# compose files
COMPOSE_FILE		= 	docker-compose.yaml
COMPOSE_PATH		= 	$(SRCS_DIR)/$(COMPOSE_FILE)

# file descrimination
SECRETS_FILES		= 	$(SECRETS_DIR)/db_name.txt					 	\
						$(SECRETS_DIR)/db_user.txt						\
					  	$(SECRETS_DIR)/db_password.txt					\
					  	$(SECRETS_DIR)/db_root_password.txt 			\
						$(SECRETS_DIR)/wp_admin_user.txt				\
					  	$(SECRETS_DIR)/wp_admin_pass.txt				\
						$(SECRETS_DIR)/wp_admin_mail.txt				\
						$(SECRETS_DIR)/wp_user_user.txt					\
					  	$(SECRETS_DIR)/wp_user_pass.txt					\
						$(SECRETS_DIR)/wp_user_mail.txt

SELF-SIGNED_KEY		= 	$(CERTIFICATES_DIR)/selfsigned.key
SELF-SIGNED_CERT	= 	$(CERTIFICATES_DIR)/selfsigned.crt

NGINX_FILES			= 	$(NGINX_DIR)/Dockerfile 						\
					  	$(NGINX_DIR)/conf/nginx_template.conf

MARIADB_FILES		= 	$(MARIADB_DIR)/Dockerfile						\
						$(MARIADB_DIR)/tools/runMariaDB.sh

WORDPRESS_FILES 	= 	$(WORDPRESS_DIR)/Dockerfile						\
						$(WORDPRESS_DIR)/conf/php-fpm_template.conf		\
						$(WORDPRESS_DIR)/tools/runWordpress.sh



all: $(CONFIG_PATH) $(SECRETS_FILES) $(NGINX_FILES) $(MARIADB_FILES) $(WORDPRESS_FILES) nginx-config phpfpm-config generate-certs
	@mkdir -p $(WORDPRESS_VOLUME)
	@mkdir -p $(MARIADB_VOLUME)

	docker compose -f $(COMPOSE_PATH) --env-file $(CONFIG_PATH) up --build

	#clean


clean:
	rm -rf $(WORDPRESS_DIR)/conf/php-fpm.conf
	rm -rf $(NGINX_DIR)/conf/nginx.conf
	rm -rf $(CERTIFICATES_DIR)
	rm -rf $(WORDPRESS_VOLUME)
	rm -rf $(MARIADB_VOLUME)

fclean: clean
	yes | docker system prune -a -f
	yes | docker image prune -a -f
	yes | docker container prune -f
	yes | docker builder prune -a -f
	yes | docker network prune -f
	yes | docker volume prune -f

re: fclean all

git: fclean
	(cd .. && git add . && git commit -m "update" && git push)



nginx-config: $(NGINX_FILES)
	( \
		export $(shell cat $(CONFIG_PATH)); \
		var_list=$$(cat $(CONFIG_PATH) | awk '{print $$1}' | cut -d '=' -f1 | sed 's/^/$$/' | paste -sd, - | sed "s/^/'/" | sed "s/$$/'/"); \
		envsubst $$var_list < $(NGINX_DIR)/conf/nginx_template.conf > $(NGINX_DIR)/conf/nginx.conf; \
	)

phpfpm-config: $(WORDPRESS_FILES)
	( \
		export $(shell cat $(CONFIG_PATH)); \
		var_list=$$(cat $(CONFIG_PATH) | awk '{print $$1}' | cut -d '=' -f1 | sed 's/^/$$/' | paste -sd, - | sed "s/^/'/" | sed "s/$$/'/"); \
		envsubst $$var_list < $(WORDPRESS_DIR)/conf/php-fpm_template.conf > $(WORDPRESS_DIR)/conf/php-fpm.conf; \
	)

generate-certs:
	( \
		export $(cat $(CONFIG_PATH) | xargs); \
		mkdir -p $(CERTIFICATES_DIR); \
		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
				-keyout $(SELF-SIGNED_KEY) \
				-out $(SELF-SIGNED_CERT) \
				-subj "/C=PT/ST=Lisbon/L=Lisbon/O=42Lisboa/CN=$DOMAIN_NAME"; \
	)

.PHONY: clean fclean re git nginx-config  phpfpm-config generate-certs
