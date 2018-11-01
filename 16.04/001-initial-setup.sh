#!/bin/bash

source utils.sh

call_seperator
echo -e "${Red}Step 1${NC}: setup apt source"
sudo cp files/sources.list /etc/apt/sources.list
sudo apt update
sudo apt upgrade

call_seperator
echo -e "${Red}Step 2${NC}: setup directories"
mkdir -p $HOME/config
mkdir -p $HOME/app

call_seperator
echo -e "${Green}Done!${NC}"

