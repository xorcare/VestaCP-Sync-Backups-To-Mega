#!/bin/sh
# info: megatools autoinstall script
# options: VERSION
# version: v1.1.3
#
# Copyright 2016 Vasilyuk Vasiliy <vasilyukvasiliy@gmail.com>
#
# Source command: https://github.com/megous/megatools/issues/152

if [ -z $1 ]; then
    VERSION="1.9.97"
else
    VERSION=${1}
fi;

cd /root/
mkdir glib-source
cd glib-source/
wget http://ftp.gnome.org/pub/GNOME/sources/glib/2.32/glib-2.32.4.tar.xz
tar -xf glib-2.32.4.tar.xz
cd glib-2.32.4/
./configure --prefix=/usr/local/glib-2.32
make
make install

cd /root/
rm -rf glib-source

wget https://megatools.megous.com/builds/megatools-${VERSION}.tar.gz
tar zxf megatools-${VERSION}.tar.gz
cd megatools-${VERSION}
export LD_LIBRARY_PATH=/usr/local/glib-2.32/lib/
export PKG_CONFIG_PATH=/usr/local/glib-2.32/lib/pkgconfig
./configure
make
make check
make install
./configure && make && make install && ldconfig

cd /root/
rm -rf megatools-${VERSION}