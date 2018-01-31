#!/bin/sh

# Console unblack
echo 0 > /sys/class/graphics/fb0/blank

if [ -n "$timestamp" ]; then
DT=`date +%Y%m%d`
	if [ "$DT" -lt "$timestamp" ]; then
		date -s "$timestamp"
  fi
fi

timedatectl set-ntp 1
