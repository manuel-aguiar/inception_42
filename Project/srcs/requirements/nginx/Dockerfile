# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    DockerFile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/22 08:50:03 by marvin            #+#    #+#              #
#    Updated: 2024/10/22 08:50:03 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM 		debian:bullseye

ARG 		DOCKER_CONFIG_FILE
ARG 		DOMAIN_NAME

RUN 		mkdir -p /app/tools 

COPY 		tools/ /app/tools/

COPY 		${DOCKER_CONFIG_FILE} /app/tools/ 

WORKDIR /app/tools

RUN 		apt-get update -y && \
			apt-get install gettext nginx openssl -y && \
			\
			export $(cat ${DOCKER_CONFIG_FILE} | xargs) && \
			envsubst $(cat ${DOCKER_CONFIG_FILE} | awk '{print $1}' | cut -d '=' -f1 | sed 's/^/$/' | paste -sd, - | sed "s/^/'/" | sed "s/$/'/") \
			< nginx_template.conf > /etc/nginx/nginx.conf && \
			rm -f ${DOCKER_CONFIG_FILE} && \
			\
			openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
			-keyout /etc/nginx/nginx-selfsigned.key \
			-out /etc/nginx/nginx-selfsigned.crt \
			-subj "/C=PT/ST=Lisbon/L=Lisbon/ON=42Lisboa/CN=${DOMAIN_NAME}"


STOPSIGNAL 	SIGINT

CMD 		["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
