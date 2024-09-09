#!/bin/bash

# Set the colors for displaying information in the terminal
GREEN="\033[32m"
RED="\033[31m"
END="\033[0m"

# Creating an environment variable for installing the worker node
# https://docs.k3s.io/installation/configuration#configuration-file

# Read the token from the file
TOKEN=$(cat /vagrant/token.env)

# Export the K3s install command with the correct token
if export INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 --token ${TOKEN} --node-ip=192.168.56.111"; then
    echo -e "${GREEN}export INSTALL_K3S_EXEC SUCCEEDED${END}"
else
    echo -e "${RED}export INSTALL_K3S_EXEC FAILED${END}"
fi

# Install the worker node
# https://docs.k3s.io/quick-start

if curl -sfL https://get.k3s.io | sh -; then
    echo -e "${GREEN}K3s WORKER installation SUCCEEDED${END}"
else
    echo -e "${RED}K3s WORKER installation FAILED${END}"
fi

# Create and configure a dummy network interface
# The commands add eth1 as a dummy interface and assign an IP address to it

if sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.111/24 dev eth1 && sudo ip link set eth1 up; then
    echo -e "${GREEN}add eth1 SUCCEEDED${END}"
else
    echo -e "${RED}add eth1 FAILED${END}"
fi

# Delete the token for security reasons

sudo rm /vagrant/token.env
