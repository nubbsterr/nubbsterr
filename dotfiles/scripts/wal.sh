#!/usr/bin/env bash

# load new wallpaper and load new pywal colours
# also checks if on hyprland or niri

WALLS_DIR="$HOME/walls"
SELECTED=$(find "$WALLS_DIR" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) -exec basename {} \; | fzf --preview 'chafa -s 50x50 /home/nubb/walls/{}') || exit 0
WALLPAPER="$WALLS_DIR/$SELECTED"

matugen image $WALLPAPER -m "dark"
swww img --transition-type center --transition-duration 2 $WALLPAPER
notify-send "Wallpaper set to $WALLPAPER."
