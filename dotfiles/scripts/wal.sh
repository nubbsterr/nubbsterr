#!/usr/bin/env bash

# load new wallpaper and load new pywal colours
# also checks if on hyprland or niri

WALLS_DIR="$HOME/walls"
WALLPAPER=$(hellpaper $WALLS_DIR)

# since hellpaper doesn't send an error if nothing is selected
test -f "$WALLPAPER" || exit 1

# scheme-neutral and content are also good themes to pick
matugen image $WALLPAPER -t scheme-tonal-spot -m "dark"
swww img --transition-type any --transition-duration 2 $WALLPAPER
notify-send "Wallpaper set to $WALLPAPER."
