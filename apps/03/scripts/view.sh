#!/bin/ash

if [ -n $1 ]; then
        echo "$1"
fi

tail -f /mnt/file.txt
