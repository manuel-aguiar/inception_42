# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    runRedisCache.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: codespace <codespace@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/05 14:44:53 by codespace         #+#    #+#              #
#    Updated: 2024/11/05 14:50:04 by codespace        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

exec /usr/bin/redis-server --bind "0.0.0.0" --port ${PORT_LISTEN_DATABASE} --protected-mode "no" --daemonize "no"
