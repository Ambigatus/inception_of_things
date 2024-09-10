#!/bin/bash

# Set colors for output
GREEN="\033[32m"
RED="\033[31m"
END="\033[0m"

# Install K3s server
if curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --node-ip=192.168.56.110" sh -; then
    echo -e "${GREEN}K3s installation SUCCEEDED${END}"
else
    echo -e "${RED}K3s installation FAILED${END}"
    exit 1
fi

# Verify K3s installation
if kubectl get nodes; then
    echo -e "${GREEN}K3s is up and running${END}"
else
    echo -e "${RED}K3s verification FAILED${END}"
    exit 1
fi
