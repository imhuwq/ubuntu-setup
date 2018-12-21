#!/bin/bash

source utils.sh
source files/sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: add ppa"
sudo add-apt-repository ppa:webupd8team/java -y

call_seperator
echo -e "${Red}Step 2${NC}: install java8"
sudo apt-get update
sudo su root -c 'echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && apt-get install -y oracle-java8-installer'

source files/uscmd.sh
call_seperator
echo -e "${Green}Done!${NC}"
echo ""
