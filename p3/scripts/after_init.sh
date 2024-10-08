#!/bin/bash

# Set the colors for displaying information in the terminal
GREEN="\033[32m"
RED="\033[31m"
END="\033[0m"



# password to argocd (user: admin)
echo -n "ARGOCD PASSWORD : "
  sudo kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode
echo "${RESET}"

# argocd localhost:8085 or argocd.mydomain.com:8085
sudo kubectl port-forward svc/argocd-server -n argocd 8085:443 > /dev/null 2>&1 &