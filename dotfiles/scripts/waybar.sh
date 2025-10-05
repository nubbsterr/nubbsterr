#!/usr/bin/env bash

# Reload waybar + send notif 
pkill waybar; waybar &
notify-send "Waybar reloaded!"
