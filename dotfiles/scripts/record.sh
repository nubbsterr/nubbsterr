#!/usr/bin/env bash

PIDFILE=/tmp/recordPID
STATUS=/tmp/recordingstatus

# shrimple stuff w/ nvenc encoding to use GPU, 80mbps bitrate
wf-recorder --audio -g "$(slurp)" -f ~/recording-$(date +%Y%m%d-%H:%M:%S).mp4 -c h264_vaapi -x yuv420p -r 30 -p preset=medium -p rc=vbr -p bitrate=6000k

# save the recording PID to kill later
echo "$!" > $PIDFILE
echo "Rec " > $STATUS
pkill -RTMIN+9 waybar || notify-send -u critical "Failed to signal Waybar to update recording!"

notify-send "Started recording!"
