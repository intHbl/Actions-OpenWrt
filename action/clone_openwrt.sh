#!/bin/bash

      #working-directory: /workdir
(
    cd  /workdir
    df -hT $PWD
    git clone --single-branch -b $REPO_BRANCH $REPO_URL  openwrt
    ln -sf /workdir/openwrt $GITHUB_WORKSPACE/openwrt
)

