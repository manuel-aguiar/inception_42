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

BUILD_DIR			= 	$(SRCS_DIR)/requirements
NGINX_DIR 			= 	$(BUILD_DIR)/nginx
MARIADB_DIR 		= 	$(BUILD_DIR)/mariadb
WORDPRESS_DIR 		= 	$(BUILD_DIR)/wordpress


CONFIG_FILE 		= 	config.env
CONFIG_PATH			= 	$(SRCS_DIR)/$(CONFIG_FILE)

SECRETS_FILES		= 	$(SECRETS_DIR)/credentials.txt				 	\
					  	$(SECRETS_DIR)/db_password.txt					\
					  	$(SECRETS_DIR)/db_root_password.txt 			\
					  	$(SECRETS_DIR)/db_user.txt

NGINX_FILES			= 	$(NGINX_DIR)/Dockerfile 						\
					  	$(NGINX_DIR)/tools/nginx_template.conf

MARIADB_FILES		= 	$(MARIADB_DIR)/Dockerfile

WORDPRESS_FILES 	= 	$(WORDPRESS_DIR)/Dockerfile


all: $(CONFIG_PATH) $(SECRETS_FILES) $(NGINX_FILES) $(MARIADB_FILES) $(WORDPRESS_FILES)
	@cp $(CONFIG_PATH) $(NGINX_DIR)
	@cp $(CONFIG_PATH) $(MARIADB_DIR)
	@cp $(CONFIG_PATH) $(WORDPRESS_DIR)

	docker compose -f srcs/docker-compose.yaml up --build

	@rm $(NGINX_DIR)/$(CONFIG_FILE)
	@rm $(MARIADB_DIR)/$(CONFIG_FILE)
	@rm $(WORDPRESS_DIR)/$(CONFIG_FILE)


clean:
	if [ -f $(NGINX_DIR)/$(CONFIG_FILE) ]; then rm $(NGINX_DIR)/$(CONFIG_FILE); fi
	if [ -f $(MARIADB_DIR)/$(CONFIG_FILE) ]; then rm $(MARIADB_DIR)/$(CONFIG_FILE); fi
	if [ -f $(WORDPRESS_DIR)/$(CONFIG_FILE) ]; then rm $(WORDPRESS_DIR)/$(CONFIG_FILE); fi

fclean: clean

git: fclean
	(cd .. && git add . && git commit -m "update" && git push)

.PHONY: clean fclean git
