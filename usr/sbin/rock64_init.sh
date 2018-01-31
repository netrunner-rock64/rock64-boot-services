#!/bin/sh

for x in $(cat /proc/cmdline); do
  case ${x} in 
    timestamp=*) export timestamp=${x#*=} ;;
  esac
done

# Console unblack
echo 0 > /sys/class/graphics/fb0/blank

if [ -n "$timestamp" ]; then
DT=`date +%Y%m%d`
	if [ "$DT" -lt "$timestamp" ]; then
		date -s "$timestamp"
  fi
fi

timedatectl set-ntp 1
