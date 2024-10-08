#!/bin/bash

GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

# install git
sudo apt install git

# init cluster
sudo k3d cluster start mycluster

# init wil-app
sudo kubectl apply -f ../confs/argo-app.yaml

# Warning port-forward
echo -e "${GREEN}PORT-FORWARD : sudo kubectl port-forward svc/svc-wil -n dev 8888:8080${RESET}"

