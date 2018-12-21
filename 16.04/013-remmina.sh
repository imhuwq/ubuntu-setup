#!/bin/bash

source utils.sh
source files/sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: add ppa"
sudo apt-add-repository -y ppa:remmina-ppa-team/remmina-next

call_seperator
echo -e "${Red}Step 2${NC}: install remmina"
sudo apt-get update
sudo apt-get install -y remmina remmina-plugin-rdp libfreerdp-plugins-standard

source files/uscmd.sh
call_seperator
echo -e "${Green}Done!${NC}"
echo ""
