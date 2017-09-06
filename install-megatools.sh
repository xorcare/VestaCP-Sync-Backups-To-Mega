#!/bin/sh
# info: megatools autoinstall script
# options: VERSION
# version: v1.1.3
#
# Copyright 2016 Vasilyuk Vasiliy <vasilyuk.vasiliy@gmail.com>


sudo apt-get update
sudo apt-get --reinstall -y install build-essential libglib2.0-dev libssl-dev libcurl4-openssl-dev libgirepository1.0-dev g++
if [ -z $1 ]; then
  VERSION="1.9.97";
else
	VERSION=${1};
fi;
wget http://megatools.megous.com/builds/megatools-$VERSION.tar.gz
zcat megatools-$VERSION.tar.gz > megatools-$VERSION.tar
tar -xf megatools-$VERSION.tar
cd megatools-$VERSION
./configure
make
sudo make install
cd ..
rm -rf megatools-$VERSION*