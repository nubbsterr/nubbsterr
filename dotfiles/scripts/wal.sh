#!/usr/bin/env bash

# load new wallpaper and load new pywal colours using fuzzel!
# also checks if on hyprland or niri

WALLS_DIR="$HOME/walls"
SELECTED=$(find "$WALLS_DIR" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) -exec basename {} \; | fzf --preview 'chafa -f sixels -s 50x50 /home/nubb/walls/{}') || exit 0
WALLPAPER="$WALLS_DIR/$SELECTED"

# haishoku backend needs python-setuptools from Extra + python-haishoku from AUR!
wal -i $WALLPAPER -n --backend haishoku
swww img -t center --transition-duration 2 $WALLPAPER
notify-send "Wallpaper set to $WALLPAPER."
