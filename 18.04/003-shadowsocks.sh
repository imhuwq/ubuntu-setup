#!/bin/bash
source utils.sh

call_seperator
echo -e "${Red}Step 1${NC}: install privoxy"
sudo apt install -y privoxy
update_file /etc/privoxy/config 'forward-socks5 / 10.100.100.3:1080 .' sudo
sudo service privoxy restart

call_seperator
echo -e "${Red}Step 2${NC}: install proxychains"
sudo apt install -y proxychains
sudo sed -i -E "s/socks4\s+127.0.0.1\s+9050/# socks4 127.0.0.1 9050/" /etc/proxychains.conf
update_file /etc/proxychains.conf 'socks5 10.100.100.3 1080' sudo

call_seperator
echo -e "${Red}Step 3${NC}: setup command alias"
mkdir -p $HOME/script/shadowsocks
cp files/sscmd.sh $HOME/script/shadowsocks/sscmd.sh
cp files/uscmd.sh $HOME/script/shadowsocks/uscmd.sh
ss_begin='# setup http(s) proxy to shadowsocks'
sscmd='alias sscmd="source $HOME/script/shadowsocks/sscmd.sh"'
uscmd='alias uscmd="source $HOME/script/shadowsocks/uscmd.sh"'
sudoe='alias sudo="sudo -E"'
grep -q "$ss_begin" $HOME/.bashrc || echo -e "\n$ss_begin\n$sscmd\n$uscmd\n$sudoe\n" >> $HOME/.bashrc

call_seperator
echo -e "\n"
