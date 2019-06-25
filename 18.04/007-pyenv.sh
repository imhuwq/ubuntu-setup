#!/bin/bash

source utils.sh
source files/sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: install building dependencies"
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils

call_seperator
echo -e "${Red}Step 2${NC}: install/update pyenv"

if [ -d $HOME/.pyenv ]; then
    echo -e "${Yellow}pyenv is already installed, updating...${NC}"
    current="$PWD"
    cd $HOME/.pyenv && git pull
    cd "$current"
else
    echo -e "${Yellow}pyenv is not installed, cloning...${NC}"
    git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
fi

call_seperator
echo -e "${Red}Step 3${NC}: install/update pyenv-vrtualenv"
if [ -d $HOME/.pyenv/plugins/pyenv-virtualenv ]; then
    echo -e "${Yellow}pyenv-virtualenv is already installed, updating..."
    current="$PWD"
    cd $HOME/.pyenv/plugins/pyenv-virtualenv && git pull
    cd "$current"
else
    echo -e "${Yellow}pyenv-virtualenv is not installed, cloning..."
    git clone https://github.com/pyenv/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv
fi

call_seperator
echo -e "${Red}Step 4${NC}: update bashrc file"
py_begin='# pyenv settings'
py1='export PYENV_ROOT="$HOME/.pyenv"'
py2='export PATH="$PYENV_ROOT/bin:$PATH"'
py3='eval "$(pyenv init -)"'
py4='eval "$(pyenv virtualenv-init -)"'

echo -e "${Yellow}updating $HOME/.bashrc..."
grep -q "$py_begin" "$HOME/.bashrc" || echo -e "\n$py_begin\n$py1\n$py2\n$py3\n$py4\n" >> $HOME/.bashrc

if [ -f $HOME/.zshrc ]; then
    echo -e "${Yellow}updating $HOME/.zshrc..."
    grep -q "$py_begin" "$HOME/.zshrc" || echo -e "\n$py_begin\n$py1\n$py2\n$py3\n$py4\n" >> $HOME/.zshrc
 
    echo -e "${Yellow}enable pyenv in zsh"
    sed -i -E "s/plugins=\((.*?)(pyenv\s|\spyenv|pyenv)(.*?)\)/plugins=(\1\3)/" $HOME/.zshrc 
    sed -i -E "s/plugins=\((.*?)\)/plugins=(\1 pyenv)/" $HOME/.zshrc
fi

call_seperator
echo -e "${Red}Step 5${NC}: setup douban pypi mirror"
if [ ! -f $HOME/.pip/pip.conf ]; then
    mkdir -p $HOME/.pip
    touch $HOME/.pip/pip.conf
fi
update_file $HOME/.pip/pip.conf '[global]'
update_file $HOME/.pip/pip.conf 'trusted-host =  mirrors.aliyun.com'
update_file $HOME/.pip/pip.conf 'https://mirrors.aliyun.com/pypi/simple'

source files/uscmd.sh

call_seperator
echo -e "${Green}Done!${NC}"
echo ""

