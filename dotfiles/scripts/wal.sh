#!/usr/bin/env bash

# load new wallpaper and load new pywal colours
# check firstly if on hyprland or niri
wal -i $1
if [[ $XDG_SESSION_DESKTOP != "Hyprland" ]]; then
    pkill swaybg
    swaybg -i $1 -m fil &l
    notify-send "Wallpaper set using swaybg to $1."
else
    hyprctl hyprpaper reload ,"$1"
    echo "preload = $(realpath $1)" > ~/.config/hypr/hyprpaper.conf
    echo "wallpaper = , $(realpath $1)" >> ~/.config/hypr/hyprpaper.conf
notify-send "Wallpaper set using hyprpaper to $1."
fi
