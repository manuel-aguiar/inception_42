# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    DockerFile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/22 08:47:39 by marvin            #+#    #+#              #
#    Updated: 2024/10/22 08:47:39 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#FROM alpine:3.19

FROM            debian:bullseye-slim

RUN             apt-get update -y && \
                apt-get upgrade -y && \
                apt-get install mariadb-server --no-install-recommends -y

COPY            tools/runMariaDB.sh /etc/runMariaDB.sh

RUN             chmod +x /etc/runMariaDB.sh && \
				apt-get clean && \
				rm -rf /var/lib/apt/lists/*

STOPSIGNAL      SIGTERM

WORKDIR        /var/lib/mysql

ENTRYPOINT     ["/etc/runMariaDB.sh"]
