#!/bin/bash

source utils.sh
source files/sscmd.sh

call_seperator
echo -e "${Red}Step 0${NC}: add apt source"
sudo add-apt-repository ppa:numix/ppa

call_seperator
echo -e "${Red}Step 1${NC}: install theme and icons"
sudo apt install numix-gtk-theme numix-icon-theme-circle gnome-tweak-tool

call_seperator
source files/uscmd.sh
echo -e "${Green}Done!${NC}"
echo ""
