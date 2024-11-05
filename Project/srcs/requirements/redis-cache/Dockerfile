# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: codespace <codespace@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/05 14:29:53 by codespace         #+#    #+#              #
#    Updated: 2024/11/05 14:48:50 by codespace        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM 		debian:bullseye-slim

COPY 		tools/runRedisCache.sh /etc/runRedisCache.sh

RUN 		apt-get update -y && \
			apt-get install redis-server --no-install-recommends -y && \
			\
			chmod +x /etc/runRedisCache.sh && \
			\
			apt-get clean && \
			rm -rf /var/lib/apt/lists/*

STOPSIGNAL 	SIGINT



ENTRYPOINT	["/etc/runRedisCache.sh"]
