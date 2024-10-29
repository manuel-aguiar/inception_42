# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    installDocker.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: codespace <codespace@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/23 07:50:31 by mmaria-d          #+#    #+#              #
#    Updated: 2024/10/29 16:32:59 by codespace        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Resources:
# https://docs.docker.com/engine/install/debian/


# Remove any existing Docker packages (if necessary):
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove -y $pkg; done

# Update package list and install prerequisites:
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# Add Docker's official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list again after adding Docker's repository:
sudo apt-get update

# Install Docker:
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Confirm installation is successful:
sudo docker run hello-world
