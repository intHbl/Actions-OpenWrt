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
        (
            cat "$__ROOT_DIR__/compile/config/"*.conf."$FLAG_SMALL"
        ) >> "$__ROOT_DIR__/$CONFIG_FILE"

        cat "$__ROOT_DIR__/$FEEDS_CONF.small" >> "$__ROOT_DIR__/$FEEDS_CONF" 
        ls -l "$__ROOT_DIR__/$FEEDS_CONF"
    else
        echo "FLAG_SMALL=" >> $GITHUB_ENV
    fi
fi

