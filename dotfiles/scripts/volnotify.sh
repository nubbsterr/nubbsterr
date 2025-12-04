#!/usr/bin/env bash
# taken from https://github.com/newmanls/dotfiles/blob/main/.local/bin/notify-pulse

set -euo pipefail
step=1

case "${1:-}" in
    up)
        pactl set-sink-mute @DEFAULT_SINK@ 0
        pactl set-sink-volume @DEFAULT_SINK@ "+${step}%" ;;
    down)
        pactl set-sink-mute @DEFAULT_SINK@ 0
        pactl set-sink-volume @DEFAULT_SINK@ "-${step}%" ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
esac

vol=$(pactl get-sink-volume @DEFAULT_SINK@ | cut -s -d/ -f2 | tr -d " %")
volume="${vol}%"
is_muted=$(pactl get-sink-mute @DEFAULT_SINK@ | sed -n "s/Mute: //p")

if [ "${is_muted}" = "yes" ]; then
    volume="muted"
    icon="/usr/share/icons/Adwaita/symbolic/status/audio-volume-muted-symbolic.svg"
elif (( vol == 0 )); then
    icon="/usr/share/icons/Adwaita/symbolic/status/audio-volume-muted-symbolic.svg"
elif (( vol <= 30 )); then
    icon="/usr/share/icons/Adwaita/symbolic/status/audio-volume-low-symbolic.svg"
elif (( vol <= 70 )); then
    icon="/usr/share/icons/Adwaita/symbolic/status/audio-volume-medium-symbolic.svg"
else
    icon="/usr/share/icons/Adwaita/symbolic/status/audio-volume-high-symbolic.svg"
fi

notify-send \
    "${volume}" \
    -i "${icon}" \
    -h int:value:"${vol}" \
    -h string:x-dunst-stack-tag:volume
