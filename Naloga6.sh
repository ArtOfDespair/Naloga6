#!/bin/bash
sudo mkdir -p Desktop Documents Downloads Pictures Videos
for i in {1..5}
do
   mkdir folder$i
done
for a in $(cat userlist.txt)
do
   sudo useradd -m "$a"	
done
for a in $(cat userlist.txt)
do
sudo usermod -a -G sudo "$a"
done
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install ufw
sudo apt-get install git
sudo apt-get install nginx
sudo apt-get install net-tools
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world
