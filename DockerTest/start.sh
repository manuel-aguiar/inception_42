# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmaria-d <mmaria-d@student.42lisboa.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/30 13:16:02 by mmaria-d          #+#    #+#              #
#    Updated: 2024/10/30 13:41:03 by mmaria-d         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash

sudo docker build -t test .
sudo docker create --name test test
sudo docker start -i test