#!/bin/bash

# after feeds update & install
# Load custom configuration

echo "[fix] for v2..."

# dir : $GITHUB_WORKSPACE==/home/runner/work/<repoName>/<repoName>/
cd $GITHUB_WORKSPACE/openwrt/

(
    mkdir -p staging_dir/host/bin
    ln -s "`which upx`" staging_dir/host/bin/upx
    ln -s "`which upx-ucl`" staging_dir/host/bin/upx-ucl
)

(
    # Modify default IP
    sed -i 's/192.168.1.1/172.22.0.1/g' package/base-files/files/bin/config_generate

    # 修改Files大法权限
    if [ -d "files/" ];then
        chmod -R 755 files/
    else
        echo "[..] files/ is not a dir or not exists."
    fi
)

(
    cd $GITHUB_WORKSPACE
    echo "[INFO] current path(GITHUB_WORKSPACE):`pwd`"
    tree -L 1
)

echo "--------------"
echo "[INFO] current path:`pwd`"
tree -L 2

