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

BUILD_DIR 		= srcs/requirements
NGINX_DIR 		= $(BUILD_DIR)/nginx
MARIADB_DIR 	= $(BUILD_DIR)/mariadb
WORDPRESS_DIR 	= $(BUILD_DIR)/wordpress

CONFIG_FILE 	= srcs/config.env

all: $(CONFIG_FILE)
	@cp $(CONFIG_FILE) $(NGINX_DIR)
	@cp $(CONFIG_FILE) $(MARIADB_DIR)
	@cp $(CONFIG_FILE) $(WORDPRESS_DIR)

	docker-compose -f srcs/docker-compose.yaml up --build

	@rm $(NGINX_DIR)/$(CONFIG_FILE)
	@rm $(MARIADB_DIR)/$(CONFIG_FILE)
	@rm $(WORDPRESS_DIR)/$(CONFIG_FILE)

