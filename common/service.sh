#!/system/bin/sh
MODDIR=${0%/*}

{
    echo "- Starting service hook at $(date)"

    # Disable TIMA (for Samsung Health)
    /data/magisk/resetprop ro.config.tima 0
} &>>/cache/knoxify.log
