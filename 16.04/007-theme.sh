#!/bin/bash

source utils.sh
source files/sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: unity tweak tool"
sudo apt install -y unity-tweak-tool

call_seperator
echo -e "${Red}Step 2${NC}: numix gtk theme"
sudo add-apt-repository ppa:numix/ppa
sudo apt update
sudo apt install -y numix-gtk-theme numix-icon-theme-circle

call_seperator
echo -e "${Red}Step 2${NC}: compizconfig-settings-manager"
sudo apt install -y compizconfig-settings-manager

call_seperator
source files/uscmd.sh
echo -e "${Green}Done!${NC}"
echo ""

