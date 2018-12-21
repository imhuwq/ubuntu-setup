#!/bin/bash

source utils.sh
source files/sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: add ppa"
sudo add-apt-repository -y ppa:teejee2008/ppa -y

call_seperator
echo -e "${Red}Step 2${NC}: install timeshift"
sudo apt-get update
sudo apt-get install -y timeshift

source files/uscmd.sh
call_seperator
echo -e "${Green}Done!${NC}"
echo ""
