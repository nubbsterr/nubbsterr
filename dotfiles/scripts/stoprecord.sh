#!/usr/bin/env bash

PIDFILE=/tmp/recordPID
STATUS=/tmp/recordingstatus

if [[ ! -f "$PIDFILE" ]]; then
    notify-send -u critical "No recording active (no PID file)!"
    exit 1
fi

pkill -RTMIN+9 waybar || notify-send -u critical "Failed to signal Waybar to update recording!"
 
# -15 to terminate gracefully, to stop recording
kill -15 "$(cat /tmp/recordPID)"

rm -f $PIDFILE
rm -f $STATUS
notify-send "Stopped recording!"
