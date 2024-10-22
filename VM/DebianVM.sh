#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    vm.sh                                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/22 14:10:42 by marvin            #+#    #+#              #
#    Updated: 2024/10/22 14:10:42 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Resources
# https://andreafortuna.org/2019/10/24/how-to-create-a-virtualbox-vm-from-command-line/
# https://github.com/benmaia/42_Born2beRoot/blob/master/42Linux_vm.sh

##############################################
#                                            #
#                   SETUP                    #
#                                            #
##############################################

#############       NAMES       ##############
VM_NAME="myVM"
VM_LOCATION="/workspaces/inception_42/VM"
VM_OS_LINK="https://cdimage.debian.org/mirror/cdimage/archive/12.2.0/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso"
VM_OS_VIRTUALBOX_NAME="Debian 64"

#############       SPECS       ##############
VM_RAM="2048"
VM_VRAM="128"
VM_CPU_COUNT="4"
VM_HD_SIZE="10000"

#############       OS CONFIG   ##############
DEBIAN_LANG=en
DEBIAN_COUNTRY=PT
DEBIAN_LOCALE=en_GB.UTF-8
DEBIAN_KEYBOARD=us
DEBIAN_SUDO_PASS="bigPotato"

DEBIAN_USER1_NAME="mmaria-d"
DEBIAN_USER1_PASS="bigPotato"
DEBIAN_PACKAGES="vim, curl, gcc, docker, vscode, openssh-server, net-tools, bash"


##############################################
#                                            #
#                 INSTALL                    #
#                                            #
##############################################


# HELPER variables
VM_OS_IMAGENAME="debian.iso"
VM_OS_PATH="$VM_LOCATION"/"$VM_OS_IMAGENAME"
VM_PRESEED_NAME=preseed.cfg
VM_PRESEED_PATH="$VM_LOCATION"/"$VM_PRESEED_NAME"
VM_NAME_DISK="${VM_NAME}_disk.vdi"

# Assuming VirtualBox is installed here
# apt-get update -y
# apt-get install virtualbox -y
# echo "VirtualBox is correctly installed."

# download the OS image
mkdir -p "$VM_LOCATION"

if [ ! -f "$VM_OS_PATH" ]; then
    echo "File $VM_OS_IMAGENAME not found. Downloading....."
    wget -O "$VM_OS_PATH" "$VM_OS_LINK"
else
    echo "File $VM_OS_IMAGENAME already exists in target directory, skipping download."
fi

touch "$VM_PRESEED_PATH"

# create the preseed file for debian autoconfiguration
cat << EOF > "$VM_PRESEED_PATH"

d-i debian-installer/language string ${DEBIAN_LANG}
d-i debian-installer/country string ${DEBIAN_COUNTRY}
d-i debian-installer/locale string ${DEBIAN_LOCALE}

d-i console-setup/ask_detect boolean false
d-i keyboard-configuration/xkb-keymap select ${DEBIAN_KEYBOARD}

# Network configuration
d-i netcfg/choose_interface select auto
d-i netcfg/get_hostname string unassigned-hostname
d-i netcfg/get_domain string unassigned-domain

# Setup the sudo user
d-i passwd/root-password password ${DEBIAN_SUDO_PASS}
d-i passwd/root-password-again password ${DEBIAN_SUDO_PASS}


# User accounts
d-i passwd/user-fullname string Your Name
d-i passwd/username string ${DEBIAN_USER1_NAME}
d-i passwd/user-password password ${DEBIAN_USER1_PASS}
d-i passwd/user-password-again password ${DEBIAN_USER1_PASS}
d-i preseed/early_command string usermod -aG sudo ${DEBIAN_USER1_NAME}

# Partitioning
d-i partman-auto/method string regular
d-i partman-auto/choose_recipe select atomic

# Package selection
tasksel tasksel/first multiselect standard
d-i pkgsel/include string ${DEBIAN_PACKAGES}
EOF



# Create the actual VM
VBoxManage createvm --name "$VM_NAME" -ostype "$VM_OS_VIRTUALBOX_NAME" --register --basefolder "$VM_LOCATION"
VBoxManage modifyvm "$VM_NAME" --ioapic on
VBoxManage modifyvm "$VM_NAME" --memory "$VM_RAM" --vram "$VM_VRAM" --cpus "$VM_CPU_COUNT"
VBoxManage modifyvm "$VM_NAME" --nic1 nat


VBoxManage createhd --filename "$VM_LOCATION"/"$VM_NAME"/"$VM_NAME_DISK" --size "$VM_HD_SIZE" --format VDI
VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  "$VM_LOCATION"/"$VM_NAME"/"$VM_NAME_DISK"
VBoxManage storagectl "$VM_NAME" --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach "$VM_NAME" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium "$VM_OS_PATH"
VBoxManage storageattach "$VM_NAME" --storagectl "IDE Controller" --port 0 --device 1 --type dvddrive --medium "$VM_PRESEED_PATH"
VBoxManage modifyvm "$VM_NAME" --boot1 dvd --boot2 disk --boot3 none --boot4 none


VBoxManage modifyvm "$VM_NAME" --nictype1 82540EM
VBoxManage modifyvm "$VM_NAME" --nic1 bridged
VBoxManage modifyvm "$VM_NAME" --nicpromisc1 deny
VBoxManage modifyvm "$VM_NAME" --bridgeadapter1 eno2

#remove the preseed file, not needed anymore
rm -rf "$VM_PRESEED_PATH"
rm -rf "$VM_OS_PATH"
