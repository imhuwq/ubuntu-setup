#!/bin/bash

source utils.sh
source files/sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: install building dependencies"
echo -e "Dependencies have been installed in 001-initial-setup.sh\n"

call_seperator
echo -e "${Red}Step 2${NC}: install/update nvm"
if [ -d $HOME/.nvm ]; then
    echo -e "${Yellow}nvm is already installed, updating...${NC}"
    current="$PWD"
    cd $HOME/.nvm && git pull
    cd "$current"
else
    echo -e "${Yellow}nvm is not installed, cloning...${NC}"
    git clone https://github.com/creationix/nvm.git $HOME/.nvm
fi

call_seperator
echo -e "${Red}Step 4${NC}: update bashrc file"
nvm_begin='# nvm settings'
nvm1='export NVM_DIR="$HOME/.nvm"'
nvm2='[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm'
nvm3='[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion'

echo -e "${Yellow}updating $HOME/.bashrc..."
grep -q "$nvm_begin" "$HOME/.bashrc" || echo -e "\n$nvm_begin\n$nvm1\n$nvm2\n$nvm3\n" >> $HOME/.bashrc

if [ -f $HOME/.zshrc ]; then
    echo -e "${Yellow}updating $HOME/.zshrc..."
    grep -q "$nvm_begin" "$HOME/.zshrc" || echo -e "\n$nvm_begin\n$nvm1\n$nvm2\n$nvm3\n" >> $HOME/.zshrc
fi

call_seperator
echo -e "${Red}Step 3${NC}: install node and npm"
source ~/.bashrc && source ~/.zshrc
nvm install 10.14.2
nvm use node
nvm run node --version

source files/uscmd.sh
call_seperator
echo -e "${Green}Done!${NC}"
echo ""
