# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmaria-d <mmaria-d@student.42lisboa.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/24 13:41:20 by mmaria-d          #+#    #+#              #
#    Updated: 2024/10/24 16:34:26 by mmaria-d         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM  debian:bullseye-slim

RUN apt-get update && apt-get install -y gcc

RUN mkdir -p /app

COPY hello.c /app

RUN cc -Wall -Wextra -Werror /app/hello.c -o /app/hello.out

ENTRYPOINT ["/app/hello.out"]

CMD ["Hello World!"]