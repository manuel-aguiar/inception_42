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

ARG 		DOCKER_CONFIG_FILE
ARG 		DOMAIN_NAME

RUN 		mkdir -p /app/tools 

COPY 		tools/ /app/tools/

COPY 		${DOCKER_CONFIG_FILE} /app/tools/ 

WORKDIR 	/app/tools

RUN 		apt-get update -y && \
			apt-get install php-fpm  -y && \
			apt-get install php-mysql -y && \
			apt-get install php-cli -y && \
			\
			export $(cat ${DOCKER_CONFIG_FILE} | xargs) && \
			\
			envsubst $(cat ${DOCKER_CONFIG_FILE} | awk '{print $1}' | cut -d '=' -f1 | sed 's/^/$/' | paste -sd, - | sed "s/^/'/" | sed "s/$/'/") \
			< php-fpm_template.conf > php-fpm.conf  && \
			\
			rm -f ${DOCKER_CONFIG_FILE}

STOPSIGNAL 	SIGINT


