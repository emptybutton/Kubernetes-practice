#!/bin/ash

if [ -z $1 ]; then
	output=X
else
	output=$1
fi

while true; do
	echo $output >> /mnt/file.txt
	sleep 1
done
