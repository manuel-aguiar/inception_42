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

FROM debian:bullseye

# update tools
RUN             apt-get update -y && \
				apt-get install php-fpm  -y && \
				apt-get install php-mysql -y && \
				apt-get install php-cli -y

# install WordPress scripts package:

