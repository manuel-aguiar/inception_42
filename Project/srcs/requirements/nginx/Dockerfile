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

COPY 		tools/ .
COPY 		${DOCKER_CONFIG_FILE} .

RUN 		apt-get update -y && \
			apt-get install gettext nginx openssl -y && \
			export $(cat ${DOCKER_CONFIG_FILE} | xargs) && \
			envsubst $(cat ${DOCKER_CONFIG_FILE} | awk '{print $1}' | cut -d '=' -f1 | sed 's/^/$/' | paste -sd, - | sed "s/^/'/" | sed "s/$/'/") \
			< tools/nginx_template.conf > nginx.conf && \
			rm -f ${DOCKER_CONFIG_FILE}


STOPSIGNAL 	SIGINT

CMD 		["nginx", "-g", "daemon off;", "-c", "/nginx.conf"]
