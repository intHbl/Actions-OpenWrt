#!/bin/bash


if [ -e $__ROOT_DIR__/$FEEDS_CONF ];then
    cat $__ROOT_DIR__/$FEEDS_CONF >> openwrt/feeds.conf.default
    echo "[INFO] add feeds to feeds.conf.default"
fi

cd openwrt/

# before feeds update & install

echo "[INFO] do nothing"

echo "[INFO] current path:`pwd`"

