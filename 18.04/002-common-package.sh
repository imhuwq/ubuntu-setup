#!/bin/bash

source utils.sh

call_seperator
echo -e "${Red}Step 1${NC}: install must have packages"
sudo apt update
sudo apt install -y git wget curl vim python-pip python3-pip htop

call_seperator
echo -e "${Red}Step 2${NC}: install dependencies for pyenv"
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils

call_seperator
echo -e "${Red}Step 2${NC}: install dependencies for nvm"
sudo apt install -y make build-essential libssl-dev

call_seperator
echo -e "${Green}Done!${NC}\n"
