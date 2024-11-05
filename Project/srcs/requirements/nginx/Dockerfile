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

FROM 		debian:bullseye-slim

RUN 		apt-get update -y && \
			apt-get install nginx -y && \
			\
			apt-get clean && \
			rm -rf /var/lib/apt/lists/*


STOPSIGNAL 	SIGINT

CMD 		["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
