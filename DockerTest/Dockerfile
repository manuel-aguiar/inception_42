# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmaria-d <mmaria-d@student.42lisboa.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/24 13:41:20 by mmaria-d          #+#    #+#              #
#    Updated: 2024/10/30 15:19:17 by mmaria-d         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM  debian:bullseye-slim

RUN apt-get update && apt-get install -y gcc procps

RUN mkdir -p /app

COPY $(ENV_FILE) /app

RUN cc -Wall -Wextra -Werror /app/hello.c -o /app/hello.out

ENTRYPOINT ["/app/hello.out"]

STOPSIGNAL SIGQUIT
