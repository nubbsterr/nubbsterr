#!/usr/bin/env bash

# load new wallpaper and load new pywal colours using fuzzel!
# also checks if on hyprland or niri

WALLS_DIR="$HOME/walls"

SELECTED=$(find "$WALLS_DIR" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) -exec basename {} \; | fuzzel --dmenu --prompt "Select wallpaper: ") || exit 0

WALLPAPER="$WALLS_DIR/$SELECTED"

# only doing this cuz 1) looks pretty and 2) colourschemes are mega broken rn lul
wal -i $WALLPAPER --theme tokyonight-moon
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
