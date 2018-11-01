#!/bin/bash

source utils.sh
source files/sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: install chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
rm google-chrome*.deb

call_seperator
echo -e "${Red}Step 2${NC}: install terminator"
sudo apt install -y terminator
mkdir -p $HOME/.config/terminator
cp files/terminator $HOME/.config/terminator/config
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'

call_seperator
echo -e "${Red}Step 3${NC}: install screenfetch"
sudo apt install -y screenfetch

call_seperator
echo -e "${Red}Step 3${NC}: install sogo pinyin"
sudo dpkg -i files/sogoupinyin_2.2.0.0108_amd64.deb
sudo apt install -f
sudo dpkg -i files/sogoupinyin_2.2.0.0108_amd64.deb
sudo apt-get remove --purge fcitx-ui-qimpanel

call_seperator
source files/uscmd.sh
echo -e "${Green}Done!${NC}"
echo ""

