#!/usr/bin/env bash

# load new wallpaper and load new pywal colours using fuzzel!
# also checks if on hyprland or niri

WALLS_DIR="$HOME/walls"

SELECTED=$(find "$WALLS_DIR" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) -exec basename {} \; | fuzzel --dmenu --prompt "Select wallpaper: ")

if [[ -z "$SELECTED" ]]; then
    notify-send "No wallpaper selected."
    exit 1
fi

WALLPAPER="$WALLS_DIR/$SELECTED"

if [[ ! -f "$WALLPAPER" ]]; then
    notify-send "Error: Selected wallpaper $WALLPAPER does not exist."
    exit 1
fi

wal -i $WALLPAPER
if [[ $XDG_SESSION_DESKTOP != "Hyprland" ]]; then
    pkill swaybg
    swaybg -i $WALLPAPER -m fil &l
    notify-send "Wallpaper set using swaybg to $1."
else
    hyprctl hyprpaper reload ,"$WALLPAPER"
    echo "preload = $(realpath $WALLPAPER)" > ~/.config/hypr/hyprpaper.conf
    echo "wallpaper = , $(realpath $WALLPAPER)" >> ~/.config/hypr/hyprpaper.conf
notify-send "Wallpaper set using hyprpaper to $WALLPAPER."
fi
