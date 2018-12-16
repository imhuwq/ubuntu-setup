#!/bin/bash
# https://wiki.qt.io/Building_Qt_5_from_Git

source utils.sh
source files/sscmd.sh
pwd=$PWD

call_seperator
echo -e "${Red}Step 1${NC}: install dependencies"
sudo apt-get update
sudo apt-get build-dep qt5-default
sudo apt-get install -y libxcb-xinerama0-dev 
sudo apt-get install -y build-essential perl python git
sudo apt-get install -y '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev
sudo apt-get install -y flex bison gperf libicu-dev libxslt-dev ruby
sudo apt-get install -y libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libdbus-1-dev libfontconfig1-dev libcap-dev libxtst-dev libpulse-dev libudev-dev libpci-dev libnss3-dev libasound2-dev libxss-dev libegl1-mesa-dev gperf bison
sudo apt-get install -y libasound2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install -y llvm libclang-3.9-dev

call_seperator
echo -e "${Red}Step 1${NC}: download source code"
mkdir -p $HOME/build/qt5
cd $HOME/build/qt5
wget https://download-public-imhuwq.oss-cn-shenzhen.aliyuncs.com/qt5/qt5-5.10.tar.gz
tar -xzvf qt5-5.10.tar.gz
rm qt5-5.10.tar.gz

call_seperator
echo -e "${Red}Step 2${NC}: build"
export LLVM_INSTALL_DIR=/usr/llvm
cd qt5-5.10
./configure -opensource -confirm-license -nomake examples -nomake tests
make -j8
cd ../

call_seperator
echo -e "${Red}Step 2${NC}: install"
cd qt5-5.10
sudo make install
sudo ldconfig
cd ../

call_seperator
cd $pwd
source files/uscmd.sh
echo -e "${Green}Done!${NC}"
echo ""
