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
)

