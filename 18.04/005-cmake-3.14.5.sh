#!/bin/bash

source utils.sh
source files/sscmd.sh
pwd=$PWD

call_seperator
echo -e "${Red}Step 1${NC}: download source code"
mkdir -p $HOME/build/cmake
cd $HOME/build/cmake
rm -rf cmake-3.14.5
wget https://download-public-imhuwq.oss-cn-shenzhen.aliyuncs.com/cmake/cmake-3.14.5.tar.gz
tar -xzvf cmake-3.14.5.tar.gz
rm cmake-3.14.5.tar.gz

call_seperator
echo -e "${Red}Step 2${NC}: build"
cd cmake-3.14.5
./bootstrap
make -j8
cd ../

call_seperator
echo -e "${Red}Step 2${NC}: install"
cd cmake-3.14.5
sudo make install
sudo ldconfig
cd ../

call_seperator
cd $pwd
source files/uscmd.sh
echo -e "${Green}Done!${NC}"
echo ""
