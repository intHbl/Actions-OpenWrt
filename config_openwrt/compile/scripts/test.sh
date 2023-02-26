#!/bin/bash


log="/tmp/test.log"
for i in `seq 1 1000`;
    if [ -e "$log.1.$i" ];then
        continue
    fi
    log1="$log.1.$i"
    break
done

for i in `seq 1 1000`;
    if [ -e "$log.2.$i" ];then
        continue
    fi
    log2="$log.2.$i"
    break
done


{
    cat <<EOF

[ -e "$__ROOT_DIR__/$CONFIG_FILE" ] && rm "$__ROOT_DIR__/$CONFIG_FILE"
if [ -e "$__ROOT_DIR__/compile/config/models/${MODEL_NAME}.conf" ];then 
    cat "$__ROOT_DIR__/compile/config/models/${MODEL_NAME}.conf" 
        "$__ROOT_DIR__/compile/config/"*.conf > "$__ROOT_DIR__/$CONFIG_FILE" && ls -l "$__ROOT_DIR__/$CONFIG_FILE" ; 
    if $FLAG_SMALL; then ( cat "$__ROOT_DIR__/compile/config/"*.conf.small >> "$__ROOT_DIR__/$CONFIG_FILE" ); 
        mv "$__ROOT_DIR__/$FEEDS_CONF.small" "$__ROOT_DIR__/$FEEDS_CONF" && ls -l "$__ROOT_DIR__/$FEEDS_CONF" ; 
    fi ; 
fi

EOF

} > "$log1"

{
    echo "pwd=`pwd`"
    echo "GITHUB_STATE=$GITHUB_STATE"
    echo "GITHUB_ENV=$GITHUB_ENV"

    echo "
    
    
    "

    echo "env="
    env 
    echo "
    
    
"

} > "$log2"


