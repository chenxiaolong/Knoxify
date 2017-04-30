#!/system/bin/sh
MODDIR=${0%/*}

{
    echo "- Starting post-fs-data hook at $(date)"

    # Fake KNOX status
    /data/magisk/resetprop ro.boot.warranty_bit 0
    /data/magisk/resetprop ro.warranty_bit 0

    # Allow us to kill mobicore
    /data/magisk/magiskpolicy --live \
        "allow su tee process { signal }"

    # Prevent TIMA trustlet from being loaded
    trustlet_path=/system/app/mcRegistry/ffffffffd0000000000000000000000a.tlbin
    if [ -f "${trustlet_path}" ]; then
        mount --bind /dev/null "${trustlet_path}"
    fi

    # Restart mobicore
    killall mcDriverDaemon
} &>/cache/knoxify.log
