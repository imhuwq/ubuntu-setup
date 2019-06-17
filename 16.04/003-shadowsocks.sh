#!/bin/bash
source utils.sh

call_seperator
echo -e "${Red}Step 1${NC}: install shadowsocks"
cp files/sslocal.json $HOME/config
mkdir -p $HOME/app/shadowsocks/ss-qt5
cp files/ss-qt5 $HOME/app/shadowsocks/ss-qt5
chmod 755 $HOME/app/shadowsocks/ss-qt5

call_seperator
echo -e "${Red}Step 2${NC}: install privoxy"
sudo apt install -y privoxy
update_file /etc/privoxy/config 'forward-socks5 / 127.0.0.1:1080 .' sudo
sudo service privoxy restart

call_seperator
echo -e "${Red}Step 4${NC}: install proxychains"
sudo apt install -y proxychains
sudo sed -i -E "s/socks4\s+127.0.0.1\s+9050/# socks4 127.0.0.1 9050/" /etc/proxychains.conf
update_file /etc/proxychains.conf 'socks5 127.0.0.1 1080' sudo

call_seperator
echo -e "${Red}Step 5${NC}: setup command alias"
cp files/sscmd.sh $HOME/app/shadowsocks/sscmd.sh
cp files/uscmd.sh $HOME/app/shadowsocks/uscmd.sh
ss_begin='# setup http(s) proxy to shadowsocks'
sscmd='alias sscmd="source $HOME/app/shadowsocks/sscmd.sh"'
uscmd='alias uscmd="source $HOME/app/shadowsocks/uscmd.sh"'
grep -q "$ss_begin" $HOME/.bashrc || echo -e "\n$ss_begin\n$sscmd\n$uscmd\n" >> $HOME/.bashrc

call_seperator
echo -e "${Cyan}You can now start shadowsocks app in $HOME/app/shadowsocks/ss-qt5${NC}"
echo -e "${Cyan}Config file is located at $HOME/config/sslocal.json${NC}"
echo -e "\n"
