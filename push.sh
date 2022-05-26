#!/bin/bash

if [ -n "$1" ];then
    msg="$1"
else
    echo "[INFO]write msg for commit(ENTER to continue):"
    read msg
    if [ -n "$msg" ];then
        msg="++++"
    fi
fi

bash make_a_workflow.sh config_pi
bash make_a_workflow.sh config_openwrt/

git add . 

git commit -m "$msg"


git push


