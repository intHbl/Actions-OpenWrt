#!/bin/bash

if [ -e "$__ROOT_DIR__/$CONFIG_FILE" ] ;then
    rm "$__ROOT_DIR__/$CONFIG_FILE"
fi

modelconf="$__ROOT_DIR__/compile/config/models/${MODEL_NAME}.conf"
modelconfadd="$modelconf.add"
if [ -f "$modelconf" ];then
    {
        cat "$modelconf" 
        
        if [ -f "$modelconfadd" ];then
            cat "$modelconfadd"
        fi

        cat "$__ROOT_DIR__/compile/config/"*.conf 
        
    } > "$__ROOT_DIR__/$CONFIG_FILE" 

    
    ls -l "$__ROOT_DIR__/$CONFIG_FILE"

    cp "$__ROOT_DIR__/$CONFIG_FILE" "$__ROOT_DIR__/$CONFIG_FILE.2"
    
    # small
    if [ -n "$FLAG_SMALL" ] && [ "x$FLAG_SMALL" != "xnone" ] && [ "x$FLAG_SMALL" != "xfalse" ]; then

        if [ -z "$FLAG_NEWEST" ];then
            (
                cat "$__ROOT_DIR__/compile/config/"*.conf."$FLAG_SMALL"
            ) >> "$__ROOT_DIR__/$CONFIG_FILE"
            cat "$__ROOT_DIR__/$FEEDS_CONF.small" >> "$__ROOT_DIR__/$FEEDS_CONF" 
        else
            # 最新 version
            {
            # CONFIG_PACKAGE_luci-app-openclash=y
            cat <<EOF
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-passwall_Iptables_Transparent_Proxy=y

CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Libev_Client=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_Libev_Client=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_Plus=y

CONFIG_PACKAGE_kmod-ipt-nat=y
CONFIG_PACKAGE_iptables-mod-socket=y
CONFIG_PACKAGE_iptables-mod-tproxy=y
CONFIG_PACKAGE_iptables-mod-iprange=y
CONFIG_PACKAGE_iptables-mod-conntrack-extra=y

CONFIG_PACKAGE_luci-app-eqos=y
CONFIG_PACKAGE_luci-app-smartdns=y

EOF
            if [ "$MODEL_NAME" == "xy-c5" ] || [ "$MODEL_NAME" == "xy-c3" ];then
                echo ""
                # echo "CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Hysteria=y"
                ## echo "CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray_Plugin=y"
            fi
            
            } >> "$__ROOT_DIR__/$CONFIG_FILE"
            cat "$__ROOT_DIR__/$FEEDS_CONF.small.newest" >> "$__ROOT_DIR__/$FEEDS_CONF"
        fi
        ls -l "$__ROOT_DIR__/$FEEDS_CONF"
    else
        echo "FLAG_SMALL=" >> $GITHUB_ENV
    fi
fi

