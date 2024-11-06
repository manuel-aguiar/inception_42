# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    runRedisCache.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: codespace <codespace@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/05 14:44:53 by codespace         #+#    #+#              #
#    Updated: 2024/11/06 15:10:54 by codespace        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

exec /usr/bin/redis-server --bind "0.0.0.0" --port ${PORT_LISTEN_REDIS} --protected-mode "no" --daemonize "no"
