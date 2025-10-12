#!/usr/bin/env bash
vol_info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
vol=$(echo "$vol_info" | grep -o '[0-9.]*' | awk '{print int($1 * 100)}')
muted=$(echo "$vol_info" | grep -q '[MUTED]' && echo "yes" || echo "no")
if [ "$muted" = "yes" ]; then
  echo "<span color='#FF0000'>  Muted </span>"
else
  echo "  $vol% "
fi
