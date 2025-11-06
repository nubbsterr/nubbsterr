#!/usr/bin/env bash

# Reload waybar + send notif
# If you want the vertical bar, then specify the config/css path arguments with -c and -s respectively
pkill waybar; waybar &
notify-send "Waybar reloaded!"
