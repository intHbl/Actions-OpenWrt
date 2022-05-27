#!/bin/sh

FLAG_DONE=false

## by_usb_disk
ffff(){
    success="/tmp/__INSTALL_SUCCESS__"
    date > "$success"

    for sss in "$1/"*/INSTALL.SH;do
        if [ -f "$sss" ];then
            echo "[INFO] run $ssss"
            sh "$sss" "$success"
            if grep -E "^OK$" "$success";then
                FLAG_DONE=true
                echo "[OK] done:: installed."
            else
                echo "[..] do install, but not successful. or can not finished."
            fi
        fi
    done
}

for i in 1 2 3;do
    if [ -e /dev/sda ];then
        break
    fi

    if [ -e /dev/sdb ];then
        break
    fi

    if [ -e /dev/sdc ];then
        break
    fi

    sleep 10
done

for i in /dev/sd*[123];do
    if [ -e "$i" ];then
        echo "$i"
        name="$(basename "$i")"
        mntp="/tmp/mntHERE/$name"
        mkdir -p  "$mntp" || true
        if mount "$i" "$mntp";then
            ffff "$mntp" | tee /tmp/__auto_init__.log
        fi
    fi

    if $FLAG_DONE;then
        exit 0
    fi
done

echo "[?] did not finished!!!"

#### #####
## by_network wget
# wget --no-check-certificate https://server.lan/data/ -o /dev/null -O  /tmp/INIT_FILE.tar.gz
# tar -zxvf ...

