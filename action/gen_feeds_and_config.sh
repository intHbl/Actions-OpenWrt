#!/bin/bash

if [ -e "$__ROOT_DIR__/$CONFIG_FILE" ] ;then
    rm "$__ROOT_DIR__/$CONFIG_FILE"
fi

if [ -e "$__ROOT_DIR__/compile/config/models/${MODEL_NAME}.conf" ];then
    {
        cat "$__ROOT_DIR__/compile/config/models/${MODEL_NAME}.conf" "$__ROOT_DIR__/compile/config/"*.conf 
    } > "$__ROOT_DIR__/$CONFIG_FILE" 
    
    ls -l "$__ROOT_DIR__/$CONFIG_FILE"

    if $FLAG_SMALL; then 
        (
            cat "$__ROOT_DIR__/compile/config/"*.conf.small >> "$__ROOT_DIR__/$CONFIG_FILE" 
        )
        mv "$__ROOT_DIR__/$FEEDS_CONF.small" "$__ROOT_DIR__/$FEEDS_CONF" 
        ls -l "$__ROOT_DIR__/$FEEDS_CONF"
    fi
fi

