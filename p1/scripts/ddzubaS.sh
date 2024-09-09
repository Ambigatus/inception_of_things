#!/bin/bash

# Set the colors for displaying information in the terminal
GREEN="\033[32m"
RED="\033[31m"
END="\033[0m"

# Creating an environment variable for installing the master node
# https://docs.k3s.io/installation/configuration#configuration-file

# Export K3s server installation parameters
if export INSTALL_K3S_EXEC="server --write-kubeconfig-mode=644 --tls-san=192.168.56.110 --node-ip=192.168.56.110 --bind-address=192.168.56.110 --advertise-address=192.168.56.110"; then
    echo -e "${GREEN}export INSTALL_K3S_EXEC SUCCEEDED${END}"
else
    echo -e "${RED}export INSTALL_K3S_EXEC FAILED${END}"
fi

# Install master node
# https://docs.k3s.io/quick-start

if curl -sfL https://get.k3s.io | sh -; then
    echo -e "${GREEN}K3s MASTER installation SUCCEEDED${END}"
else
    echo -e "${RED}K3s MASTER installation FAILED${END}"
fi

# Copying the Vagrant token to the mounted folder, which will be necessary to install the worker
# https://docs.k3s.io/quick-start

if sudo cat /var/lib/rancher/k3s/server/token > /vagrant/token.env; then
    echo -e "${GREEN}TOKEN SUCCESSFULLY SAVED${END}"
else
    echo -e "${RED}TOKEN SAVING FAILED${END}"
fi

# Create and configure a dummy network interface
# The commands add eth1 as a dummy interface and assign an IP address to it

if sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.110/24 dev eth1 && sudo ip link set eth1 up; then
    echo -e "${GREEN}add eth1 SUCCEEDED${END}"
else
    echo -e "${RED}add eth1 FAILED${END}"
fi
