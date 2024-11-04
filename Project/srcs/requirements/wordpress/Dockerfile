# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/22 08:50:19 by marvin            #+#    #+#              #
#    Updated: 2024/10/22 08:50:19 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM 		debian:bullseye

COPY 		tools/runWordpress.sh /etc/runWordpress.sh

RUN 		apt-get update -y && \
			apt-get install curl php-fpm php-mysql php-cli -y && \
			\
			curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
			chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && \
			\
			chmod +x /etc/runWordpress.sh && \
			\
			apt-get clean && \
			rm -rf /var/lib/apt/lists/*

WORKDIR 	/var/www/html

STOPSIGNAL 	SIGQUIT

RUN 		mkdir -p /run/php

ENTRYPOINT  ["/etc/runWordpress.sh"]
