#!/bin/bash

#Add Docker Repo
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

#Updata pkgs from repo
sudo apt update -y

#Install Docker
sudo apt install docker-ce -y

#Download and Install Docker-Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.25.3/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

#Set Permissions
sudo chmod +x /usr/local/bin/docker-compose
