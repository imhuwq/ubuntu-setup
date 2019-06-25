#!/bin/bash

source utils.sh
source files/sscmd.sh

call_seperator
echo -e "${Red}Step 0${NC}: install dependencies for docker"
sudo apt install -y apt-transport-https  ca-certificates curl gnupg-agent software-properties-common

call_seperator
echo -e "${Red}Step 1${NC}: add apt source"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

call_seperator
echo -e "${Red}Step 2${NC}: install docker-ce"
sudo apt install -y docker-ce

call_seperator
echo -e "${Red}Step 3${NC}: setup docker-ce"
sudo systemctl enable docker.service
sudo usermod -aG docker ${USER}
docker --version

call_seperator
source files/uscmd.sh
echo -e "${Green}Done!${NC}"
echo ""
