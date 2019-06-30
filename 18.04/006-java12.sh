#!/bin/bash

source utils.sh
source files/sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: add ppa"
sudo add-apt-repository ppa:linuxuprising/java

call_seperator
echo -e "${Red}Step 2${NC}: install java12"
sudo apt update
sudo apt install -y oracle-java12-installer

source files/uscmd.sh
call_seperator
echo -e "${Green}Done!${NC}"
echo ""
