#!/bin/bash

source utils.sh

call_seperator
echo -e "${Red}Step 1${NC}: install must have packages"
sudo apt update
sudo apt install -y git wget curl vim curl htop build-essential

call_seperator
echo -e "${Green}Done!${NC}\n"
