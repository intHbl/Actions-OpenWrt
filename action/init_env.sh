#!/bin/bash


# sudo -E apt-get -qq install $(curl -fsSL git.io/depends-ubuntu-1804)
# git.io/depends-ubuntu-1804
# git.io/depends-ubuntu-2004


sudo rm -rf /etc/apt/sources.list.d/* /usr/share/dotnet /usr/local/lib/android /opt/ghc
sudo -E apt-get -qq update
sudo -E apt-get -qq install build-essential asciidoc binutils bzip2 gawk gettext git \
    libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 \
    subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo \
    libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint \
    device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync
sudo -E apt-get -qq install tree
sudo -E apt-get -qq autoremove --purge
sudo -E apt-get -qq clean
sudo timedatectl set-timezone "$TZ"
sudo mkdir -p /workdir
sudo chown $USER:$GROUPS /workdir

