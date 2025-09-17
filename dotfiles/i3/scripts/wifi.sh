#!/bin/sh
connected=$(nmcli -t -f TYPE,STATE device | grep 'wifi:connected')
if [ -n "$connected" ]; then
  info=$(nmcli dev wifi | grep '^\*')
  ssid=$(echo "$info" | awk '{print $3}')
  signal=$(echo "$info" | awk '{print $8}')
  echo "$ssid ($signal%)   "
else
  echo "<span color='#FF0000'>Disconnected   </span>"
fi
