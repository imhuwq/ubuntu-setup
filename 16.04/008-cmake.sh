#!/bin/bash

source utils.sh
source files/sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: download source code"
wget http://gizmo-statics-public.oss-cn-shenzhen.aliyuncs.com/cmake/cmake-3.10.3.tar.gz
tar -xzvf cmake-3.10.3.tar.gz
mkdir -p build
rm -rf build/cmake-3.10.3
mv cmake-3.10.3 build/
rm cmake-3.10.3.tar.gz

call_seperator
echo -e "${Red}Step 2${NC}: build"
cd build/cmake-3.10.3
./bootstrap
make -j8
cd ../../

call_seperator
echo -e "${Red}Step 2${NC}: install"
cd build/cmake-3.10.3
sudo make install
sudo ldconfig
cd ../../

call_seperator
source files/uscmd.sh
echo -e "${Green}Done!${NC}"
echo ""

