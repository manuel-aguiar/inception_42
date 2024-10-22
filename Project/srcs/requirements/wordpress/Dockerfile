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

MAINTAINER      mmaria-d
SHELL           /usr/bin/bash
EXPOSE          9000


# update tools
RUN             apt-get update

# install the php interpreter (embedded in a server)
RUN             apt-get install php-fpm

# install php libraries that implement the connections with MySql/MariaDB
RUN             apt-get install php-mysql

# install debugging utilities, like a CLI to run individual scripts
RUN             apt-get install php-cli


# install WordPress scripts package:

