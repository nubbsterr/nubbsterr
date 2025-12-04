#!/usr/bin/env bash
# taken from https://github.com/newmanls/dotfiles/blob/main/.local/bin/notify-backlight

case $1 in
    up)   brightnessctl set +5% ;;
    down) brightnessctl set 5%- ;;
esac

brightness=$(brightnessctl get)
# no other icons without an icon pack at least
icon='/usr/share/icons/Adwaita/symbolic/status/display-brightness-symbolic.svg'

notify-send \
    "$brightness%" \
    -i $icon \
    -h int:value:$brightness \
    -h string:x-dunst-stack-tag:brightness
