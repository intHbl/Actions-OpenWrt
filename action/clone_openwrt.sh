#!/bin/bash

      #working-directory: /workdir
(
    cd  /workdir
    df -hT $PWD
  
    REPO_URL="https://github.com/openwrt/openwrt"
    REPO_BRANCH="openwrt-21.02"

    b="v21.02.5"
    # git clone --single-branch -b $REPO_BRANCH $REPO_URL  openwrt
    git clone --single-branch -b $b $REPO_URL  openwrt
    ln -sf /workdir/openwrt $GITHUB_WORKSPACE/openwrt

    # after clone
    if [ -n "$AFTER_CLONE_SH" ] && [ "$AFTER_CLONE_SH" != "false" ] && [ -f "$GITHUB_WORKSPACE/$AFTER_CLONE_SH" ];then
        (
            cd $GITHUB_WORKSPACE/openwrt
            echo "[Info] Run AFTER_CLONE_SH=$GITHUB_WORKSPACE/$AFTER_CLONE_SH"
            bash "$GITHUB_WORKSPACE/$AFTER_CLONE_SH"
        )
    fi
)

