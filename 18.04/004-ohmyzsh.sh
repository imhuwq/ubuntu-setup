#!/bin/bash

source utils.sh
source files/sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: install zsh"
sudo apt -y install zsh

call_seperator
echo -e "${Red}Step 2${NC}: install oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

call_seperator
echo -e "${Red}Step 3${NC}: change default theme"
sed -i -E "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"af-magic\"/" $HOME/.zshrc

call_seperator
echo -e "${Red}Step 4${NC}: set shadowsocks command line alias"
ss_begin='# setup http(s) proxy to shadowsocks'
sscmd='alias sscmd="source $HOME/script/shadowsocks/sscmd.sh"'
uscmd='alias uscmd="source $HOME/script/shadowsocks/uscmd.sh"'
sudoe='alias sudo="sudo -E"'
grep -q "$ss_begin" $HOME/.zshrc || echo -e "\n$ss_begin\n$sscmd\n$uscmd\n$sudoe\n" >> $HOME/.zshrc

call_seperator
echo -e "${Cyan}Done!${NC}"
echo ""

source files/uscmd.sh

