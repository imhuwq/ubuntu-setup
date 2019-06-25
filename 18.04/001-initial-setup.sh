#!/bin/bash

source utils.sh

call_seperator
echo -e "${Red}Step 1${NC}: update sources.list"
sudo cp files/sources.list /etc/apt/sources.list
sudo apt update
sudo apt upgrade

call_seperator
echo -e "${Red}Step 2${NC}: create essential directories"
mkdir -p $HOME/config
mkdir -p $HOME/app
mkdir -p $HOME/script
mkdir -p $HOME/git/github

call_seperator
echo -e "${Green}Done!${NC}"
