#!/bin/bash


if [ -e $__ROOT_DIR__/$FEEDS_CONF ];then
    mv $__ROOT_DIR__/$FEEDS_CONF openwrt/feeds.conf.default
    echo "[INFO] mv feeds.conf.default to openwrt/"
fi

cd openwrt/

# before feeds update & install

echo "[INFO] do nothing"

echo "[INFO] current path:`pwd`"


## curl -fsSL git.io/depends-ubuntu-1804
# build-essential asciidoc binutils bzip2 gawk gettext git 
# libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 
# libc6-dev-i386 subversion flex uglifyjs gcc-multilib g++-multilib 
# p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils 
# upx libelf-dev autoconf automake libtool autopoint 
# device-tree-compiler antlr3 gperf wget swig rsync

## openwrt
# build-essential asciidoc binutils bzip2 gawk gettext git 
# libncurses5-dev libz-dev patch 
# python3 python2.7 
# unzip zlib1g-dev lib32gcc1 libc6-dev-i386 
# subversion flex uglifyjs git-core gcc-multilib 
# p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils 
# upx libelf-dev autoconf automake libtool autopoint 
# device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync
##
